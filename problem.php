<?php

// funny story with this file: during the competition my apache started to crash
// and I had to work on the server. it turned out to be a problem with a wrong
// version of libmysql.dll (see http://bugs.php.net/bug.php?id=46842 )

$dsn = 'mysql:dbname=sk17user12;host=localhost';
$user = 'sk17user12';
$password = 'd2vat=ujur';

$database = new PDO($dsn, $user, $password);

$statement = $database->prepare('SELECT `id`, `name` FROM test');
$statement->execute();

$result = $statement->fetchAll();
print_r($result);
