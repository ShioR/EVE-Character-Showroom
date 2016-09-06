<?php 
/**********************************************************/
/*           EVE Character Showroom - Version 6           */
/*       'Improved' and maintained by Shionoya Risa       */
/*          Originally created by DeTox MinRohim          */
/*            Copyright (C) 2016 Shionoya Risa            */
/**********************************************************/
/* This program is free software: you can redistribute it */
/*   and/or modify it under the terms of the GNU General  */
/*     Public License as published by the Free Software   */
/*     Foundation, either version 3 of the License, or    */
/*           (at your option) any later version.          */
/*  This program is distributed in the hope that it will  */
/*  be useful, but WITHOUT ANY WARRANTY; without even the */
/*   implied warranty of MERCHANTABILITY or FITNESS FOR   */
/*                  A PARTICULAR PURPOSE.                 */
/*  See the GNU General Public License for more details.  */
/*         You should have received a copy of the         */
/*   GNU General Public License along with this program.  */
/*        If not, see http://www.gnu.org/licenses/        */
/**********************************************************/
/*   Lots of code snippets have been found in my travels  */
/*    if you think one of those snippets is yours, tell   */
/*         me. I will give all appropriate credits.       */
/**********************************************************/
/*  All EVE Online logos, images, trademarks and related  */
/* materials are copyright (C) CCP hf http://ccpgames.com */
/**********************************************************/

include '../includes/config.php';	
    // Open MySQL CONNECTION
        $conn = new MySQLi($dbconfig['dbhost'], $dbconfig['dbuname'], $dbconfig['dbpass'], $dbconfig['dbname']) or die('Could not connect to database :(');		
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta content="text/html; charset=UTF-8" http-equiv="Content-Type" />
  <meta name="description" content="Eve Online Skill sheet" />
  <meta name="robots" content="index,follow" />
  <meta name="resource-type" content="document" />
  <meta http-equiv="expires" content="0" />
  <meta name="author" content="Eve Online" />
  <meta name="copyright" content="Copyright (c) 2016 The Xenodus Initiative." />
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
<body>
<?php
	if(isset($_POST['Submit'])){//if the submit button is clicked
	
	// Variables
	   $keyID = $_POST['keyID'];
	   $vCode = $_POST['vCode'];
       $charName = $_POST['charName'];
	// Update Query	
	   $update = "DELETE FROM skillsheet_apis WHERE name='".$charName."' AND keyID='".$keyID."' AND vCode='".$vCode."'";
	   $conn->query($update) or die("Cannot delete character :(");//update or error
	}
?>
<?php
// Select rows
$sql = "SELECT name FROM skillsheet_apis WHERE keyID='".$keyID."' AND vCode='".$vCode."'";
//submit the query and capture the result
$result = $conn->query($sql) or die(mysql_error());
$query=getenv(QUERY_STRING);
parse_str($query);
?>
<div id="content" style="position:fixed;top:50%;left:50%;transform:translate(-50%, -50%);">
<form action="" method="post">
<?php
	
	while ($row = $result->fetch_assoc()) {?>   
    
<table border="0" cellspacing="0">
    <tr>
        <td nowrap><strong>keyID:</strong></td>
        <td style="padding-left:10px;"><input type="text" name="keyID" value="<?php echo $row['keyID']; ?>" required autofocus></td>
    </tr>
    <tr>
        <td nowrap><strong>vCode:</strong></td>
        <td style="padding-left:10px;"><input type="text" name="vCode" value="<?php echo $row['vCode']; ?>" required></td>
    </tr>
    <tr>
        <td nowrap><strong>Character Name:</strong></td>
        <td style="padding-left:10px;"><input type="text" name="charName" value="<?php echo $row['charName']; ?>" required></td>
    </tr>
    <tr>
        <td></td>
        <td align="center"><INPUT TYPE="Submit" VALUE="DELETE Character" NAME="Submit"></td>
    </tr>
    <tr>
        <td colspan='2' align="center"></br></br><span class="newsmalltext">Your API keys can be found <a target="_blank" href="https://community.eveonline.com/support/api-key/">here</a></span>.</td>
    </tr>
</table>
<?php	}
	?>
</form>
<?php
	if($update){
	
	echo "<b>Successfully deleted character from database!</b>";
		
}  
?>
</div>
</body>
</html>