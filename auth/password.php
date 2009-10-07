<?php

require_once '../includes/app.inc.php';

if ($xml->user == '') {
	header('Location: /');
	exit;
}

$errors = $xml->addChild('errors');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

	if ($values->password == '') {
		$errors->password = 'Required field.';
	} else if ($values->repeat == '') {
		$errors->repeat = 'Required field.';
	} else if ((string) $values->repeat != (string) $values->password) {
		$errors->repeat = 'Repeat must match.';
	}

	if (count($errors) == 0) {
		$stmt = $db->prepare('UPDATE `users` SET `password` = ? WHERE `id` = ?');
		$key = makekey();

		$stmt->execute(array(sha1($values->password), $xml->user));

		$_SESSION['sk17user12_message'] = 'Password successfully changed.';

		session_commit();

		header('Location: /');
	}
}

$template = new Template('auth/password.xsl');
$template->display($xml);
