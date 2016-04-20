<?php
include_once '../includes/version.php';
echo'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
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
<body bgcolor="#1B1B1B" style="height: 100%">

  <br /><br />
  <div id="content" class="mcenter" style="float:center;width:500px;margin-top:50px;" >
    <table summary="Characters List" style="border: #666666 1px solid; margin-left:105px; width:290px;">
    <thead>
      <tr style="background: rgb(44, 44, 56);">
        <th colspan="2" class="dataTableHeader" align="center">Character/Account Settings</th>
      </tr>
    </thead>
    <tbody>
      <tr colspan="2" align="center">
        <td bgcolor="#1B1B1B" align="center">
        <form method="link" action="api.php"><input type="submit" value="Update API Key" style="width:140px;"></form>
		</td>
        <td>
		<form method="link" action="delete.php"><input type="submit" value="Delete Character" style="width:140px;"></form>
		</td>
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
      <td style="text-align: center; font-size: x-small;"><a style="text-decoration: none;color:grey;" href="https://txsi.co.uk" title="The Xenodus Initiative.">The Xenodus Initiative.</a> / <a style="text-decoration: none;color:grey;" target="_blank" href="https://github.com/ShioR/EVE-Character-Showroom/commits/master/" title="Github">';echo _DATA_VERSION; echo '&nbsp;'; echo _SKILLSHEET_VERSION; echo'</a> / <a style="text-decoration: none;color:grey;" target="_blank" href="https://github.com/ShioR/EVE-Character-Showroom/" title="Github">GitHub</a>
</td>
</tr>
<tr>
<td>
</td>
</tr>
    </tr>
  </tbody>
  </table>
</body>
</html>'
?>