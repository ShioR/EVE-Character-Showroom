<!--page=['mobile']-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xml:lang="en" xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
  <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"> 
  <meta name="description" content="Eve Online Skill sheet"> 
  <meta name="robots" content="index,follow"> 
  <meta name="resource-type" content="document"> 
  <meta http-equiv="expires" content="0"> 
  <meta name="author" content="Eve Online"> 
  <meta name="copyright" content="Copyright (c) 2010 The Xenodus Initiative."> 
  <meta name="revisit-after" content="1 days"> 
  <meta name="distribution" content="Global"> 
  <meta name="generator" content="Eve Online"> 
  <meta name="rating" content="General"> 
  <meta name="KEYWORDS" content="eveonline, skills"> 
  <!--[if $page]-->
  <title>Skill Sheet for <!--[$name]--></title>
  <!--[else]-->
  <title>SKills Showroom</title>
  <!--[/if]-->
  <link rel="stylesheet" type="text/css" href="/themes/<!--[$theme]-->/style/<!--[$theme]-->.css" />
  <script src="/themes/<!--[$theme]-->/js/proto15.js" type="text/javascript"></script>
  <script src="/themes/<!--[$theme]-->/js/modal.js" type="text/javascript"></script>
</head>
<body>
  <div class="headerribbon">
<span class="headerleft"><a onmouseover="ShowContent('skillsidebox'); return true;" onmouseout="HideContent('skillsidebox'); return true;" href="#"><img align="left" valign="bottom" style="border: 1px solid gray;" src="<!--[getportrait characterID=$characterID size=32]-->" width="32" height="32" title="" alt="<!--[$name]-->" vspace="3" hspace="3" /></a>Skillsheet for <span style="color:gold;"> <!--[$name]--></span><br />Member of <span style="color:gold;"><!--[$corporationName]--></span></span>
    <span class="headerright2">
          [ MOBILE ]
   <br /> <span class="gold"><!--[$totalsks]--></span> skills for a total of <span class="gold"><!--[$skillpointstotal]--></span> SP's. </span>
  </div>
  <!--[literal]-->
    <!--[if IE]>--><br /><!--<![endif]-->
  <!--[/literal]-->
  
  <table class="main" summary="Main"> 
  <tbody> 
    <tr> 
      <td><br> 
          

        <table style="margin-left: 80px;" border="0" cellpadding="2" cellspacing="0" summary="Character Info">
          <tbody>
            <tr>
              <td valign="top"><table class="dataTable" border="0" cellpadding="2" cellspacing="0" width="460" summary="Character Info">
                <tbody>
                  <tr>
                    <td colspan="2" class="dataTableHeader">Info</td>
                    <td colspan="2" class="dataTableHeader">Attributes</td>
                  </tr>
                  <tr>
                    <td class="dataTableCell">Character Name</td>
                    <td class="dataTableCell"><!--[$name]--></td>
                    <td class="dataTableCell">Intelligence</td>
                    <td class="dataTableCell txtcenter"><!--[$attributes.intelligence]--></td>
                  </tr>
                  <tr>
                    <td class="dataTableCell">Corporation</td>
                    <td class="dataTableCell"><!--[$corporationName]--></td>
                    <td class="dataTableCell">Perception</td>
                    <td class="dataTableCell txtcenter"><!--[$attributes.perception]--></td>
                  </tr>
                  <tr>
                    <td class="dataTableCell">Race / <i>Blood Line</i></td>
                    <td class="dataTableCell"><!--[$race]--> / <i><!--[$bloodLine]--></i></td>
                    <td class="dataTableCell">Charisma</td>
                    <td class="dataTableCell txtcenter"><!--[$attributes.charisma]--></td>
                  </tr>
                  <tr>
                    <td class="dataTableCell">Total Skills</td>
                    <td class="dataTableCell"><!--[$totalsks]--></td>
                    <td class="dataTableCell">Willpower</td>
                    <td class="dataTableCell" align="center"><!--[$attributes.willpower]--></td>
                  </tr>
                  <tr>
                    <td class="dataTableCell">Total Skill Points</td>
                    <td class="dataTableCell"><!--[$skillpointstotal]--></td>
                    <td class="dataTableCell">Memory</td>
                    <td class="dataTableCell" align="center"><!--[$attributes.memory]--></td>
                  </tr>                  
                  <tr>
                    <td colspan="4" class="dataTableCell"><br /></td>
                  </tr>
                  <tr>
                    <td colspan="4" class="dataTableHeader">Training</td>
                  </tr>
                  <tr>
                    <td class="dataTableCell">Currently Training</td>
                    <td colspan="2" style="color: gold; font-weight: bold; text-align: left;" class="dataTableCell"><!--[if $Training]--><a style="color: gold; font-weight: bold; text-decoration: none;" href="#s<!--[$TrainingID]-->"><!--[$Training]--></a><!--[else]-->None<!--[/if]--></td>
                    <td style="text-align: center;" class="dataTableCell"><!--[if $Training]--><img alt="Level <!--[$ToLevel]-->" src="/themes/default/images/level<!--[$ToLevel]-->_act.gif" /><!--[else]-->&nbsp;<!--[/if]--></td>
                  </tr>
  <!--[*
                  <tr>
                    <td class="dataTableCell">SP / Hour</td>

                    <td colspan="3" style="color: gold; font-weight: bold; text-decoration: none; text-align: right;" class="dataTableCell">2046</td>
                  </tr>
  *]-->
                  <tr>
                    <td class="dataTableCell">Time Remaining</td>
                    <td colspan="3" style="color: gold; font-weight: bold;text-align: left;" class="dataTableCell"><!--[if $Training]-->
                      <script type="text/javascript">
                      /*<![CDATA[*/
                        TargetDate = "<!--[$trainingEndFormat]-->";
                        BackColor = "none";
                        ForeColor = "none";
                        CountActive = true;
                        CountStepper = -1;
                        LeadingZero = false;
                        DisplayFormat = "%%D%% Days, %%H%% Hours, %%M%% Minutes and %%S%% Seconds";
                        FinishMessage = "Done!";
                      /*]]>*/
                      </script>
                      <script src="/themes/default/js/countdown.js" type="text/javascript"></script><!--[else]-->&nbsp;<!--[/if]-->
                    </td>
                  </tr>
                  <tr>
                    <td class="dataTableCell">ETA (Eve Time)</td>
                    <td colspan="3" style="color: gold; font-weight: bold;text-align: left;" class="dataTableCell"><!--[$trainingEndTime|date_format:"%A, %B %e %Y, %H:%M:%S"]--></td>
                  </tr>

  <!--[*
                  <tr>
                    <td colspan="2" class="dataTableCell">Currently training</td>
                    <td style="color: gold; font-weight: bold;" class="dataTableCell"><a style="color: gold; font-weight: bold; text-decoration: none;" href="#s<!--[$TrainingID]-->"><!--[$Training]--></a></td>
                    <td style="text-align: center;" class="dataTableCell"><img alt="Level <!--[$ToLevel]-->" src="/themes/default/images/level<!--[$ToLevel]-->_act.gif" /></td>
                  </tr>
  *]-->

                  <tr>
                    <!--[*<td colspan="4" style="text-align: center; color: gold; font-weight: bold;" class="dataTableCell">Data cached for <!--[if $pageupdateminutes eq 0 and $pageupdateseconds eq 0]-->60<!--[else]--><!--[$pageupdateminutes]--><!--[/if]--> minutes and <!--[$pageupdateseconds]--> seconds</td>*]-->
                  <td colspan="4" style="text-align: center; color: gold; font-weight: bold;" class="dataTableCell">This page will be updated in <!--[if $pageupdateminutes eq 0 and $pageupdateseconds eq 0]-->60<!--[else]--><!--[$pageupdateminutes]--><!--[/if]--> minutes and <!--[$pageupdateseconds]--> seconds
                  </td>
                  </tr>
                </tbody>
                </table>
              </td>
            </tr>
          </tbody>
          </table>
          
<!--[if $SkillQueue]-->
	<table class="dataTable2" border="0" cellpadding="2" cellspacing="0" width="100%" summary="Skill Queue Info" style="margin-top: 40px;">
	  <tbody style=" border-color: #000;">
	    <tr>
	      <td colspan="5" class="dataTableHeader2">Skills in Queue</td>
	    </tr>
	    <tr style="font-weight: bold;">
	      <td class="dataTableCell">&nbsp;Skill Name</td>
	      <td class="dataTableCell">Skillpoints</td>
	      <td class="dataTableCell">Starts</td>
	      <td class="dataTableCellEnd" colspan="2">Ends</td>
	    </tr>
<!--[foreach item='queue' from=$SkillQueue]-->
	    <tr>
	    	<td class="dataTableCell2"><a style="color: gold; text-decoration: none;" target="_blank" href="http://wiki.eveonline.com/wiki/<!--[$queue.typeName|replace:' ':'_']-->" id="q<!--[$queue.typeID]-->"><!--[$queue.typeName]--></a> <span style="font-size: 9px;font-weight:normal;">(Rank <!--[$queue.rank]-->)</rank></td>
	      <td class="dataTableCell2" width="150" align="center"><!--[$queue.startSP|number_format]--> of <span style="color: gold;"><!--[$queue.endSP|number_format]--></span></td>
	      <td class="dataTableCell2" width="120"><!--[$queue.startTime|date_format:"%a, %b %d, %H:%M"]--></td>
	      <td class="dataTableCell2" width="120"><!--[$queue.endTime|date_format:"%a, %b %d, %H:%M"]--></td>
	      <td class="dataTableCell2" width="48"><img alt="level<!--[$queue.level]-->" src="/themes/default/images/level<!--[$queue.level]-->_q.gif" /></td>
	    </tr>
<!--[/foreach]-->
	    <!--<tr>
	      <td colspan="5" class="dataTableCell2" style="background: #191919;">
	      	<!--[foreach item='queue' from=$SkillQueue]--><!--[if $queue.sqLength >= '100' && $sqSize > '1']--><!--[math equation="x - y" x=100 y=$SkillQueue.0.sqLength assign='newSQLength']--><!--[if $sqSize == '1' && $newSQLength >= '100']--><!--[assign var='newSQLength' value='100']--><!--[/if]--><!--[else]--><!--[assign var="newSQLength" value=$queue.sqLength]--><!--[/if]--><img src="/themes/default/images/sq_<!--[cycle values="light,dark"]-->.gif" width="<!--[$newSQLength]-->%" height="16" alt="<!--[$queue.typeName]-->" title="<!--[$queue.typeName]-->" /><!--[/foreach]--></td>
	    </tr>-->
	  </tbody>
  </table>
	<!--<table border="0" cellpadding="2" cellspacing="0" width="100%" summary="Character Info">
	  <tbody style=" border-color: #000;">
	    <tr>
	      <td style="text-align: left; color: gold; font-weight: bold;" class="dataTableCellBottom" width="33%">0h</td>
	      <td style="text-align: center; color: gold; font-weight: bold;" class="dataTableCellBottom" width="33%">12h</td>
	      <td style="text-align: right; color: gold; font-weight: bold;" class="dataTableCellBottom" width="33%">24h</td>
	    </tr>
	  </tbody>
  </table>-->
<!--[/if]-->  
           
      <!--[assign var='totalSkills' value=0]-->
      <!--[assign var='lvl5total' value=0]-->
      <!--[assign var='lvl5sptotal' value=0]-->       
      <!--[foreach item='skillgroup' key='groupid' from=$skilltree]-->
      <!--[assign var='totalsp' value=0]-->
      <!--[assign var='countsk' value=0]-->
      <!--[assign var='lvl5' value=0]-->
      <!--[assign var='lvl5sp' value=0]-->      
      <!--[assign var='groupname' value=$skillgroups.$groupid]-->
      <!--[if $groupid eq 256]-->
      <!--[assign var='groupname' value='Missiles']-->
      <!--[/if]-->
      <!--[foreach item='skill' key='skillid' from=$skillgroup]-->
			<!--[assign var='currentSPforSkill' value=$skill.skillpoints]-->
			<!--[assign var='totalSPforSkill' value=$skill.skilllevel5]-->
			<!--[math equation="(x / y) * z" x=$currentSPforSkill y=$totalSPforSkill z=100 format="%.1f" assign='TotalPercentage']-->      
      <!--[math equation="x + y" x=$totalsp y=$skill.skillpoints assign='totalsp']-->
      <!--[math equation="x + y" x=$countsk y=1 assign='countsk']-->
      <!--[if $skill.level == '5']-->
      <!--[math equation="x + y" x=$skill.skillpoints y=$lvl5sp assign='lvl5sp']-->
      <!--[math equation="x + y" x=$lvl5 y=1 assign='lvl5']-->
      <!--[/if]-->
      <!--[/foreach]-->                
                                                                               
                        <div style="margin-top: 50px; margin-bottom: -24px;"><div style="margin-top: 10px;"></div> 
        </div> 
			    	
			<!--[math equation="x + y" x=$lvl5sp y=$lvl5sptotal assign='lvl5sptotal']-->
			<!--[math equation="x + y" x=$lvl5 y=$lvl5total assign='lvl5total']-->
			<!--[math equation="x + y" x=$countsk y=$totalSkills assign='totalSkills']-->	    	
      <!--[/foreach]-->
      <!--[math equation="(x / y) * z" x=$lvl5total y=$totalSkills z=100 format="%.1f" assign='TotalPercentageSkills']-->
      <!--[math equation="(x / y) * z" x=$lvl5sptotal y=$totalskillpoints z=100 format="%.1f" assign='TotalPercentageSkillPoints']-->        
        <br /><br />
            <div style="line-height: 1.45em; margin-left: 82px; font-size: 11px;">
            	<br /><strong>Totals:</strong>
              <br /><span style="color:gold;"><span class="navdot">&bull;</span><strong><!--[$lvl5total]--></strong> skills trained to level 5 for a total of <strong><!--[$lvl5sptotal|number_format]--></strong> skillpoints which makes up <strong><!--[$TotalPercentageSkillPoints]-->%</strong> of your total Skillpoints.</span>
							<br /><span style="color:gold;"><span class="navdot">&bull;</span><strong><!--[$totalSkills]--></strong> skills trained, of which <strong><!--[$TotalPercentageSkills]-->%</strong> are level 5 skills.</span>
            </div>
        <br><br> 
      </div></div></td> 
    </tr> 
    <tr> 
      <td><div style="margin: auto; width: 100%; text-align: center;"><br><br></div></td> 
    </tr> 
  </tbody> 
  </table> 
 
  <div id="skillsidebox" style="display:none;" >
  <!--[foreach item='grp' from=$grptable]-->
    <strong><!--[$grp.grpname]--></strong>: <!--[$grp.spcount]--><br />
  <!--[/foreach]-->
    <br /><strong>Total: <!--[$skillpointstotal]--></strong>
    <br /><br />
    <a style="color: orange; font-weight: bold; text-decoration: none;" onclick="HideContent('skillsidebox'); return true;" href="#">[ close ]</a>
  </div>
 
  <!--[include file='footer.tpl']-->