<?php
include_once '../includes/version.php';
include_once '../eveconfig/eveconfig.php';
mysql_connect($dbconfig['dbhost'], $dbconfig['dbuname'], $dbconfig['dbpass']);
mysql_select_db($dbconfig['dbname']);

// Ask the database for the information from the links table 
$query="UPDATE skillsheet_apis SET implants='$implants' WHERE name='$name' and vCode='$vCode' and keyID='$keyID'";
mysql_select_db($dbconfig['dbname']) or die( "Unable to select database");

mysql_query($query); 
echo '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
  <meta content="text/html; charset=UTF-8" http-equiv="Content-Type" />
  <meta name="description" content="Eve Online Skill sheet" />
  <meta name="robots" content="index,follow" />
  <meta name="resource-type" content="document" />
  <meta http-equiv="expires" content="0" />
  <meta name="author" content="Eve Online" />
  <meta name="copyright" content="Copyright (c) 2012 The Xenodus Initiative." />
  <meta name="revisit-after" content="1 days" />
  <meta name="distribution" content="Global" />
  <meta name="generator" content="Eve Online" />
  <meta name="rating" content="General" />
  <meta name="KEYWORDS" content="eveonline, skills" />
  <title>Skills Showroom</title>
  <style type="text/css">
  /*<![CDATA[*/
  body{font:8pt Verdana,Arial;padding:0;margin:0;color:white;background:#1B1B1B;}
*]-->.newsTitleImage{left:5px;float:left;margin-right:-40px;position:relative;}
.navdot{padding-right:5px;font-size:6pt;vertical-align:0;}
table.dataTable{border-right:#666 1px solid;border-top:#666 1px solid;}
.dataTableHeader{padding:5px;font-weight:bolder;font-size:10px;border-left:#666 1px solid;color:white;border-bottom:#666 1px solid;background:#434343;}
td.dataTableCell{padding:4px;font-size:10px;border-left:#666 1px solid;border-bottom:#666 1px solid;}
.headerribbon{margin:0;height:26px;line-height:30px;position:fixed;top:0;left:0;width:100%;z-index:100;font-weight:bold;border-bottom:1px solid gray;background:#2C2C38;vertical-align:middle;}
.headerleft{float:left;margin-left:10px;width:30%;z-index:160;}
.headerright{float:right;width:44%;margin-right:10px;text-align:right;}
.headerright2{float:right;width:20%;text-align:right;margin-right:10px;line-height:36px;}
.headerright3{float:right;width:20%;text-align:right;margin-right:10px;line-height:30px;}
.statusmsg{margin-top:50px;color:yellow;}
#skillsidebox{margin:0;height:250px;position:fixed;top:26px;left:0;width:260px;z-index:99;border-bottom:1px solid gray;border-right:1px solid gray;background:#2C2C38;vertical-align:middle;padding:15px 0 0 5px;opacity:0.80;}
.mcenter{margin-left:auto;margin-right:auto;}
.txtcenter{text-align:center;}
a,a:visited{color:gold;}
  /*]]>*/
  </style>  
</head>
<body bgcolor="#1B1B1B" style="height: 100%">

  <br /><br />
  <div id="content" class="mcenter" style="float:center;width:400px;margin-top:30px;" >
    <table summary="Characters List" style="border: #666666 1px solid; margin-left: 50px; width:300px;">
    <thead>
      <tr style="background: rgb(44, 44, 56);">
        <th colspan="<!--[$charcount]-->" class="dataTableHeader">Success!</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>Your characters implant data visibility settings have been changed.<br /><br />This will remove the values from your character sheet.<br /></td>
      </tr>   
     </tbody>
    </table>  
<br />
<br />
<br />
<br />
<br />
    <table style="margin: auto auto 20px; width: 70%;" summary="Copyright Info">
  <tbody>
    <tr>
      <td style="text-align: center;color:grey;">All images and logos are Copyright &copy; <a style="text-decoration: none;color:grey;" title="Copyright CCP" href="http://www.ccpgames.com/">CCP</a></td>
    </tr>
    <tr>
      <td style="text-align: center; font-size: x-small;"><a style="text-decoration: none;color:grey;" href="/stats" title="Character Stats">Top SP</a> / <a style="text-decoration: none;color:grey;" target="_blank" href="http://txsi.co.uk/trac/changeset/latest/" title="Changelog">';echo _SKILLSHEET_VERSION; echo'</a> / <a style="text-decoration: none;color:grey;" target="_blank" href="https://github.com/ShioR/EVE-Character-Showroom/issues/new" title="Feedback">Feedback</a>
</td>
</tr>
<tr>
<td>
<center><a style="font-size:xx-small; text-decoration:none; color:grey;" href="http://www.deepspacesupply.com/index.php/affiliate/index/listCategories/program_id/1/?429b1823f5a2afe=1&df08b0441bac900=3c59dc048e8850243be8079a5c74d079" target="_blank">Support the site, buy a GTC!</a></center>
</td>
</tr>
    </tr>
  </tbody>
  </table>
</body>
</html>'; 
mysql_close(); 
?>