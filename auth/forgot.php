<?php

require_once '../includes/app.inc.php';

$errors = $xml->addChild('errors');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

	if ($values->email == '') {
		$errors->password = 'Required field.';
	} else {
		$stmt = $db->prepare('SELECT COUNT(*) AS `count` FROM `users` WHERE email = ?');
		$stmt->execute(array($values->email));
		$result = $stmt->fetch();
		
		if ($result['count'] == 0) {
			$errors->email = 'No user with this address found.';
		}
	}

	if (count($errors) == 0) {
		
		$password = makekey();

		$stmt = $db->prepare('SELECT * FROM `users` WHERE `email` = ?');
		$stmt->execute(array($values->email));
		
		$user = $stmt->fetch();
		
		$stmt = $db->prepare('UPDATE `users` SET `password` = ? WHERE `id` = ?');

		$stmt->execute(array(sha1($password), $user['id']));
		
		$text = <<<EOD

Your new password: $password
			
EOD;
		mail($user['email'], utf8_decode('[Skills/Compétences Canada] New password'), utf8_decode($text));
		
		$_SESSION['sk17user12_message'] = 'New password sent by mail.';

		session_commit();

		header('Location: /auth/login.php');
	}
}

$template = new Template('auth/forgot.xsl');
$template->display($xml);
