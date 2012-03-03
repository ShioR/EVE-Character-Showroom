  <!--[include file='header.tpl' page='skills']-->

  <table class="main" summary="Main">
  <tbody>
    <tr>
      <td><br />

          <!--[include file='mainheader.tpl']-->
          <!--[if $implants == 1]--><!--[include file='maininfo.tpl']--><!--[else]--><!--[include file='maininfo2.tpl']--><!--[/if]-->
          <!--[include file='queue.tpl']-->
          
      <!--[assign var='totalCost' value=0]-->   
      <!--[assign var='totalSkills' value=0]-->
      <!--[assign var='lvl1total' value=0]-->
      <!--[assign var='lvl2total' value=0]-->
      <!--[assign var='lvl3total' value=0]-->
      <!--[assign var='lvl4total' value=0]-->
      <!--[assign var='lvl5total' value=0]-->
      <!--[assign var='lvl1sptotal' value=0]-->       
      <!--[assign var='lvl2sptotal' value=0]-->       
      <!--[assign var='lvl3sptotal' value=0]-->       
      <!--[assign var='lvl4sptotal' value=0]-->       
      <!--[assign var='lvl5sptotal' value=0]-->       
      <!--[foreach item='skillgroup' key='groupid' from=$skilltree]-->
        <!--[assign var='totalsp' value=0]-->
        <!--[assign var='countsk' value=0]-->
        <!--[assign var='lvl1' value=0]-->
        <!--[assign var='lvl2' value=0]-->
        <!--[assign var='lvl3' value=0]-->
        <!--[assign var='lvl4' value=0]-->
        <!--[assign var='lvl5' value=0]-->
        <!--[assign var='lvl1sp' value=0]-->      
        <!--[assign var='lvl2sp' value=0]-->      
        <!--[assign var='lvl3sp' value=0]-->      
        <!--[assign var='lvl4sp' value=0]-->      
        <!--[assign var='lvl5sp' value=0]-->      
        <!--[assign var='groupname' value=$skillgroups.$groupid]-->
        <!--[if $groupid eq 256]-->
          <!--[assign var='groupname' value='Missiles']-->
        <!--[/if]-->
        <div style="margin-top: 50px; margin-bottom: -24px;">
          <div style="margin-top: 10px;">
            <div style="border-top: 1px solid rgb(67, 67, 67); border-bottom: 1px solid rgb(67, 67, 67); background: rgb(44, 44, 56) url(/imgs/<!--[$groupid]-->.jpg)  no-repeat scroll 74px 5px; margin-bottom: 10px; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial; height: 21px;"></div>
             <a class="sklnk" title="<!--[$groupname]-->"><img alt="<!--[$skillgroups.$groupid]-->" src="/imgs/<!--[$groupid]-->.png" style="border: 0px none ; width: 64px; height: 64px; top: -52px;" class="newsTitleImage" /></a>
            <div style="margin-left: 82px;">
              <!--[foreach item='skill' key='skillid' from=$skillgroup]-->
							<!--[assign var='currentSPforSkill' value=$skill.skillpoints]-->
							<!--[assign var='totalSPforSkill' value=$skill.skilllevel5]-->
							<!--[math equation="(x / y) * z" x=$currentSPforSkill y=$totalSPforSkill z=100 format="%.1f" assign='TotalPercentage']-->
              <div style="border-bottom: 1px dotted rgb(80, 80, 80); padding: 2.5px; <!--[if $skill.flag eq 61]-->background-color: #5E5F00;" onmouseout="this.style.backgroundColor='#5E5F00'"<!--[/if]-->" onmouseover="this.style.backgroundColor='#303030'; this.style.cursor='pointer'" onmouseout="this.style.backgroundColor='#1B1B1B'">
              <div style="float: right;margin-top:4px;"><img alt="level<!--[$skill.level]-->" src="/imgs/level<!--[if $skill.flag neq 61]--><!--[$skill.level]--><!--[else]--><!--[math equation="x + y" x=$skill.level y=1]-->_act<!--[/if]-->.gif" width:48px; height:8px; /></div>
                <div style="line-height: 1.45em; font-size: 11px;">
                <!--[if $TotalPercentage neq 100.0]-->
                  <a style="color: white; text-decoration: none;" onclick="javascript:i(document.getElementById('<!--[$skill.typeID]-->'));" href="#toggle" id="s<!--[$skill.typeID]-->"><!--[$skill.typeName]--></a> / <span style="font-size: x-small;"><i>Rank <!--[$skill.rank]--></i> / <i>SP: <!--[$skill.skillpoints|number_format]--> of <!--[$skill.skilllevel5|number_format]--> / <!--[$TotalPercentage]-->%</i></span>         
                <!--[else]-->
                	<span style="color:gold;"><a style="color: white; text-decoration: none;" onclick="javascript:i(document.getElementById('<!--[$skill.typeID]-->'));" href="#toggle" id="s<!--[$skill.typeID]-->"><!--[$skill.typeName]--></a> / <span style="font-size: x-small;"><i>Rank <!--[$skill.rank]--></i> / <i>SP: <!--[$skill.skillpoints|number_format]--> of <!--[$skill.skilllevel5|number_format]--> / <!--[$TotalPercentage]-->%</i></span></span>
                <!--[/if]-->
                </div>
                <!--[if $skill.flag eq 61]-->
                <div>
                  <div style="line-height: 1.5em;margin-left:12px;font-size:11px">
                    <div>
                      <span class="navdot">&#xB7;</span><span style="color:gold;">Currently training to: </span>
                      <strong>Level <!--[math equation="x + y" x=$skill.level y=1]--></strong>
                    </div>
                    <div>
                     <span class="navdot">&#xB7;</span><span style="color:gold;">SP done: </span>
                      <strong><!--[$skill.skillpoints|number_format]--> of <!--[$skill.skilllevel5|number_format]--> <span style="color:gold;font-size: 10px;">(<!--[$TotalPercentage]-->%)</span></strong>
                    </div>
                    <div>
                      <span class="navdot">&#xB7;</span><span style="color:gold;">Started: </span>
                      <!--[$trainingStartTime|date_format:"%A, %B %d, %H:%M"]-->
                    </div>
                    <div>
                      <span class="navdot">&#xB7;</span><span style="color:gold;">Ends: </span>
                      <!--[$trainingEndTime|date_format:"%A, %B %d, %H:%M"]-->
                    </div>
                    <div>
                      <span class="navdot">&#xB7;</span><span style="color:gold;">Time left: </span>
                      <!--[$TrainingTimeLeft]-->
                    </div>
					<div>
					  <span class="navdot">&#xB7;</span><span style="color:gold;">Description: </span>
					  <!--[getskillinfo2 typeID=$skill.typeID]-->
					</div>
					<div>
					  <span class="navdot">&#xB7;</span><span style="color:gold;">Cost: </span>
					  <!--[$skill.skillCost|number_format]--> ISK
					</div>					
                  </div>
                </div>
                <!--[/if]-->
			  <!--[if $skill.flag neq 61]-->	
              <div id="<!--[$skill.typeID]-->" style="text-align: left; font-size: x-small; color: #777; display:none;";>	
							<span style="color:#c8c8c8;">Description: </span><!--[getskillinfo typeID=$skill.typeID]-->
							<span style="color:#c8c8c8;">Cost: </span><!--[$skill.skillCost|number_format]--> ISK	
			  </div>
              <!--[/if]-->  
              </div>
              <!--[math equation="x + y" x=$totalsp y=$skill.skillpoints assign='totalsp']-->
              <!--[math equation="x + y" x=$totalCost y=$skill.skillCost assign='totalCost']-->
              <!--[math equation="x + y" x=$countsk y=1 assign='countsk']-->
              <!--[math equation="(x / y) * z" x=$totalsp y=$totalskillpoints z=100 format="%.1f" assign='GroupPercentSP']--> 
              <!--[math equation="(x / y) * z" x=$countsk y=$totalsks z=100 format="%.1f" assign='GroupPercentSkills']--> 
              <!--[if $skill.level == '1']-->
              	<!--[math equation="x + y" x=$skill.skillpoints y=$lvl1sp assign='lvl1sp']-->              
              	<!--[math equation="x + y" x=$lvl1 y=1 assign='lvl1']-->       
              <!--[elseif $skill.level == '2']-->
              	<!--[math equation="x + y" x=$skill.skillpoints y=$lvl2sp assign='lvl2sp']-->              
              	<!--[math equation="x + y" x=$lvl2 y=1 assign='lvl2']-->                 	
              <!--[elseif $skill.level == '3']-->
              	<!--[math equation="x + y" x=$skill.skillpoints y=$lvl3sp assign='lvl3sp']-->              
              	<!--[math equation="x + y" x=$lvl3 y=1 assign='lvl3']-->   
              <!--[elseif $skill.level == '4']-->
              	<!--[math equation="x + y" x=$skill.skillpoints y=$lvl4sp assign='lvl4sp']-->              
              	<!--[math equation="x + y" x=$lvl4 y=1 assign='lvl4']-->
              <!--[elseif $skill.level == '5']-->             	
              	<!--[math equation="x + y" x=$skill.skillpoints y=$lvl5sp assign='lvl5sp']-->
              	<!--[math equation="x + y" x=$lvl5 y=1 assign='lvl5']-->
              <!--[/if]-->	       
            <!--[/foreach]-->
            </div>
            <div style="line-height: 1.45em; margin-left: 82px; font-size: 11px;">
              <br /><span style="color:gold;"><span class="navdot">&bull;</span><strong><!--[$countsk]--></strong> <!--[$skill.groupName]--> 
<!--[if $countsk == 1]-->skill<!--[elseif $countsk neq 1]-->skills<!--[/if]--> trained for a total of <strong><!--[$totalsp|number_format]--></strong> skillpoints. <span style="font-size:x-small;">(<strong><!--[$GroupPercentSkills]-->%</strong> of total skills / <strong><!--[$GroupPercentSP]-->%</strong> of total SP)</span></span>
              <br /><span style="color:gold;"><span class="navdot">&bull;</span><strong><!--[$lvl5]--></strong> <!--[if $lvl5 eq 1]-->skill<!--[elseif $lvl5 neq 1]-->skills<!--[/if]--> trained to level 5 for a total of <strong><!--[$lvl5sp|number_format]--></strong> skillpoints.</span>
            </div>
          </div>
        </div>
			    	<!--[math equation="x + y" x=$lvl1sp y=$lvl1sptotal assign='lvl1sptotal']-->
			    	<!--[math equation="x + y" x=$lvl2sp y=$lvl2sptotal assign='lvl2sptotal']-->
			    	<!--[math equation="x + y" x=$lvl3sp y=$lvl3sptotal assign='lvl3sptotal']-->
			    	<!--[math equation="x + y" x=$lvl4sp y=$lvl4sptotal assign='lvl4sptotal']-->
			    	<!--[math equation="x + y" x=$lvl5sp y=$lvl5sptotal assign='lvl5sptotal']-->
			    	<!--[math equation="x + y" x=$lvl1 y=$lvl1total assign='lvl1total']-->	
			    	<!--[math equation="x + y" x=$lvl2 y=$lvl2total assign='lvl2total']-->	
			    	<!--[math equation="x + y" x=$lvl3 y=$lvl3total assign='lvl3total']-->	
			    	<!--[math equation="x + y" x=$lvl4 y=$lvl4total assign='lvl4total']-->	
			    	<!--[math equation="x + y" x=$lvl5 y=$lvl5total assign='lvl5total']-->	
			    	<!--[math equation="x + y" x=$countsk y=$totalSkills assign='totalSkills']-->	    	
      <!--[/foreach]-->
      <!--[math equation="(x / y) * z" x=$lvl1total y=$totalSkills z=100 format="%.1f" assign='TotalPercentageSkills1']-->      
      <!--[math equation="(x / y) * z" x=$lvl2total y=$totalSkills z=100 format="%.1f" assign='TotalPercentageSkills2']-->      
      <!--[math equation="(x / y) * z" x=$lvl3total y=$totalSkills z=100 format="%.1f" assign='TotalPercentageSkills3']-->      
      <!--[math equation="(x / y) * z" x=$lvl4total y=$totalSkills z=100 format="%.1f" assign='TotalPercentageSkills4']-->      
      <!--[math equation="(x / y) * z" x=$lvl5total y=$totalSkills z=100 format="%.1f" assign='TotalPercentageSkills5']-->      
      <!--[math equation="(x / y) * z" x=$lvl1sptotal y=$totalskillpoints z=100 format="%.1f" assign='TotalPercentageSkillPoints1']-->      
      <!--[math equation="(x / y) * z" x=$lvl2sptotal y=$totalskillpoints z=100 format="%.1f" assign='TotalPercentageSkillPoints2']-->      
      <!--[math equation="(x / y) * z" x=$lvl3sptotal y=$totalskillpoints z=100 format="%.1f" assign='TotalPercentageSkillPoints3']-->      
      <!--[math equation="(x / y) * z" x=$lvl4sptotal y=$totalskillpoints z=100 format="%.1f" assign='TotalPercentageSkillPoints4']-->      
      <!--[math equation="(x / y) * z" x=$lvl5sptotal y=$totalskillpoints z=100 format="%.1f" assign='TotalPercentageSkillPoints5']-->      
        <br /><br />
            <div style="line-height: 1.45em; margin-left: 82px; font-size: 11px;">
             <br /><strong>Totals:</strong>
              <br /><span style="color:gold;"><span class="navdot">&bull;</span><strong>~ <!--[$totalCost|number_format]--></strong> ISK spent on skills.</span>
              <br /><span style="color:gold;"><span class="navdot">&bull;</span><strong><!--[$totalSkills]--></strong> <!--[if $totalSkills == 1]-->skill<!--[elseif $totalSkills != 1]-->skills<!--[/if]--> trained for a total of <strong><!--[$skillpointstotal]--></strong> skillpoints.</span>
              <br /><span style="color:gold;"><span class="navdot">&bull;</span><strong><!--[$lvl1total]--></strong> (<!--[$TotalPercentageSkills1]-->%) <!--[if $lvl1total == 1]-->skill<!--[elseif $lvl1total != 1]-->skills<!--[/if]--> trained to level 1 for a total of <strong><!--[$lvl1sptotal|number_format]--></strong> skillpoints which makes up <strong><!--[$TotalPercentageSkillPoints1]-->%</strong> of your total skillpoints.</span>
              <br /><span style="color:gold;"><span class="navdot">&bull;</span><strong><!--[$lvl2total]--></strong> (<!--[$TotalPercentageSkills2]-->%) <!--[if $lvl2total == 1]-->skill<!--[elseif $lvl2total != 1]-->skills<!--[/if]--> trained to level 2 for a total of <strong><!--[$lvl2sptotal|number_format]--></strong> skillpoints which makes up <strong><!--[$TotalPercentageSkillPoints2]-->%</strong> of your total skillpoints.</span>
              <br /><span style="color:gold;"><span class="navdot">&bull;</span><strong><!--[$lvl3total]--></strong> (<!--[$TotalPercentageSkills3]-->%) <!--[if $lvl3total == 1]-->skill<!--[elseif $lvl3total != 1]-->skills<!--[/if]--> trained to level 3 for a total of <strong><!--[$lvl3sptotal|number_format]--></strong> skillpoints which makes up <strong><!--[$TotalPercentageSkillPoints3]-->%</strong> of your total skillpoints.</span>
              <br /><span style="color:gold;"><span class="navdot">&bull;</span><strong><!--[$lvl4total]--></strong> (<!--[$TotalPercentageSkills4]-->%) <!--[if $lvl4total == 1]-->skill<!--[elseif $lvl4total != 1]-->skills<!--[/if]--> trained to level 4 for a total of <strong><!--[$lvl4sptotal|number_format]--></strong> skillpoints which makes up <strong><!--[$TotalPercentageSkillPoints4]-->%</strong> of your total skillpoints.</span>
              <br /><span style="color:gold;"><span class="navdot">&bull;</span><strong><!--[$lvl5total]--></strong> (<!--[$TotalPercentageSkills5]-->%) <!--[if $lvl5total == 1]-->skill<!--[elseif $lvl5total != 1]-->skills<!--[/if]--> trained to level 5 for a total of <strong><!--[$lvl5sptotal|number_format]--></strong> skillpoints which makes up <strong><!--[$TotalPercentageSkillPoints5]-->%</strong> of your total skillpoints.</span>
            </div>
        <br /><br />
      </td>
    </tr>
    <tr>
      <td><div style="margin: auto; width: 100%; text-align: center;"><br /><br /></div></td>
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