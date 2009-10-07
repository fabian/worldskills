<?php

require_once '../includes/app.inc.php';

$template = new Template('legal.xsl');
$template->display($xml);
