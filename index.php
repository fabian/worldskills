<?php

require_once 'includes/app.inc.php';

$stmt = $db->prepare("SELECT COUNT(*) AS `count` FROM `users` WHERE type = 'employer'");
$stmt->execute();
$xml->add('employers', $stmt->fetchAll());

$stmt = $db->prepare("SELECT COUNT(*) AS `count` FROM `users` WHERE type = 'candidate'");
$stmt->execute();
$xml->add('candidates', $stmt->fetchAll());

$stmt = $db->prepare("SELECT COUNT(*) AS `count` FROM `jobs`");
$stmt->execute();
$xml->add('jobs', $stmt->fetchAll());

$template = new Template('home.xsl');
$template->display($xml);
