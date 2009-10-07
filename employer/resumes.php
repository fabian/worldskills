<?php

require_once '../includes/app.inc.php';

if ($xml->role != 'employer') {
	header('Location: /employer/');
	exit;
}

$stmt = $db->prepare('SELECT * FROM `users`');
$stmt->execute();
$xml->add('users', $stmt->fetchAll());

$stmt = $db->prepare('SELECT * FROM `jobs`');
$stmt->execute();
$xml->add('jobs', $stmt->fetchAll());

$stmt = $db->prepare("SELECT `resumes`.* FROM `resumes` INNER JOIN `jobs` ON `jobs`.`id` = `resumes`.`job` WHERE `jobs`.`user` = ?");
$stmt->execute(array($xml->user));

$xml->add('resumes', $stmt->fetchAll());

$template = new Template('employer/resumes.xsl');
$template->display($xml);
