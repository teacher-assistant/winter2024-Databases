<?php

$servername = "localhost";
$username = "username";
$passowrd = "password";

$conn = new mysqli($servername, $username, $passowrd);

if ($conn->connect_error){
    return die("Connection failed.");
}
echo "Connected sucessfully to " . $servername; 


$conn->close();