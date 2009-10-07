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

$errors = $xml->addChild('errors');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

	if ($values->title == '') {
		$errors->title = 'Required field.';
	}

	if ($values->description == '') {
		$errors->description = 'Required field.';
	}

	if ($values->province == '') {
		$errors->province = 'Required field.';
	}

	if ($values->category == '') {
		$errors->category = 'Required field.';
	}

	if (count($errors) == 0) {
		
		 // insert into database using prepared statement to avoid SQL injection (HTML injection avoided using XSL output escaping)
		$stmt = $db->prepare('INSERT INTO `jobs` (user, title, description, province, category) VALUES (?, ?, ?, ?, ?)');
		
		if ($stmt->execute(array(
			$xml->user,
			$values->title,
			$values->description,
			$values->province,
			$values->category
		))) {
			
			$_SESSION['sk17user12_message'] = 'Job posted.';
			session_commit();
			
			header('Location: /joblisting/');
		}
	}
}

$template = new Template('employer/newjob.xsl');
$template->display($xml);

