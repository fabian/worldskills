<?php

require_once '../includes/app.inc.php';

$template = new Template('copyright.xsl');
$template->display($xml);
