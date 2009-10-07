<?php

$dsn = 'mysql:dbname=sk17user12;host=localhost';
$user = 'sk17user12';
$password = 'd2vat=ujur';

try {
    $db = new PDO($dsn, $user, $password);
    $db->exec("SET NAMES 'utf8'");
} catch (PDOException $e) {
    echo 'Please check file includes/database.inc.php, because database connection failed: ' . $e->getMessage();
}
