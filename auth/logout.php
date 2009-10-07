<?php

require_once '../includes/app.inc.php';

session_destroy();
session_start();
session_regenerate_id();

$_SESSION['sk17user12_message'] = 'You are now logged out.';

session_commit();

header('Location: /');
