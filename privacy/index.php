<?php

require_once '../includes/app.inc.php';

$template = new Template('privacy.xsl');
$template->display($xml);
