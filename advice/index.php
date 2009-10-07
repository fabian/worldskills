<?php

require_once '../includes/app.inc.php';

$template = new Template('advice.xsl');
$template->display($xml);
