<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
  <head>
  <meta content="text/html; charset=UTF-8" http-equiv="Content-Type" />
  <meta name="description" content="Eve Online Skill sheet" />
  <meta name="robots" content="index,follow" />
  <meta name="resource-type" content="document" />
  <meta http-equiv="expires" content="1" />
  <meta name="author" content="Eve Online" />
  <meta name="copyright" content="Copyright (c) 2016 The Xenodus Initiative." />
  <meta name="revisit-after" content="1 days" />
  <meta name="distribution" content="Global" />
  <meta name="generator" content="Eve Online" />
  <meta name="rating" content="General" />
  <meta name="KEYWORDS" content="eveonline, skills" />
  <title>Skills Showroom</title>
  <link rel="shortcut icon" href="/imgs/favicon.png">
  <link rel="apple-touch-icon" href="/imgs/favicon.png" sizes="114x114">
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
  <style type="text/css">
  /*<![CDATA[*/
    body{font-family:'Open Sans',sans-serif;font-size:9pt;padding:0;margin:0;color:white;background:#1B1B1B;}
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
.statusmsg{margin-top:25px;color:yellow;}
#skillsidebox{margin:0;height:250px;position:fixed;top:26px;left:0;width:260px;z-index:99;border-bottom:1px solid gray;border-right:1px solid gray;background:#2C2C38;vertical-align:middle;padding:15px 0 0 5px;opacity:0.80;}
.mcenter{margin-left:auto;margin-right:auto;}
.txtcenter{text-align:center;}
a,a:visited{color:white;text-decoration:none;}
a:hover{color:gold;}
a img{border:none;}
  /*]]>*/
  </style>  
</head>
<body bgcolor="#1B1B1B" style="height: 100%">
  <div class="headerribbon">
    <span class="headerleft">Character List</span>
    <span class="headerright"><a style="color:gold;" href="/add" title="Add Character">ADD CHARACTER</a></span>
  </div>

  <div id="content" class="mcenter" style="align:center;float:center;width:970px;margin-top:100px;" >
    <br /><br />
    <table summary="Characters List" style="margin-left: 10px; width:910px;">
    <tbody>
      <tr>
    <!--[if $error]-->
      <td class="txtcenter" style="color:red;"><!--[$error]--><br /><a href="/add" title="Go back">Back to API Form</a></td>
    <!--[else]-->
      <!--[assign var='counter' value=0]-->
      <!--[foreach item='char' from=$charlist]-->
        <!--[if $counter eq 7]-->
          <!--[assign var='counter' value=1]-->
        </tr>
        <tr>
          <td colspan="7"><!--<hr />--></td>
        </tr>
        <tr>
        <!--[else]-->
          <!--[math equation="x+1" x=$counter assign='counter']-->
        <!--[/if]-->
        <td class="txtcenter">
          <a href=/<!--[$char.name|replace:' ':'_']--> title="<!--[$char.name]-->"><img src="https://imageserver.eveonline.com/Character/<!--[$char.characterID]-->_128.jpg" width="128" height="128" style="padding: 2px; "onmouseover="this.style.backgroundColor='#303030'; this.style.cursor='pointer'" onmouseout="this.style.backgroundColor='#1B1B1B'"</a>
          <br /><!--[$char.name]-->
        </td>
      <!--[/foreach]-->
    <!--[/if]-->
      <!--[if $counter < 7 && $charcount > 7]-->
        <!--[math equation="7-x" x=$counter assign='countleft']-->
        <td colspan="<!--[$countleft]-->">&nbsp;</td>
      <!--[/if]-->
      </tr>
      <tr>
        <td colspan="<!--[if $charcount >= 7]-->7<!--[else]--><!--[$charcount]--><!--[/if]-->"><!--<hr />--></td>
      </tr>
    </tbody>
    </table>
  </div>
<div id"footerPad" style="position:absolute;bottom:0;width:100%;">
    <!--[include file='footer.tpl']-->
</div>