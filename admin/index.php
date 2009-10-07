<?php

require_once '../includes/app.inc.php';

if ($xml->role != 'admin') {
	header('Location: /');
	exit;
}

$stmt = $db->prepare("SELECT * FROM `users` WHERE `type` = 'employer'");
$stmt->execute(array($id));

$xml->add('employers', $stmt->fetchAll());


if ($_SERVER['REQUEST_METHOD'] == 'POST') {

	if (isset($_POST['approve'])) {
			
		$stmt = $db->prepare('SELECT * FROM `users` WHERE `id` = ?');
		$stmt->execute(array($values->id));

		foreach ($stmt->fetchAll() as $user) {
				
			// user approved
			$stmt = $db->prepare('UPDATE `users` SET `approved` = 1 WHERE `id` = ?');
			$stmt->execute(array($values->id));
				
			$text = <<<EOD
		
Your registration has been approved. You can now log in: http://sk17user12/auth/login.php
			
EOD;
				
			mail($user['email'], utf8_decode('[Skills/Compétences Canada] Registration approved'), utf8_decode($text));
				
			$_SESSION['sk17user12_message'] = 'Employer has been approved.';
				
			session_commit();
				
			header('Location: /admin/');
		}
	} else if (isset($_POST['delete'])) {
			
		$stmt = $db->prepare('DELETE FROM `users` WHERE `id` = ?');
		$stmt->execute(array($values->id));

		$_SESSION['sk17user12_message'] = 'Employer deleted.';
			
		session_commit();
			
		header('Location: /admin/');
	} else {
			
		$stmt = $db->prepare('SELECT * FROM `users` WHERE `id` = ?');
		$stmt->execute(array($values->id));

		foreach ($stmt->fetchAll() as $user) {
				
			// user denied
			$text = <<<EOD
		
Your registration has been denied.

EOD;
				
			mail($user['email'], utf8_decode('[Skills/Compétences Canada] Registration denied'), utf8_decode($text));
				
			$_SESSION['sk17user12_message'] = 'Employer has been denied.';
				
			session_commit();
				
			header('Location: /admin/');
		}
	}
}

$template = new Template('admin/employers.xsl');
$template->display($xml);
