<?php

require_once '../includes/app.inc.php';

$id = get($_GET['id']);
$key = get($_GET['key']);

$stmt = $db->prepare('SELECT * FROM `users` WHERE `id` = ? AND `confirmation` = ?');
$stmt->execute(array($id, $key));

foreach ($stmt->fetchAll() as $user) {
	
	// user confirmed
	$stmt = $db->prepare('UPDATE `users` SET `confirmed` = 1 WHERE `id` = ?');
	$stmt->execute(array($id));
	
	$text = <<<EOD

A new employer has registered, please approve or deny him in the admin: http://sk17user12/admin/
	
EOD;
	
	mail('sk17user12admin@wsc-sk17-02.wsc2009.local', utf8_decode('[Skills/Compétences Canada] Approve employer'), utf8_decode($text));
	
	$_SESSION['sk17user12_message'] = 'Thanks for confirmation of your registration. You will be informed as soon as an admin approves your account.';
	
	session_commit();
}
	
header('Location: /');
