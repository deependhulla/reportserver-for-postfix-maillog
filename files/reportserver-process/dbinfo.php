<?php

error_reporting(E_ERROR);

#### add in php.ini file
##mysqli.allow_local_infile = On
##mysqli.local_infile_directory = /data


$ebdbname="Syslog";
$ebdbuser="root";
$ebdbhost="localhost";
$ebdbpass="";


$dblink = mysqli_connect("$ebdbhost", "$ebdbuser", "$ebdbpass") or die("Could not connect MySQL  check user/pass/host");
mysqli_select_db($dblink,$ebdbname) or die("Could : not select database $ebdbname");

?>
