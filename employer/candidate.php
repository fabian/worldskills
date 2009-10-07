<?php

require_once '../includes/app.inc.php';

if ($xml->role != 'employer') {
	header('Location: /employer/');
	exit;
}

$stmt = $db->prepare('SELECT * FROM `provinces` ORDER BY `sort`');
$stmt->execute();
$xml->add('provinces', $stmt->fetchAll());

$stmt = $db->prepare('SELECT * FROM `categories`');
$stmt->execute();
$xml->add('categories', $stmt->fetchAll());

$id = get($_GET['id']);

$stmt = $db->prepare("SELECT * FROM `users` WHERE `id` = ? AND `type` = 'candidate'");
$stmt->execute(array($id));

$xml->add('candidates', $stmt->fetchAll());

$template = new Template('employer/candidate.xsl');
$template->display($xml);
