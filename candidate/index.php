<?php

require_once '../includes/app.inc.php';

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

	if ($values->firstname == '') {
		$errors->firstname = 'Required field.';
	}

	if ($values->lastname == '') {
		$errors->lastname = 'Required field.';
	}

	if ($values->email == '') {
		$errors->email = 'Required field.';
	} else {
		$stmt = $db->prepare('SELECT COUNT(*) AS `count` FROM `users` WHERE email = ?');
		$stmt->execute(array($values->email));
		$result = $stmt->fetch();
		
		if ($result['count'] > 0) {
			$errors->email = 'Address already used by someone else.';
		}
	}

	if ($values->password == '') {
		$errors->password = 'Required field.';
	} else if ($values->repeat == '') {
		$errors->repeat = 'Required field.';
	} else if ((string) $values->repeat != (string) $values->password) {
		$errors->repeat = 'Repeat must match.';
	}

	if ($values->company == '') {
		$errors->company = 'Required field.';
	}

	if ($values->phone == '') {
		$errors->phone = 'Required field.';
	}

	if ($values->street == '') {
		$errors->street = 'Required field.';
	}

	if ($values->city == '') {
		$errors->city = 'Required field.';
	}

	if ($values->province == '') {
		$errors->province = 'Required field.';
	}

	if ($values->category == '') {
		$errors->category = 'Required field.';
	}
	
	if (count($errors) == 0) {
		$stmt = $db->prepare('INSERT INTO `users` (title, firstname, lastname, email, password, company, phone, fax, cell, street, postal, city, province, category, confirmation, approved, type, ip) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1, ?, ?)');
		$key = makekey();
		
		if ($stmt->execute(array(
			$values->title,
			$values->firstname,
			$values->lastname,
			$values->email,
			sha1($values->password),
			$values->company,
			$values->phone,
			$values->fax,
			$values->cell,
			$values->street,
			$values->postal,
			$values->city,
			$values->province,
			$values->category,
			$key,
			'candidate',
			$_SERVER['REMOTE_ADDR'],
		))) {
			
			$id = $db->lastInsertId();
			
			$text = <<<EOD

Please confirm your registration: http://sk17user12/candidate/confirm.php?id=$id&key=$key
			
EOD;
			
			mail($values->email, utf8_decode('[Skills/Compétences Canada] Confirm registration'), utf8_decode($text));
			
			$_SESSION['sk17user12_message'] = 'Thanks for registration. Please check your mail for confirmation link.';
			
			session_commit();
			
			header('Location: /');
		}
	}
}

$template = new Template('candidate/register.xsl');
$template->display($xml);
