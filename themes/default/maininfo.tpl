
<!-- CHARACTER INFO -->
<!--[strip]-->
<table style="margin-left: 80px;" align="center" border="0" cellpadding="2" cellspacing="0" summary="Character Info">
 <tbody>
          <tr>
            <td valign="top" align="center">
            	<table style="margin:0px 3px 3px 3px; width:256px; height:256px; background: url(http://image.eveonline.com/Character/<!--[$characterID]-->_256.jpg);" cellpadding="0" cellspacing="0">
            		<tr>
            			<td><div id="corpLogoContainer" style="border:1px solid gray;">
            			     <div id="corpLogo"> <a href="http://evemaps.dotlan.net/corp/<!--[$corporationName|replace:" ":"_"]-->" rel="iframe-875-610" class="pirobox">
	            					<img style="border: 1px solid gray; background-color: #1B1B1B;"	src="<!--[getcorplogo corporationID=$corporationID size=256]-->"
	            						width="64" 
	            						height="64" 
	            						title="<!--[$corporationName]-->" 
	            						alt="<!--[$corporationName]-->" />
            					</a></div>
            					 <!--[if $allianceName neq '']-->
            					 <div id="allianceLogo"> <a href="http://evemaps.dotlan.net/alliance/<!--[$allianceName|replace:" ":"_"]-->" rel="iframe-875-610" class="pirobox">
	            					<img style="border: 1px solid gray; background-color: #1B1B1B;"	src="<!--[getalliancelogo allianceID=$allianceID size=128]-->"
	            						width="64" 
	            						height="64" 
	            						title="<!--[$allianceName]-->" 
	            						alt="<!--[$allianceName]-->" />
            					 </a></div>
            					 <!--[else]-->
            					<!--[/if]-->
	            				 <div id="raceimg"> <a href="http://wiki.eveonline.com/en/wiki/<!--[$race]-->" rel="iframe-875-610" class="pirobox">
	            				  <img style="border: 1px solid gray; background-color: #1B1B1B" src="/imgs/charraces/<!--[$race|lower]-->.png" width="64" height="64" title="<!--[$race]-->" alt="<!--[$race]-->" hspace="6" />
	            				 </a></div>
	            				 <div id="bloodimg"> <!--[if $bloodLine eq 'Gallente']--><a href="http://wiki.eveonline.com/en/wiki/<!--[$bloodLine]-->_Bloodline" rel="iframe-875-610" class="pirobox"><!--[elseif $bloodLine eq 'Amarr']--><a href="http://wiki.eveonline.com/en/wiki/True_<!--[$bloodLine]-->" rel="iframe-875-610" class="pirobox"><!--[else]--><a href="http://wiki.eveonline.com/en/wiki/<!--[$bloodLine]-->" rel="iframe-875-610" class="pirobox"><!--[/if]-->
	            				  <img style="border: 1px solid gray; background-color: #1B1B1B" src="/imgs/charraces/blood_<!--[$bloodLine|lower]-->.png" width="64" height="64" title="<!--[$bloodLine]-->" alt="<!--[$bloodLine]-->" />
	            				 <a/></div> 
	            				 </div>
            					</div>
            				</div>
            			</td>
            		</tr>
            	</table>
              <td valign="top"><table class="dataTable" border="0" cellpadding="2" cellspacing="0" width="460" summary="Character Info">
                <tbody>
                  <tr>
                    <td colspan="2" class="dataTableHeader">Info</td>
                    <td colspan="2" class="dataTableHeaderRight">Attributes</td>
                  </tr>
                  <tr>
                    <td class="dataTableCell">Character Name</td>
                    <td class="dataTableCell"><strong><!--[$name]--></strong> <!--[if $securityStatus > 0]--><span style="color:deepskyblue;">[+<!--[$securityStatus|round:2]-->]</span><!--[elseif $securityStatus == 0]--><span style="color:grey;">[<!--[$securityStatus|round:2]-->]</span><!--[elseif $securityStatus < -5]--><span style="color:firebrick;">[<!--[$securityStatus|round:2]-->]</span><!--[elseif ( $securityStatus < 0 or $securityStatus > -5 )]--><span style="color:darkorange;">[<!--[$securityStatus|round:2]-->]</span><!--[/if]--></td>
                    <td class="dataTableCell">Perception</td>
                    <td class="dataTableCellLeftRight" align="center"><!--[$attributes.perception]--><!--[if $perceptionImp >= 1]--> [+<!--[$perceptionImp]-->]<!--[else]--><!--[/if]--></td>
                  </tr>
                  <tr>
                    <td class="dataTableCell">Corporation</td>
                    <td class="dataTableCell"><!--[$corporationName]--></td>
                    <td class="dataTableCell">Memory</td>
                    <td class="dataTableCellLeftRight" align="center"><!--[$attributes.memory]--><!--[if $memoryImp >= 1]--> [+<!--[$memoryImp]-->]<!--[else]--><!--[/if]--></td>
                  </tr>
                  <tr>
                    <td class="dataTableCell">Race / <i>Bloodline</i></td>
                    <td class="dataTableCell"><!--[$race]--> / <i><!--[$bloodLine]--></i></td>
                    <td class="dataTableCell">Willpower</td>
                    <td class="dataTableCellLeftRight" align="center"><!--[$attributes.willpower]--><!--[if $willpowerImp >= 1]--> [+<!--[$willpowerImp]-->]<!--[else]--><!--[/if]--></td>
                  </tr>
                  <tr>
                    <td class="dataTableCell">Total Skills</td>
                    <td class="dataTableCell"><!--[$totalsks]--></td>
                    <td class="dataTableCell">Intelligence</td>
                    <td class="dataTableCellLeftRight" align="center"><!--[$attributes.intelligence]--><!--[if $intelligenceImp >= 1]--> [+<!--[$intelligenceImp]-->]<!--[else]--><!--[/if]--></td>
                  </tr>
                  <tr>
                    <td class="dataTableCell">Total Skill Points</td>
                    <td class="dataTableCell"><!--[$skillpointstotal]--></td>
                    <td class="dataTableCell">Charisma</td>
                    <td class="dataTableCellLeftRight" align="center"><!--[$attributes.charisma]--><!--[if $charismaImp >= 1]--> [+<!--[$charismaImp]-->]<!--[else]--><!--[/if]--></td>
                  </tr>                  
                  <tr>                
                    <td class="dataTableCell">Date of Birth</td>
                    <td colspan="2" class="dataTableCell" align="left"><!--[$DoB|date_format:"%A, %B %d, %Y"]--></td>
                    <td colspan="1" class="dataTableCellLeftRight" align="center" onmouseover="this.style.backgroundColor='#303030';" onmouseout="this.style.backgroundColor='#1B1B1B'"> <a style="text-decoration:none;" href="/settings/" rel="iframe-500-300" class="pirobox">Settings</a></td>
                  </tr>
                  <tr>
                    <td colspan="4" class="dataTableHeaderRight">Training</td>
                  </tr>
                  <tr>
                    <td class="dataTableCell">Currently Training</td>
                        <!--[if $Training]-->
                            <td colspan="2" style="color:gold; font-weight:bold; text-align:left;" class="dataTableCell" onmouseover="this.style.backgroundColor='#303030'; this.style.cursor='pointer';" onmouseout="this.style.backgroundColor='#1B1B1B'"><a style="color:gold; font-weight:bold; text-decoration:none;" href="/<!--[$name|replace:' ':'_']-->/#s<!--[$TrainingID]-->"><!--[$Training]--></a></td>
                        <!--[else]-->
                            <td colspan="2" style="color:gold; font-weight:bold; text-align:left;" class="dataTableCell"><span style="color: white;text-decoration: none;">NO SKILL TRAINING</span></td>
                        <!--[/if]-->
                        <!--[if $Training]-->
                            <td style="text-align:center;" class="dataTableCellLeftRight"><img alt="Level <!--[$ToLevel]-->" src="/imgs/level<!--[$ToLevel]-->_act.gif" width:48px; height:8px; />
                        <!--[else]-->
                            <td style="text-align:center;" class="dataTableCellLeftRight"><img alt="No Skill Training" src="/imgs/levelx.gif" /></td>
                        <!--[/if]-->
                  </tr>
                  <tr>
                    <td class="dataTableCell">Time Remaining</td>
                        <!--[if $Training]-->
                            <td colspan="3" style="color:gold; font-weight:bold; text-align:left;" class="dataTableCellLeftRight">
                                <script type="text/javascript">
                                    /*<![CDATA[*/
                                    TargetDate = "<!--[$trainingEndFormat]-->";
                                    BackColor = "none";
                                    ForeColor = "none";
                                    CountActive = true;
                                    CountStepper = -1;
                                    LeadingZero = false;
                                    DisplayFormat = "%%D%% Days, %%H%% Hours, %%M%% Minutes and %%S%% Seconds";
                                    FinishMessage = "Finished!";
                                    /*]]>*/
                                </script>
                                <script src="/themes/default/js/countdown.js" type="text/javascript"></script>
                            </td>
                        <!--[else]-->
                            <td colspan="3" style="color:gold; font-weight:bold; text-align:left;" class="dataTableCellLeftRight">
                            </td>
                        <!--[/if]-->
                  </tr>
                  <tr>
                    <td class="dataTableCell">ETA (EVE Time)</td>
                        <!--[if $Training]-->
                            <td colspan="3" style="color:gold; font-weight:bold;text-align:left;" class="dataTableCellLeftRight"><!--[$trainingEndTime|date_format:"%A, %B %e %Y, %H:%M:%S"]-->
                            </td>
                        <!--[else]-->
                            <td colspan="3" style="color:gold; font-weight:bold;text-align:left;" class="dataTableCellLeftRight"></td>
                        <!--[/if]-->
                  </tr>
                  <tr>
                  <td class="dataTableCell">Data Cache</td>
                  <td colspan="3" style="color: gold; font-weight: bold;" class="dataTableCellLeftRight">Data is cached for <!--[if $pageupdateminutes eq 0 and $pageupdateseconds eq 0]-->60<!--[else]--><!--[$pageupdateminutes]--><!--[/if]--> minutes and <!--[$pageupdateseconds]--> seconds
                  </td>
                  </tr>
                  <tr>
                      <!--[if $freeSP >= '1']-->
                      <td colspan="4" class="dataTableCellFreeSP">This character has <span style="text-align:right; font-size:xx-small; color:white;"><strong><!--[$freeSP|number_format]--></span></strong> skill points unspent!</td>
                    <!--[else]--><!--[/if]-->
                 </tr>
                </tbody>
                </table>
              </td>
            </tr>
          </tbody>
          </table>
<!--[/strip]-->