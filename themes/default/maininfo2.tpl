
<!-- CHARACTER INFO -->
<!--[strip]-->
<table style="margin-left: 80px;" align="center" border="0" cellpadding="2" cellspacing="0" summary="Character Info">
 <tbody>222
        <tr>
            <td valign="top" align="center">
                <a href="https://imageserver.eveonline.com/Character/<!--[$characterID]-->_1024.jpg" rel="iframe-1024-1024" class="pirobox">
                    <table style="margin:0px 3px 3px 3px; width:256px; height:256px; cursor:zoom-in; background: url(https://imageserver.eveonline.com/Character/<!--[$characterID]-->_512.jpg); background-position:center; background-repeat:no-repeat; background-size:256px 256px;" cellpadding="0" cellspacing="0"></a>
            </td>
        </tr>
        <tr>
            <td>
                <div id="LogoContainer" style="border:1px solid gray;">
                    <div id="corpLogo">
                        <a href="https://gate.eveonline.com/Corporation/<!--[$corporationName|replace:" ":"%20"]-->" rel="iframe-875-610" class="pirobox">
	                    <img style="border: 1px solid gray; background-color: #1B1B1B;"	src="<!--[getcorplogo corporationID=$corporationID size=256]-->"
	            			 width="64" 
	            			 height="64" 
	            			 title="<!--[$corporationName]-->" 
	            			 alt="<!--[$corporationName]-->" />
                        </a>
                    </div>
            <!--[if $allianceName neq '']-->
                    <div id="allianceLogo">
                        <a href="https://gate.eveonline.com/Alliance/<!--[$allianceName|replace:" ":"%20"]-->" rel="iframe-875-610" class="pirobox">
	                    <img style="border: 1px solid gray; background-color: #1B1B1B;"	src="<!--[getalliancelogo allianceID=$allianceID size=128]-->"
	            			 width="64" 
	            			 height="64" 
	            			 title="<!--[$allianceName]-->" 
	            			 alt="<!--[$allianceName]-->" />
                        </a>
                    </div>
            <!--[else]-->
            <!--[/if]-->
                    <div id="raceimg" style="pointer-events:none; cursor:default;"><a href="#">
                        <img style="border: 1px solid gray; background-color: #1B1B1B" src="/imgs/charraces/<!--[$race|lower]-->.png" width="64" height="64" title="<!--[$race]-->" alt="<!--[$race]-->" hspace="6" /></a>
	                </div>
	                <div id="bloodimg" style="pointer-events:none; cursor:default;"><a href="#">
                        <img style="border: 1px solid gray; background-color: #1B1B1B" src="/imgs/charraces/blood_<!--[$bloodLine|lower]-->.png" width="64" height="64" title="<!--[$bloodLine]-->" alt="<!--[$bloodLine]-->" /></a>
	                </div> 
	            </div>
            </td>
        </tr>
        </table>
              <td valign="top"><table class="dataTable" border="0" cellpadding="2" cellspacing="0" width="460" summary="Character Info">
                <tbody style="line-height:1.2em;">
                  <tr>
                    <td colspan="2" class="dataTableHeader">Info</td>
                    <td colspan="2" class="dataTableHeaderRight">Attributes</td>
                  </tr>
                  <tr>
                    <td class="dataTableCell">Character Name</td>
                    <td class="dataTableCell"><strong><!--[$name]--></strong> <!--[if $securityStatus > 0]--><span style="color:deepskyblue;">[+<!--[$securityStatus|round:2]-->]</span><!--[elseif $securityStatus == 0]--><span style="color:grey;">[<!--[$securityStatus|round:2]-->]</span><!--[elseif $securityStatus < -5]--><span style="color:firebrick;">[<!--[$securityStatus|round:2]-->]</span><!--[elseif ( $securityStatus < 0 or $securityStatus > -5 )]--><span style="color:darkorange;">[<!--[$securityStatus|round:2]-->]</span><!--[/if]--></td>
                    <td class="dataTableCell">Perception</td>
                    <td class="dataTableCellLeftRight" align="center"><!--[$attributes.perception]--></td>
                  </tr>
                  <tr>
                    <td class="dataTableCell">Corporation</td>
                    <td class="dataTableCell"><strong><!--[$corporationName]--></strong></td>
                    <td class="dataTableCell">Memory</td>
                    <td class="dataTableCellLeftRight" align="center"><!--[$attributes.memory]--></td>
                  </tr>
                  <tr>
                    <td class="dataTableCell">Race / <span style="color:#c1c1c1;"><i>Bloodline</i></span></td>
                    <td class="dataTableCell"><!--[$race]--> / <span style="color:#c1c1c1;"><i><!--[$bloodLine]--></i></span></td>
                    <td class="dataTableCell">Willpower</td>
                    <td class="dataTableCellLeftRight" align="center"><!--[$attributes.willpower]--></td>
                  </tr>
                  <tr>
                    <td class="dataTableCell">Total Skills</td>
                    <td class="dataTableCell"><!--[$totalsks]--></td>
                    <td class="dataTableCell">Intelligence</td>
                    <td class="dataTableCellLeftRight" align="center"><!--[$attributes.intelligence]--></td>
                  </tr>
                  <tr>
                    <td class="dataTableCell">Total Skill Points</td>
                    <td class="dataTableCell"><!--[$skillpointstotal]--></td>
                    <td class="dataTableCell">Charisma</td>
                    <td class="dataTableCellLeftRight" align="center"><!--[$attributes.charisma]--></td>
                  </tr>                  
                  <tr>              
                    <td class="dataTableCell">Date of Birth</td>
                    <td colspan="2" class="dataTableCell" align="left"><!--[$DoB|date_format:"%A, %B %d, %Y"]--></td>
                    <td colspan="1" class="dataTableCellLeftRight" align="center" onmouseover="this.style.backgroundColor='#303030';" onmouseout="this.style.backgroundColor='#1B1B1B'"> <a style="text-decoration:none;color:#c1c1c1;" href="/settings/" rel="iframe-500-300" class="pirobox">Settings</a></td>
                  </tr>
                  <tr>
                    <td colspan="4" class="dataTableHeaderRight">Training</td>
                  </tr>
                  <tr>
                    <td class="dataTableCell">Currently Training</td>
                        <!--[if $Training]-->
                            <td colspan="2" style="color:gold; font-weight:bold; text-align:left;" class="dataTableCell" onmouseover="this.style.backgroundColor='#303030'; this.style.cursor='pointer';" onmouseout="this.style.backgroundColor='#1B1B1B'"><a style="color:gold; font-weight:bold; text-decoration:none;" href="/<!--[$name|replace:' ':'_']-->#s<!--[$TrainingID]-->"><!--[$Training]--></a></td>
                        <!--[else]-->
                            <td colspan="2" style="color:gold; font-weight:bold; text-align:left;" class="dataTableCell"><span style="color: white;text-decoration: none;">NO SKILL TRAINING</span></td>
                        <!--[/if]-->
                        <!--[if $Training]-->
                            <td style="text-align:center;" class="dataTableCellLeftRight"><img alt="Level <!--[$ToLevel]-->" src="/imgs/sklvlicons/level<!--[$ToLevel]-->_act.gif" width="48" height="8" />
                        <!--[else]-->
                            <td style="text-align:center;" class="dataTableCellLeftRight"><img alt="No Skill Training" src="/imgs/sklvlicons/levelx.gif" width="48" height="8"  /></td>
                        <!--[/if]-->
                  </tr>
                  <tr>
                    <td class="dataTableCell">Time Remaining</td>
                        <!--[if $Training]-->
                            <td colspan="3" style="color:gold; font-weight:bold; text-align:left;" class="dataTableCellLeftRight">
                                <div id="counter1" data-countdown="<!--[$trainingEndFormat]-->"></div>
                                <script type="text/javascript">
                                    $(function(){
                                        $('[data-countdown]').each(function() {
                                            var $this = $(this), finalDate = $(this).data('countdown');
                                            $this.countdown(finalDate, function(event) {
                                                $this.html(event.strftime('%-D day%!D, %-H hour%!H, %-M minute%!M and %-S second%!S'))}).on('finish.countdown', function() {
                                                $this.html("Completed!"); 
                                            });
                                        });
                                    });
                                </script>
                            </td>
                        <!--[else]-->
                            <td colspan="3" style="color:gold; font-weight:bold; text-align:left;" class="dataTableCellLeftRight">
                            </td>
                        <!--[/if]-->
                  </tr>
                  <tr>
                    <td class="dataTableCell">Training Completes</td>
                        <!--[if $Training]-->
                            <td colspan="3" style="color:gold; font-weight:bold;text-align:left;" class="dataTableCellLeftRight"><!--[$trainingEndTime|date_format:"%A, %B %e %Y, %H:%M:%S"]-->
                            </td>
                        <!--[else]-->
                            <td colspan="3" style="color:gold; font-weight:bold;text-align:left;" class="dataTableCellLeftRight"></td>
                        <!--[/if]-->
                  </tr>
                  <tr>
                  <td class="dataTableCell" style="color:#777;font-size:10px;">Data Cache</td>
                  <td colspan="3" style="color:#777;font-size:10px;" class="dataTableCellLeftRight">Data is cached for <!--[if $pageupdateminutes eq 0 and $pageupdateseconds eq 0]-->60<!--[else]--><!--[$pageupdateminutes]--><!--[/if]--> minutes and <!--[$pageupdateseconds]--> seconds
                  </td>
                  </tr>
                  <tr>
                      <!--[if $freeSP >= '1']-->
                      <td colspan="4" class="dataTableCellFreeSP">This character has <span style="text-align:right; font-size:xx-small; color:white;"><strong><!--[$freeSP|number_format]--></span></strong> unallocated skill points!</td>
                    <!--[else]--><!--[/if]-->
                 </tr>
                </tbody>
                </table>
              </td>
            </tr>
          </tbody>
          </table>
<!--[/strip]-->