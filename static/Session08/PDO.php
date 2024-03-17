<?php
$servername = "localhost";
$username = "username";
$password = "password";

try {
  $conn = new PDO("mysql:host=$servername;dbname=comp353lab", $username, $password);
  
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  echo "Connected successfully to " . $servername;
} catch(PDOException $e) {
  echo "Connection failed: " . $e->getMessage();
}


$conn = null;