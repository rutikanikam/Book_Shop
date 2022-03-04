<?php

$databaseHost = 'localhost';   //your db host 
$databaseName = 'book_shop_db';  //your db name 
$databaseUsername = 'root';    //your db username 
$databasePassword = '';//   db password 

$conn = mysqli_connect($databaseHost, $databaseUsername, $databasePassword, $databaseName); 
 

$conn->set_charset("utf8");

if (mysqli_connect_errno())
{
echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
?>
