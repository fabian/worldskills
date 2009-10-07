<?php

require_once '../includes/app.inc.php';

$template = new Template('employer/makeiteasy.xsl');
$template->display($xml);
