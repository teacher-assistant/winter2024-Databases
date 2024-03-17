<?php

$servername = "localhost";
$username = "username";
$password = "password";

$conn = mysqli_connect($servername, $username, $password);

if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}
echo "Connected successfully to " . $servername;

mysqli_close($conn);