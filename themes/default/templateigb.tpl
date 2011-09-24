<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
  <!--[* $Id$ *]-->
  <meta content="text/html; charset=UTF-8" http-equiv="Content-Type" />
  <meta name="description" content="Eve Online Skill sheet" />
  <meta name="robots" content="index,follow" />
  <meta name="resource-type" content="document" />
  <meta http-equiv="expires" content="0" />
  <meta name="author" content="Eve Online Onewayweb Solutions" />
  <meta name="copyright" content="Copyright (c) 2004 by Onewayweb Solutions" />
  <meta name="revisit-after" content="1 days" />
  <meta name="distribution" content="Global" />
  <meta name="generator" content="Eve Online Onewayweb Solutions" />
  <meta name="rating" content="General" />
  <meta name="KEYWORDS" content="eveonline, skills" />
  <title>Skill Sheet</title>
  <style type="text/css">
  /*<![CDATA[*/
    body
    {
      font-size: 8pt;
      padding-right: 0px;
      padding-left: 0px;
      padding-bottom: 0px;
      margin: 0px;
      color: white;
      padding-top: 0px;
      font-family: Verdana,Arial;
    }
    <!--[* /*.png
    {
      behavior: url('pngbehavior.htc');
    }*/ *]-->
    .newsTitleImage
    {
      <!--[* behavior: url('pngbehavior.htc'); *]-->
      left: 5px;
      float: left;
      margin-right: -40px;
      position: relative;
    }
    .navdot
    {
      padding-right: 5px;
      font-size: 6pt;
      vertical-align: 0px;
    }
    table.dataTable
    {
      border-right: #666666 1px solid;
      border-top: #666666 1px solid;
    }
    td.dataTableHeader
    {
      padding-right: 5px;
      padding-left: 5px;
      font-weight: bolder;
      font-size: 10px;
      padding-bottom: 5px;
      border-left: #666666 1px solid;
      color: white;
      padding-top: 5px;
      border-bottom: #666666 1px solid;
      background-color: #434343;
    }
    td.dataTableCell
    {
      padding-right: 4px;
      padding-left: 4px;
      font-size: 10px;
      padding-bottom: 4px;
      border-left: #666666 1px solid;
      padding-top: 4px;
      border-bottom: #666666 1px solid;
    }
  /*]]>*/
  </style>
</head>
<body bgcolor="black">
  <h1 style="color:#fff;text-align:center;">IN-GAME</h1>
  <br /><br />
  <center>
  <table width="800">
  <tr>
  <td width="100"></td>
  <td width="600">
  <center>
  <table style="text-align:center;" width="600" summary="Main">
  <tbody>
    <tr>
      <td rowspan="11"><a href="showinfo:1373//<!--[$characterID]-->"><img src="portrait:<!--[$characterID]-->" size="256"></a></td>
      <td colspan="2" class="dataTableHeader"><b>Info</b></td>
      <td colspan="2" class="dataTableHeader"><b>Attributes</b></td>
    </tr>
    <tr>
      <td colspan="4"><hr /></td>
    </tr>
    <tr>
      <td class="dataTableCell">Charactername</td>
      <td class="dataTableCell"><!--[$name]--></td>
      <td class="dataTableCell">Intelligence</td>
      <td class="dataTableCell"><center><!--[$attributes.intelligence]--></center></td>
    </tr>
    <tr>
      <td class="dataTableCell">Corporation</td>
      <td class="dataTableCell"><!--[$corporationName]--></td>
      <td class="dataTableCell">Perception</td>
      <td class="dataTableCell"><center><!--[$attributes.perception]--></center></td>
    </tr>
    <tr>
      <td class="dataTableCell">Total Cash</td>
      <td class="dataTableCell">*snip*<!--$balance--></td>
      <td class="dataTableCell">Charisma</td>
      <td class="dataTableCell"><center><!--[$attributes.charisma]--></center></td>
    </tr>
    <tr>
      <td class="dataTableCell">Total skill points</td>
      <td class="dataTableCell"><!--[$skillpointstotal]--></td>
      <td class="dataTableCell">Willpower</td>
      <td class="dataTableCell"><center><!--[$attributes.willpower]--></center></td>
    </tr>
    <tr>
      <td class="dataTableCell">Race / Blood line</td>
      <td class="dataTableCell"><!--[$race]--> / <!--[$bloodLine]--></center></td>
      <td class="dataTableCell">Memory</td>
      <td class="dataTableCell"><center><!--[$attributes.memory]--></center></td>
    </tr>
    <tr>
      <td colspan="4"><hr /></td>
    </tr>
    <tr>
      <td colspan="2" class="dataTableCell">Currently training</td>
      <td style="color: gold; font-weight: bold;" class="dataTableCell"><a style="color: gold; font-weight: bold; text-decoration: none;" href="showinfo:<!--[$TrainingID]-->"><!--[$Training]--></a></td>
      <td style="text-align: center;" class="dataTableCell"><img alt="Level <!--[$ToLevel]-->" src="themes/default/images/level<!--[$ToLevel]-->_actigb.gif" /></td>
    </tr>
    <tr>
      <td colspan="4"><hr /></td>
    </tr>
    <tr>
      <td colspan="4" style="text-align: center; color: gold; font-weight: bold;" class="dataTableCell">The xml will be updated in <!--[if $pageupdateminutes eq 0 and $pageupdateseconds eq 0]-->60<!--[else]--><!--[$pageupdateminutes]--><!--[/if]--> minutes and <!--[$pageupdateseconds]--> seconds.</td>
    </tr>
  </tbody>
  </table>

  </center>
  </td>
  <td width="100"></td>
  </tr>
  <tr>
    <td colspan="3"><hr /><br /><br /></td>
  </tr>
  <tr>
    <td colspan="3"><center><h3>Skill Sheet</h3></center></td>
  </tr>
  <!--[foreach item='skillgroup' key='groupid' from=$skilltree]-->
  <!--[assign var='totalsp' value=0]-->
  <!--[assign var='countsk' value=0]-->
  <!--[assign var='groupname' value=$skillgroups.$groupid]-->
  <!--[if $groupid eq 256]-->
    <!--[assign var='groupname' value='Missiles']-->
  <!--[/if]-->
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="3"><img alt="<!--[$skillgroups.$groupid]-->" src="themes/default/images/<!--[$groupid]-->.png" style="border: 0px none ; width: 64px; height: 64px; top: -52px;" class="newsTitleImage" /><img src="themes/default/images/<!--[$groupid]-->.jpg" style="vertical-align:middle;"></td>
  </tr>
  <!--[foreach item='skill' key='skillid' from=$skillgroup]-->
  <tr>
    <td width="30">&nbsp;</td>
    <td><a style="color:white; text-decoration: none;" href="showinfo:<!--[$skill.typeID]-->" id="s<!--[$skill.typeID]-->"><!--[$skill.typeName]--></a> / <i>Rank <!--[$skill.rank]--></i> / <i>SP: <!--[$skill.skillpoints]--> of <!--[$skill.skilllevel5]--></i></td>
    <td><img alt="level<!--[$skill.level]-->" src="themes/default/images/level<!--[if $skill.flag neq 61]--><!--[$skill.level]--><!--[else]--><!--[math equation="x + y" x=$skill.level y=1]-->_actigb<!--[/if]-->.gif" /></td>
  </tr>
  <!--[if $skill.flag eq 61]-->
  <tr>
    <td width="30">&nbsp;</td>
    <td colspan="2">
      &nbsp;&nbsp;&nbsp;<span class="navdot">&bull;</span>&nbsp;<font color="yellow">Currently training to: </font><strong>Level <!--[math equation="x + y" x=$skill.level y=1]--></strong><br />
      &nbsp;&nbsp;&nbsp;<span class="navdot">&bull;</span>&nbsp;<font color="yellow">SP done: </font><b><!--[$skill.skillpoints]--> of <!--[$skill.skilllevel5]--></b><br />
      &nbsp;&nbsp;&nbsp;<span class="navdot">&bull;</span>&nbsp;<font color="yellow">Started: </font><!--[$trainingStartTime]--><br />
      &nbsp;&nbsp;&nbsp;<span class="navdot">&bull;</span>&nbsp;<font color="yellow">Ending: </font><!--[$trainingEndTime]--><br />
      &nbsp;&nbsp;&nbsp;<span class="navdot">&bull;</span>&nbsp;<font color="yellow">Time left: </font><!--[$TrainingTimeLeft]-->
    </td>
  </tr>
  <!--[/if]-->
  <!--[math equation="x + y" x=$totalsp y=$skill.skillpoints assign='totalsp']-->
  <!--[math equation="x + y" x=$countsk y=1 assign='countsk']-->
  <!--[/foreach]-->
  <tr>
    <td width="30">&nbsp;</td>
    <td colspan="2"><br /><font color="yellow"><span class="navdot">&bull;</span>&nbsp;<b><!--[$countsk]--></b> <!--[$skill.groupName]--> skills trained, for a total of <b><!--[$totalsp]--></b> skillPoints.</font><br /></td>
  </tr>
  <!--[/foreach]-->
  <tr>
    <td colspan="3"><br /><br /><hr /><br /><br /></td>
  </tr>
  <tr>
    <td colspan="3" style="text-align: center;">All images and logos are Copyright &copy; <a title="Copyright CCP" href="http://www.ccpgames.com/">CCP</a></td>
  </tr>
    <tr>
      <td colspan="3" style="text-align: center;"><br /><font color="grey"><a style="text-decoration:none;color:grey;" href="http://eve.onewayweb.com/" title="Skillsheet Website">PHP Skill sheet version <!--[$version]--></a></font></td>
    </tr>
  <tr>
    <td colspan="3"><br /><br /></td>
  </tr>
  </table>
  </center>
</body>
</html>