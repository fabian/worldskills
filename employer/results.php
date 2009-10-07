<?php

require_once '../includes/app.inc.php';

$template = new Template('employer/results.xsl');
$template->display($xml);
