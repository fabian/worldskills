<?php

require_once '../includes/app.inc.php';

$template = new Template('employer/visibility.xsl');
$template->display($xml);
