<?php

require_once 'util.inc.php';
require_once 'template.inc.php';
require_once 'database.inc.php';

session_start();

$xml = new XML('<page />');

$values = $xml->add('values', $_POST);

if (isset($_GET['font'])) {
	$_SESSION['sk17user12_font'] = $_GET['font'];
}
$xml['font'] = get($_SESSION['sk17user12_font'], 'small');


if (isset($_GET['lang'])) {
	$_SESSION['sk17user12_lang'] = $_GET['lang'];
}
$xml['lang'] = get($_SESSION['sk17user12_lang'], 'en');

// load lang
$xml->addChild('lang');
$xml->lang(simplexml_load_file(dirname(__FILE__) . '/../lang/en.xml'), $xml->lang);

if ($xml['lang'] == 'fr') {
	$xml->lang(simplexml_load_file(dirname(__FILE__) . '/../lang/fr.xml'), $xml->lang);
}

$xml->user = '';
$xml->username = '';
$xml->role = 'visitor';

$id = get($_SESSION['sk17user12_user'], 0);

$stmt = $db->prepare('SELECT * FROM `users` WHERE `id` = ?');
$stmt->execute(array($id));
$user = $stmt->fetch();
if ($user) {
	$xml->user = $user['id'];
	$xml->username = $user['firstname'] . ' ' . $user['lastname'];
	$xml->role = $user['type'];
}

if (isset($_SESSION['sk17user12_message'])) {
	$xml->message = $_SESSION['sk17user12_message'];
	unset($_SESSION['sk17user12_message']);
}
