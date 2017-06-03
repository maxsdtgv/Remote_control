<?php
error_reporting(0);
$userdb = $_POST['name'];
$passdb = $_POST['password'];

if ($userdb == '') header("Location: /index.html");

$dbcnx= mysql_connect("127.0.0.1",$userdb,$passdb) or die("<html><BODY BGCOLOR=#4A6B7C>
                                                    <Script Language='JavaScript'>
                                                    alert('Incorect login or password.')
                                                    document.location='/index.html'
                                                    </Script></BODY></html>");
session_start();
$_SESSION['nnn']=$userdb;
$_SESSION['ppp']=$passdb;
$_SESSION['name_db']="Module";
$_SESSION['broadcast_ip']="192.168.1.255";
$_SESSION['network_ip']="192.168.1.0";
$_SESSION['network_mask']="192.168.1.0";
$_SESSION['server_port']="50051";
$_SESSION['client_port']="50050";
mysql_close($dbcnx);
header("Location: /cgi-bin/start.php");
?>
