<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
  <meta content="text/html; charset=UTF-8" http-equiv="Content-Type" />
  <meta name="description" content="Eve Online Skill sheet" />
  <meta name="robots" content="index,follow" />
  <meta name="resource-type" content="document" />
  <meta http-equiv="expires" content="0" />
  <meta name="author" content="Eve Online" />
  <meta name="copyright" content="Copyright (c) 2011 The Xenodus Initiative." />
  <meta name="revisit-after" content="1 days" />
  <meta name="distribution" content="Global" />
  <meta name="generator" content="Eve Online" />
  <meta name="rating" content="General" />
  <meta name="KEYWORDS" content="eveonline, skills" />
  <title>Skills Showroom</title>
<!--  <link rel="stylesheet" type="text/css" href="themes/default/style/default.css" /> -->
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
<div class="headerribbon">
  <span class="headerleft">Skillsheet: Settings</span>
  <span class="headerright"  style="color:gold;"><a href="/" title="Skills Shrowroom">Showroom: Characters List</a></span>
</div>

        <div id="content" style="margin-left:10px;width:70%;margin-top:50px;" >
          <div class="block-header2">Update API Key</div>
          <br />
        <form id="Update_API" name="Update_API" method='post' action='api_updated.php'>
        <table border='0' cellspacing='0' cellpadding='0' align='left'>
        <tr id='cat'>
        <tr>
          <td bgcolor='#1B1B1B'><strong>Old KeyID:</strong></td>
          <td bgcolor='#1B1B1B' align='center'><input type='text' class='bginput' name='keyID' ></td>
        </tr>
        <tr>
          <td bgcolor='#1B1B1B'><strong>New KeyID:</strong></td>
          <td bgcolor='#1B1B1B' align='center'><input type='text' class='bginput' name='keyID2' ></td>
        </tr>        
        <tr>
          <td bgcolor='#1B1B1B'><strong>Old Verification Code:</strong></td>
          <td bgcolor='#1B1B1B' align='center'><input type ='text' class='bginput' name='vCode' ></td>
        </tr>
        <tr>
          <td bgcolor='#1B1B1B'><strong>New Verification Code:</strong></td>
          <td bgcolor='#1B1B1B' align='center'><input type ='text' class='bginput' name='vCode2' ></td>
        </tr>    
        <td></td>
        <td bgcolor='#1B1B1B' align='center'><input type='submit' value='Update API Key'></td>
        </tr>
        <tr>
           <td colspan='2'></br></br><span class="newsmalltext">Your API keys can be found <a target="_blank" href="https://support.eveonline.com/api">here</a></span>.</td>
         </tr>
          </form>
        </div>          
<?
include '../eveconfig/eveconfig.php';
mysql_connect($dbconfig['dbhost'], $dbconfig['dbuname'], $dbconfig['dbpass']) or die(mysql_error());
mysql_select_db($dbconfig['dbname']);

// Ask the database for the information from the api table 
$result = mysql_query("SELECT keyID FROM skillsheet_apis WHERE keyID='".$keyID."' and vCode='".$vCode."'") or die(mysql_error()); 
$num=mysql_numrows($result) or die(mysql_error());
mysql_close();

$i=0; 
while ($i < $num) { 
$keyID=mysql_result($result,$i,"keyID"); 
$keyID2=mysql_result($result,$i,"keyID2"); 
$vCode=mysql_result($result,$i,"vCode"); 
$vCode2=mysql_result($result,$i,"vCode2");
$public=mysql_result($result,$i,"public");

++$i; 
}
?>
