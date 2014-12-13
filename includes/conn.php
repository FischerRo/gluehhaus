<?php

/*** mysql hostname ***/
// $hostname = 'localhost';
$hostname = 'damo-ws2014.cjwjwimid7kf.eu-central-1.rds.amazonaws.com';

/*** mysql username ***/
$username = 'gluehmeister';

/*** mysql password ***/
$password = 'weinmarsch';

/*** connect to the database ***/
$link = @mysql_connect($hostname, $username, $password);

/*** select the database ***/
$db = mysql_select_db('gluehhaus', $link);

mysql_query("SET NAMES 'utf8'");

?>