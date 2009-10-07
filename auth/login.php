<?php

require_once '../includes/app.inc.php';

$errors = $xml->addChild('errors');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

	if ($values->email == '') {
		$errors->email = 'Required field.';
	}

	if ($values->password == '') {
		$errors->password = 'Required field.';
	}

	if (count($errors) == 0) {

		$stmt = $db->prepare('SELECT * FROM `users` WHERE `email` = ? AND `password` = ?');

		if ($stmt->execute(array((string) $values->email, sha1($values->password)))) {

			$user = $stmt->fetch();

			if ($user) {

				if ($user['confirmed'] != '1') {
					$errors->email = 'Please confirm your registration first.';
				} else if ($user['approved'] != '1') {
					$errors->email = 'Approval through administrator required.';
				} else {
					$_SESSION['sk17user12_user'] = $user['id'];
					$_SESSION['sk17user12_message'] = 'You are now logged in.';
	
					session_commit();
	
					header('Location: /');
				}
			} else {
				$errors->password = 'Email Address and Password do not match!';
			}
		}
	}
}

$template = new Template('auth/login.xsl');
$template->display($xml);
