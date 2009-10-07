<?php

require_once '../includes/app.inc.php';

if ($xml->role != 'employer') {
	header('Location: /employer/');
	exit;
}

$id = get($_GET['id']);

$stmt = $db->prepare("SELECT `resumes`.* FROM `resumes` INNER JOIN `jobs` ON `jobs`.`id` = `resumes`.`job` WHERE `resumes`.`id` = ? AND `jobs`.`user` = ?");
$stmt->execute(array($id, $xml->user));

$stmt->bindColumn(1, $id, PDO::PARAM_INT);
$stmt->bindColumn(2, $user, PDO::PARAM_INT);
$stmt->bindColumn(3, $job, PDO::PARAM_INT);
$stmt->bindColumn(4, $upload, PDO::PARAM_LOB);
$stmt->bindColumn(5, $filename, PDO::PARAM_STR, 255);
$stmt->bindColumn(6, $application, PDO::PARAM_LOB);

if ($stmt->fetch(PDO::FETCH_BOUND)) {
	
	$file = tempnam('../temp', 'zip');
	
	$zip = new ZipArchive();
	$zip->open($file, ZIPARCHIVE::OVERWRITE);
	
	$zip->addFromString($filename, $upload);
	
	$zip->addFromString('application.txt', $application);
	
	$stmt = $db->prepare("SELECT * FROM `users` WHERE `id` = ?");
	$stmt->execute(array($user));
	
	$user = $stmt->fetch();
	$name = $user['firstname'] . ' ' . $user['lastname'];
	$phone = $user['phone'];
	$cell = $user['cell'];
	$fax = $user['fax'];
	$address = $user['street'] . ', ' . $user['postal'] . ', ' . $user['city'];
	
	$text = <<<EOD
Name: $name
Company: $company
Phone: $phone
Cell: $cell
Fax: $fax
Address: $address

EOD;
	
	$zip->addFromString('user.txt', $text);
	$zip->close();
	
	header('Content-type: application/zip');
	header('Content-Disposition: attachment; filename="resume.zip"');
	
	readfile($file);
	
	unlink($file);
} else {
	header('Location: /employer/resumes.php');
}
