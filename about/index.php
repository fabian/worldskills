<?php

require_once '../includes/app.inc.php';

$template = new Template('about.xsl');
$template->display($xml);
