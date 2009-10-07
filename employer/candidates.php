<?php

require_once '../includes/app.inc.php';

if ($xml->role != 'employer') {
	header('Location: /employer/');
	exit;
}

define('PER_PAGE', 5);

$page = get($_GET['page'], 0);
$keyword = get($_GET['keyword'], '');

$where = "WHERE type = 'candidate'";
$parameters = array();
if ($keyword != '') {
	$where = "WHERE type = 'candidate' AND (`users`.`title` LIKE ? OR `users`.`firstname` LIKE ? OR `users`.`lastname` LIKE ? OR `users`.`email` LIKE ? OR `users`.`company` LIKE ? OR `users`.`phone` LIKE ? OR `users`.`fax` LIKE ? OR `users`.`cell` LIKE ? OR `users`.`street` LIKE ? OR `users`.`postal` LIKE ? OR `users`.`city` LIKE ? OR `provinces`.`name` LIKE ? OR `categories`.`name` LIKE ?)";
	$parameters = array('%' . $keyword . '%', '%' . $keyword . '%', '%' . $keyword . '%', '%' . $keyword . '%', '%' . $keyword . '%', '%' . $keyword . '%', '%' . $keyword . '%', '%' . $keyword . '%', '%' . $keyword . '%', '%' . $keyword . '%', '%' . $keyword . '%', '%' . $keyword . '%', '%' . $keyword . '%');
}

$stmt = $db->prepare("SELECT COUNT(*) AS `count` FROM `users` INNER JOIN `provinces` ON `provinces`.`id` = `users`.`province` INNER JOIN `categories` ON `categories`.`id` = `users`.`category` $where");
$stmt->execute($parameters);
$xml->add('count', $stmt->fetchAll());

$xml->keyword = $keyword;
$xml->values->keyword = $keyword;

$offset = $page * PER_PAGE;

$xml->curpage = $page + 1;
$xml->maxpage = ceil($xml->count->object->count / PER_PAGE);
$xml->nextpage = ($page + 1) < $xml->maxpage ? $page + 1 : -1;
$xml->prevpage = $page > 0 ? $page - 1 : -1;

$stmt = $db->prepare("SELECT `users`.* FROM `users` INNER JOIN `provinces` ON `provinces`.`id` = `users`.`province` INNER JOIN `categories` ON `categories`.`id` = `users`.`category` $where ORDER BY `categories`.`name`, `provinces`.`name` LIMIT $offset, " . PER_PAGE);
$stmt->execute($parameters);
$xml->add('candidates', $stmt->fetchAll());

$stmt = $db->prepare('SELECT * FROM `provinces` ORDER BY `sort`');
$stmt->execute();
$xml->add('provinces', $stmt->fetchAll());

$stmt = $db->prepare('SELECT * FROM `categories`');
$stmt->execute();
$xml->add('categories', $stmt->fetchAll());

$template = new Template('employer/candidates.xsl');
$template->display($xml);
