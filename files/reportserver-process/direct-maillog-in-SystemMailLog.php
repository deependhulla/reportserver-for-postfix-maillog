<?php
include_once('dbinfo.php');

$filein=$argv[1];

if(file_exists($filein))
{
print "\nReading ".$filein;
$linecount=0;
$lc="cat \"".$filein."\" | wc -l";
$linecount=`$lc`; $linecount=str_replace("\n","",$linecount);$linecount=str_replace("\r","",$linecount);
print "\n".$linecount." Lines to Read...\nStarting @ ".`date`;

$sqlx="LOAD DATA LOCAL INFILE '".$filein."' REPLACE INTO TABLE `tmp-maillog` LINES TERMINATED BY '\n' (`mailloglines`) ";

$upqueryresult = $dblink->query($sqlx);
if (!$upqueryresult)
{
echo "MySQL Load Data Import Error ".mysqli_error($dblink);
}
print "Ending @ ".`date`;
///if file exisit over.
}
else
{
print "Please give Proper MailLog file path";
}
print "\n";
print "\n";
?>
