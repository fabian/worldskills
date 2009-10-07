<?php

require_once '../includes/app.inc.php';

$stmt = $db->prepare('SELECT * FROM `provinces` ORDER BY `sort`');
$stmt->execute();
$xml->add('provinces', $stmt->fetchAll());

$stmt = $db->prepare('SELECT * FROM `categories`');
$stmt->execute();
$xml->add('categories', $stmt->fetchAll());

$id = get($_GET['id']);

$stmt = $db->prepare("SELECT * FROM `jobs` WHERE `id` = ?");
$stmt->execute(array($id));

$xml->add('jobs', $stmt->fetchAll());

$xml->jobs->object->description = nl2br(htmlentities($xml->jobs->object->description));

if ($xml->role == 'candidate' && $_SERVER['REQUEST_METHOD'] == 'POST') {

	if ($values->application == '') {
		$errors->application = 'Required field.';
	}
	
	if ($_FILES['file']['name']) {
		$errors->application = 'Error while upload.';
	}

	if (count($errors) == 0) {
		$stmt = $db->prepare('INSERT INTO `resumes` (user, job, upload, filename, application) VALUES (?, ?, ?, ?, ?)');
		
		$fp = fopen($_FILES['upload']['tmp_name'], 'rb');
		
		$stmt->bindParam(1, $xml->user);
		$stmt->bindParam(2, $id);
		$stmt->bindParam(3, $fp, PDO::PARAM_LOB);
		$stmt->bindParam(4, $_FILES['upload']['name']);
		$stmt->bindParam(5, $values->application);
		
		if ($stmt->execute()) {
			
			$_SESSION['sk17user12_message'] = 'Reply to job posted.';
			session_commit();
			
			header('Location: /joblisting/');
		}
	}
}

$template = new Template('jobs/view.xsl');
$template->display($xml);
