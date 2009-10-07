<?php

require_once '../includes/app.inc.php';

// LOOK ALL THE WAY DOWN TO SEE THE CLASS USED TO DISPLAY THE DATA

define('PER_PAGE', 5);

$sort = get($_GET['sort'], 'province');
$page = get($_GET['page'], 0);
$keyword = get($_GET['keyword'], '');

$where = 'WHERE 1';
$parameters = array();
if ($keyword != '') {
	$where = 'WHERE `jobs`.`title` LIKE ? OR `jobs`.`description` LIKE ? OR `provinces`.`name` LIKE ? OR `categories`.`name` LIKE ?';
	$parameters = array('%' . $keyword . '%', '%' . $keyword . '%', '%' . $keyword . '%', '%' . $keyword . '%');
}

$stmt = $db->prepare("SELECT COUNT(*) AS `count` FROM `jobs` INNER JOIN `provinces` ON `provinces`.`id` = `jobs`.`province` INNER JOIN `categories` ON `categories`.`id` = `jobs`.`category` $where");
$stmt->execute($parameters);
$xml->add('count', $stmt->fetchAll());

$xml->sort = $sort;
$xml->keyword = $keyword;
$xml->values->keyword = $keyword;

$offset = $page * PER_PAGE;

$xml->curpage = $page + 1;
$xml->maxpage = ceil($xml->count->object->count / PER_PAGE);
$xml->nextpage = ($page + 1) < $xml->maxpage ? $page + 1 : -1;
$xml->prevpage = $page > 0 ? $page - 1 : -1;

switch ($sort) {
	case 'category':
		$order = 'ORDER BY `categories`.`name`, `provinces`.`name`';
		break;
	default:
		$order = 'ORDER BY `provinces`.`name`, `categories`.`name`';
}

$stmt = $db->prepare("SELECT `jobs`.* FROM `jobs` INNER JOIN `provinces` ON `provinces`.`id` = `jobs`.`province` INNER JOIN `categories` ON `categories`.`id` = `jobs`.`category` $where $order LIMIT $offset, " . PER_PAGE);
$stmt->execute($parameters);
$xml->add('jobs', $stmt->fetchAll());

$stmt = $db->prepare('SELECT * FROM `provinces` ORDER BY `sort`');
$stmt->execute();
$xml->add('provinces', $stmt->fetchAll());

$stmt = $db->prepare('SELECT * FROM `categories`');
$stmt->execute();
$xml->add('categories', $stmt->fetchAll());

// HERE IS A CLASS USED TO DISPLAY THE DATA!
$template = new Template('jobs/index.xsl');
$template->display($xml);
