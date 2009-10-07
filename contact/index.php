<?php

require_once '../includes/app.inc.php';

$xml->email = hidemail('test@skillscanada.com');

$template = new Template('contact.xsl');
$template->display($xml);
