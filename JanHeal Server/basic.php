<?php
$bhID=$_REQUEST['bhid'];
$aadhar=$_REQUEST['aadhar'];
$name=$_REQUEST['name'];

$host="localhost";
$uname="root";
$pass="root";
$DB_NAME="BhamaHeal";

$conn=new mysqli($host,$uname,$pass,$DB_NAME);

$query="INSERT INTO basic(Bhamashah,aadhar,name) VALUES(\"".$bhID."\",\"".$aadhar."\",\"".$name."\")";


$result=$conn->query($query);
    echo $result;
?>
