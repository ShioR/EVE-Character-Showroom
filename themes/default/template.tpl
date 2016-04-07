
<!--[include file='header.tpl' page='skills']-->
  <table class="main" summary="Main">
  <tbody>
    <tr>
      <td><br />  
          <!--[include file='mainheader.tpl']-->
          <!--[if $implants == 1]--><!--[include file='maininfo.tpl']--><!--[else]--><!--[include file='maininfo2.tpl']--><!--[/if]-->
          <!--[include file='queue.tpl']-->
          
<!-- SKILLS -->
<div>
    <a href="#top" class="back-to-top"></a>
        <script type="application/javascript">
            var amountScrolled = 300;
                $(window).scroll(function() {
	               if ( $(window).scrollTop() > amountScrolled ) {
		          $('a.back-to-top').fadeIn('slow');
                       } else {
		          $('a.back-to-top').fadeOut('slow');
	                   }
                });
                    $('a.back-to-top').click(function() {
	                $('html, body').animate({
		          scrollTop: 0
	           }, 1000);
	       return false;
           });
        </script>
</div>
<!--[strip]-->
      <!--[assign var='totalCost' value=0]-->   
      <!--[assign var='totalSkills' value=0]-->
      <!--[assign var='lvl0total' value=0]-->
      <!--[assign var='lvl1total' value=0]-->
      <!--[assign var='lvl2total' value=0]-->
      <!--[assign var='lvl3total' value=0]-->
      <!--[assign var='lvl4total' value=0]-->
      <!--[assign var='lvl5total' value=0]-->
      <!--[assign var='lvl0sptotal' value=0]-->       
      <!--[assign var='lvl1sptotal' value=0]-->       
      <!--[assign var='lvl2sptotal' value=0]-->       
      <!--[assign var='lvl3sptotal' value=0]-->       
      <!--[assign var='lvl4sptotal' value=0]-->       
      <!--[assign var='lvl5sptotal' value=0]-->
      <!--[foreach item='skillgroup' key='groupid' from=$skilltree]-->
          <!--[assign var='totalsp' value=0]-->
          <!--[assign var='countsk' value=0]-->
          <!--[assign var='lvl0' value=0]-->
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
</div>
        <div style="margin-top: 50px; margin-bottom: -24px;">
          <div style="margin-top: 10px;">
            <div style="background: rgb(44, 44, 56); background-image: url('/imgs/skillgroups/<!--[$groupname|lower|replace:" ":"_"]-->.png'); background-position:12.5% 50%; background-repeat:no-repeat; background-size:170px 13px; margin-bottom: 10px; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial; height: 23px;"></div>
             <div class="sklnk" title="<!--[$groupname]-->"><img alt="<!--[$skillgroups.$groupid]-->" src="/imgs/skgrpicons/<!--[$groupname|lower|replace:" ":"_"]-->.png" style="border: 0px none ; width: 64px; height: 64px; top: -52px;" class="newsTitleImage" /></div>
            <div style="margin-left: 82px;">
              <!--[foreach item='skill' key='skillid' from=$skillgroup]-->
							<!--[assign var='SkillLevel' value=$skill.level scope="global"]-->
							<!--[assign var='currentSPforSkill' value=$skill.skillpoints]-->
							<!--[assign var='totalSPforSkill' value=$skill.skilllevel5]-->
							<!--[math equation="(x / y) * z" x=$currentSPforSkill y=$totalSPforSkill z=100 format="%.1f" assign='TotalPercentage']-->
              <div style="border-bottom: 1px dotted rgb(80, 80, 80); padding: 2.5px; <!--[if $skill.flag eq 61]-->background-color: #303030;" onmouseout="this.style.backgroundColor='#303030'"<!--[/if]-->" onmouseover="this.style.backgroundColor='#303030'; this.style.cursor='default'" onmouseout="this.style.backgroundColor='#1B1B1B'">
					<!--[if $skill.flag eq 61]-->	
				        <div style="float: left;margin-right:4px;"><img alt="" src="/imgs/sklvlicons/levelPartiallyTrained.png" width="16" height="16" /></div>
						<div style="float: right;margin-top:4px;"><img alt="level<!--[$skill.level]-->" src="/imgs/sklvlicons/level<!--[math equation="x + y" x=$skill.level y=1]-->_act.gif" width="48" height="8" /></div>
					<!--[elseif $SkillQueue.0.typeID eq $skill.typeID || $SkillQueue.1.typeID eq $skill.typeID || $SkillQueue.2.typeID eq $skill.typeID || $SkillQueue.3.typeID eq $skill.typeID || $SkillQueue.4.typeID eq $skill.typeID || $SkillQueue.5.typeID eq $skill.typeID || $SkillQueue.6.typeID eq $skill.typeID || $SkillQueue.7.typeID eq $skill.typeID || $SkillQueue.8.typeID eq $skill.typeID || $SkillQueue.9.typeID eq $skill.typeID || $SkillQueue.10.typeID eq $skill.typeID || $SkillQueue.11.typeID eq $skill.typeID || $SkillQueue.12.typeID eq $skill.typeID || $SkillQueue.13.typeID eq $skill.typeID || $SkillQueue.14.typeID eq $skill.typeID || $SkillQueue.15.typeID eq $skill.typeID || $SkillQueue.16.typeID eq $skill.typeID || $SkillQueue.17.typeID eq $skill.typeID || $SkillQueue.18.typeID eq $skill.typeID || $SkillQueue.19.typeID eq $skill.typeID || $SkillQueue.20.typeID eq $skill.typeID || $SkillQueue.21.typeID eq $skill.typeID || $SkillQueue.22.typeID eq $skill.typeID || $SkillQueue.23.typeID eq $skill.typeID || $SkillQueue.24.typeID eq $skill.typeID || $SkillQueue.25.typeID eq $skill.typeID || $SkillQueue.26.typeID eq $skill.typeID || $SkillQueue.27.typeID eq $skill.typeID || $SkillQueue.28.typeID eq $skill.typeID || $SkillQueue.29.typeID eq $skill.typeID || $SkillQueue.30.typeID eq $skill.typeID || $SkillQueue.31.typeID eq $skill.typeID || $SkillQueue.32.typeID eq $skill.typeID || $SkillQueue.33.typeID eq $skill.typeID || $SkillQueue.34.typeID eq $skill.typeID || $SkillQueue.35.typeID eq $skill.typeID || $SkillQueue.36.typeID eq $skill.typeID || $SkillQueue.37.typeID eq $skill.typeID || $SkillQueue.38.typeID eq $skill.typeID || $SkillQueue.39.typeID eq $skill.typeID || $SkillQueue.40.typeID eq $skill.typeID || $SkillQueue.41.typeID eq $skill.typeID || $SkillQueue.42.typeID eq $skill.typeID || $SkillQueue.43.typeID eq $skill.typeID || $SkillQueue.44.typeID eq $skill.typeID || $SkillQueue.45.typeID eq $skill.typeID || $SkillQueue.46.typeID eq $skill.typeID || $SkillQueue.47.typeID eq $skill.typeID || $SkillQueue.48.typeID eq $skill.typeID || $SkillQueue.49.typeID eq $skill.typeID || $SkillQueue.50.typeID eq $skill.typeID]-->
							<div style="float: left;margin-right:4px;"><img alt="" src="/imgs/sklvlicons/levelTrainedQueue.png" width="16" height="16" /></div>
						<div style="float: right;margin-top:4px;"><img alt="Skill in queue" src="/imgs/sklvlicons/level<!--[$skill.level]-->-<!--[if $SkillQueue.1.typeID eq $skill.typeID]--><!--[$SkillQueue.1.level]--><!--[elseif $SkillQueue.2.typeID eq $skill.typeID]--><!--[$SkillQueue.2.level]--><!--[elseif $SkillQueue.3.typeID eq $skill.typeID]--><!--[$SkillQueue.3.level]--><!--[elseif $SkillQueue.4.typeID eq $skill.typeID]--><!--[$SkillQueue.4.level]--><!--[elseif $SkillQueue.5.typeID eq $skill.typeID]--><!--[$SkillQueue.5.level]--><!--[elseif $SkillQueue.6.typeID eq $skill.typeID]--><!--[$SkillQueue.6.level]--><!--[elseif $SkillQueue.7.typeID eq $skill.typeID]--><!--[$SkillQueue.7.level]--><!--[elseif $SkillQueue.8.typeID eq $skill.typeID]--><!--[$SkillQueue.8.level]--><!--[elseif $SkillQueue.9.typeID eq $skill.typeID]--><!--[$SkillQueue.9.level]--><!--[elseif $SkillQueue.10.typeID eq $skill.typeID]--><!--[$SkillQueue.10.level]--><!--[elseif $SkillQueue.11.typeID eq $skill.typeID]--><!--[$SkillQueue.11.level]--><!--[elseif $SkillQueue.12.typeID eq $skill.typeID]--><!--[$SkillQueue.12.level]--><!--[elseif $SkillQueue.13.typeID eq $skill.typeID]--><!--[$SkillQueue.13.level]--><!--[elseif $SkillQueue.14.typeID eq $skill.typeID]--><!--[$SkillQueue.14.level]--><!--[elseif $SkillQueue.15.typeID eq $skill.typeID]--><!--[$SkillQueue.15.level]--><!--[elseif $SkillQueue.16.typeID eq $skill.typeID]--><!--[$SkillQueue.16.level]--><!--[elseif $SkillQueue.17.typeID eq $skill.typeID]--><!--[$SkillQueue.17.level]--><!--[elseif $SkillQueue.18.typeID eq $skill.typeID]--><!--[$SkillQueue.18.level]--><!--[elseif $SkillQueue.19.typeID eq $skill.typeID]--><!--[$SkillQueue.19.level]--><!--[elseif $SkillQueue.20.typeID eq $skill.typeID]--><!--[$SkillQueue.20.level]--><!--[elseif $SkillQueue.21.typeID eq $skill.typeID]--><!--[$SkillQueue.21.level]--><!--[elseif $SkillQueue.22.typeID eq $skill.typeID]--><!--[$SkillQueue.22.level]--><!--[elseif $SkillQueue.23.typeID eq $skill.typeID]--><!--[$SkillQueue.23.level]--><!--[elseif $SkillQueue.24.typeID eq $skill.typeID]--><!--[$SkillQueue.24.level]--><!--[elseif $SkillQueue.25.typeID eq $skill.typeID]--><!--[$SkillQueue.25.level]--><!--[elseif $SkillQueue.26.typeID eq $skill.typeID]--><!--[$SkillQueue.26.level]--><!--[elseif $SkillQueue.27.typeID eq $skill.typeID]--><!--[$SkillQueue.27.level]--><!--[elseif $SkillQueue.28.typeID eq $skill.typeID]--><!--[$SkillQueue.28.level]--><!--[elseif $SkillQueue.29.typeID eq $skill.typeID]--><!--[$SkillQueue.29.level]--><!--[elseif $SkillQueue.30.typeID eq $skill.typeID]--><!--[$SkillQueue.30.level]--><!--[elseif $SkillQueue.31.typeID eq $skill.typeID]--><!--[$SkillQueue.31.level]--><!--[elseif $SkillQueue.32.typeID eq $skill.typeID]--><!--[$SkillQueue.32.level]--><!--[elseif $SkillQueue.33.typeID eq $skill.typeID]--><!--[$SkillQueue.33.level]--><!--[elseif $SkillQueue.34.typeID eq $skill.typeID]--><!--[$SkillQueue.34.level]--><!--[elseif $SkillQueue.35.typeID eq $skill.typeID]--><!--[$SkillQueue.35.level]--><!--[elseif $SkillQueue.36.typeID eq $skill.typeID]--><!--[$SkillQueue.36.level]--><!--[elseif $SkillQueue.37.typeID eq $skill.typeID]--><!--[$SkillQueue.37.level]--><!--[elseif $SkillQueue.38.typeID eq $skill.typeID]--><!--[$SkillQueue.38.level]--><!--[elseif $SkillQueue.39.typeID eq $skill.typeID]--><!--[$SkillQueue.39.level]--><!--[elseif $SkillQueue.40.typeID eq $skill.typeID]--><!--[$SkillQueue.40.level]--><!--[elseif $SkillQueue.41.typeID eq $skill.typeID]--><!--[$SkillQueue.41.level]--><!--[elseif $SkillQueue.42.typeID eq $skill.typeID]--><!--[$SkillQueue.42.level]--><!--[elseif $SkillQueue.43.typeID eq $skill.typeID]--><!--[$SkillQueue.43.level]--><!--[elseif $SkillQueue.44.typeID eq $skill.typeID]--><!--[$SkillQueue.44.level]--><!--[elseif $SkillQueue.45.typeID eq $skill.typeID]--><!--[$SkillQueue.45.level]--><!--[elseif $SkillQueue.46.typeID eq $skill.typeID]--><!--[$SkillQueue.46.level]--><!--[elseif $SkillQueue.47.typeID eq $skill.typeID]--><!--[$SkillQueue.47.level]--><!--[elseif $SkillQueue.48.typeID eq $skill.typeID]--><!--[$SkillQueue.48.level]--><!--[elseif $SkillQueue.49.typeID eq $skill.typeID]--><!--[$SkillQueue.49.level]--><!--[elseif $SkillQueue.50.typeID eq $skill.typeID]--><!--[$SkillQueue.50.level]--><!--[/if]-->_q.gif" width="48" height="8" /></div>
					<!--[/if]-->
					<!--[if $queuePos0 eq $skill.typeID]-->
						<!--[if $skill.flag neq 61]-->
							<div style="display:none;"></div>
						<!--[else]-->
							<div style="display:none;"></div>
						<!--[/if]-->	
					<!--[/if]-->	
					<!--[if $SkillQueue.1.typeID eq $skill.typeID || $SkillQueue.2.typeID eq $skill.typeID || $SkillQueue.3.typeID eq $skill.typeID || $SkillQueue.4.typeID eq $skill.typeID || $SkillQueue.5.typeID eq $skill.typeID || $SkillQueue.6.typeID eq $skill.typeID || $SkillQueue.7.typeID eq $skill.typeID || $SkillQueue.8.typeID eq $skill.typeID || $SkillQueue.9.typeID eq $skill.typeID || $SkillQueue.10.typeID eq $skill.typeID || $SkillQueue.11.typeID eq $skill.typeID || $SkillQueue.12.typeID eq $skill.typeID || $SkillQueue.13.typeID eq $skill.typeID || $SkillQueue.14.typeID eq $skill.typeID || $SkillQueue.15.typeID eq $skill.typeID || $SkillQueue.16.typeID eq $skill.typeID || $SkillQueue.17.typeID eq $skill.typeID || $SkillQueue.18.typeID eq $skill.typeID || $SkillQueue.19.typeID eq $skill.typeID || $SkillQueue.20.typeID eq $skill.typeID || $SkillQueue.21.typeID eq $skill.typeID || $SkillQueue.22.typeID eq $skill.typeID || $SkillQueue.23.typeID eq $skill.typeID || $SkillQueue.24.typeID eq $skill.typeID || $SkillQueue.25.typeID eq $skill.typeID || $SkillQueue.26.typeID eq $skill.typeID || $SkillQueue.27.typeID eq $skill.typeID || $SkillQueue.28.typeID eq $skill.typeID || $SkillQueue.29.typeID eq $skill.typeID || $SkillQueue.30.typeID eq $skill.typeID || $SkillQueue.31.typeID eq $skill.typeID || $SkillQueue.32.typeID eq $skill.typeID || $SkillQueue.33.typeID eq $skill.typeID || $SkillQueue.34.typeID eq $skill.typeID || $SkillQueue.35.typeID eq $skill.typeID || $SkillQueue.36.typeID eq $skill.typeID || $SkillQueue.37.typeID eq $skill.typeID || $SkillQueue.38.typeID eq $skill.typeID || $SkillQueue.39.typeID eq $skill.typeID || $SkillQueue.40.typeID eq $skill.typeID || $SkillQueue.41.typeID eq $skill.typeID || $SkillQueue.42.typeID eq $skill.typeID || $SkillQueue.43.typeID eq $skill.typeID || $SkillQueue.44.typeID eq $skill.typeID || $SkillQueue.45.typeID eq $skill.typeID || $SkillQueue.46.typeID eq $skill.typeID || $SkillQueue.47.typeID eq $skill.typeID || $SkillQueue.48.typeID eq $skill.typeID || $SkillQueue.49.typeID eq $skill.typeID || $SkillQueue.50.typeID eq $skill.typeID]-->
						<div style="display:none;"></div>
					<!--[elseif $skill.flag neq 61]-->	
						<!--[if $queuePos0 eq $skill.typeID]-->
							<div style="display:none;"></div>
						<!--[else]-->
                            <!--[if $skill.level == '5']-->
							<div style="float: left;margin-right:4px;"><img alt="" src="/imgs/sklvlicons/fullyTrained.png" width="16" height="16" /></div>
							<div style="float: right;margin-top:4px;"><img alt="level<!--[$skill.level]-->" src="/imgs/sklvlicons/level<!--[$skill.level]-->.gif" width="48" height="8" /></div>
                            <!--[else]-->
							<div style="float: left;margin-right:4px;"><img alt="" src="/imgs/sklvlicons/levelTrained.png" width="16" height="16" /></div>
							<div style="float: right;margin-top:4px;"><img alt="level<!--[$skill.level]-->" src="/imgs/sklvlicons/level<!--[$skill.level]-->.gif" width="48" height="8" /></div>
						<!--[/if]-->
						<!--[/if]-->
					<!--[/if]-->
                <div style="line-height: 1.45em; font-size: 11px;">
                <!--[if $TotalPercentage neq 100.0]-->
                    <div style="color:white; text-decoration:none; cursor:help;" onclick="javascript:i(document.getElementById('<!--[$skill.typeID]-->'));" href="#toggle" id="s<!--[$skill.typeID]-->"><!--[$skill.typeName]--><span style="color:#777; font-size: x-small;"><span style="color:#c1c1c1;"> » </span><i>Rank <!--[$skill.rank]--></i> / <i>SP: <!--[$skill.skillpoints|number_format]--> of <!--[$skill.skilllevel5|number_format]--> / <!--[$TotalPercentage]-->%</div></i></span>         
                <!--[else]-->
                    <div style="color:white; text-decoration:none; cursor:help;" onclick="javascript:i(document.getElementById('<!--[$skill.typeID]-->'));" href="#toggle" id="s<!--[$skill.typeID]-->"><!--[$skill.typeName]--><span style="color:#777; font-size: x-small;"><span style="color:#c1c1c1;"> » </span><i>Rank <!--[$skill.rank]--></i> / <i>SP: <!--[$skill.skillpoints|number_format]--> of <!--[$skill.skilllevel5|number_format]--> / <!--[$TotalPercentage]-->%</div></i></span>
                <!--[/if]-->
                </div>
                <!--[if $skill.flag eq 61]-->
                <div>
                  <div style="line-height: 1.5em;margin-left:13px;font-size:11px">
                    <div>
                      <span class="navdot">&#xB7;</span><span style="color:gold;">Training to: </span>
                      <strong>Level <!--[math equation="x + y" x=$skill.level y=1]--></strong>
                    </div>
                    <div>
                     <span class="navdot">&#xB7;</span><span style="color:gold;">Progress: </span>
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
							<span style="color:#c8c8c8;margin-left:20px;">Description: </span><!--[getskillinfo typeID=$skill.typeID]-->
							<span style="color:#c8c8c8;margin-left:20px;">Cost: </span><!--[$skill.skillCost|number_format]--> ISK	
			  </div>
              <!--[/if]-->  
              </div>
              <!--[math equation="x + y" x=$totalsp y=$skill.skillpoints assign='totalsp']-->
              <!--[math equation="x + y" x=$totalCost y=$skill.skillCost assign='totalCost']-->
              <!--[math equation="x + y" x=$countsk y=1 assign='countsk']-->
              <!--[math equation="(x / y) * z" x=$totalsp y=$totalskillpoints z=100 format="%.1f" assign='GroupPercentSP']--> 
              <!--[math equation="(x / y) * z" x=$countsk y=$totalsks z=100 format="%.1f" assign='GroupPercentSkills']-->
              <!--[if $skill.level == '0']-->           
              	<!--[math equation="x + y" x=$lvl0 y=1 assign='lvl0']-->    
              <!--[elseif $skill.level == '1']-->
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
                <br /><span style="color:#777;"><span class="navdot">&bull;</span><!--[$countsk]-->/<!--[if $groupname == "Armor"]--><!--[getskillgroup groupID='1210']--><!--[elseif $groupname == "Corporation Management"]--><!--[getskillgroup groupID='266']--><!--[elseif $groupname == "Drones"]--><!--[getskillgroup groupID='273']--><!--[elseif $groupname == "Electronic Systems"]--><!--[getskillgroup groupID='272']--><!--[elseif $groupname == "Engineering"]--><!--[getskillgroup groupID='1216']--><!--[elseif $groupname == "Gunnery"]--><!--[getskillgroup groupID='255']--><!--[elseif $groupname == "Leadership"]--><!--[getskillgroup groupID='258']--><!--[elseif $groupname == "Missiles"]--><!--[getskillgroup groupID='256']--><!--[elseif $groupname == "Navigation"]--><!--[getskillgroup groupID='275']--><!--[elseif $groupname == "Neural Enhancement"]--><!--[getskillgroup groupID='1220']--><!--[elseif $groupname == "Planet Management"]--><!--[getskillgroup groupID='1241']--><!--[elseif $groupname == "Production"]--><!--[getskillgroup groupID='268']--><!--[elseif $groupname == "Resource Processing"]--><!--[getskillgroup groupID='1218']--><!--[elseif $groupname == "Rigging"]--><!--[getskillgroup groupID='269']--><!--[elseif $groupname == "Scanning"]--><!--[getskillgroup groupID='1217']--><!--[elseif $groupname == "Science"]--><!--[getskillgroup groupID='270']--><!--[elseif $groupname == "Shields"]--><!--[getskillgroup groupID='1209']--><!--[elseif $groupname == "Social"]--><!--[getskillgroup groupID='278']--><!--[elseif $groupname == "Spaceship Command"]--><!--[getskillgroup groupID='257']--><!--[elseif $groupname == "Structure Management"]--><!--[getskillgroup groupID='1545']--><!--[elseif $groupname == "Subsystems"]--><!--[getskillgroup groupID='1240']--><!--[elseif $groupname == "Targeting"]--><!--[getskillgroup groupID='1213']--><!--[elseif $groupname == "Trade"]--><!--[getskillgroup groupID='274']--><!--[/if]--> <!--[$skill.groupName]--> 
                <!--[if $countsk == 1]--> skill<!--[elseif $countsk neq 1]--> skills<!--[/if]--> trained for a total of <!--[$totalsp|number_format]--> skillpoints. <span style="font-size:x-small;">(<strong><!--[$GroupPercentSkills]-->%</strong> of total skills / <strong><!--[$GroupPercentSP]-->%</strong> of total SP)</span></span>
                <br /><span style="color:#777;"><span class="navdot">&bull;</span><strong><!--[$lvl5]--></strong> <!--[if $lvl5 eq 1]-->skill<!--[elseif $lvl5 neq 1]-->skills<!--[/if]--> trained to <strong>level 5</strong> for a total of <strong><!--[$lvl5sp|number_format]--></strong> skillpoionts.</span>
            </div>
          </div>
        </div>
			    	<!--[math equation="x + y" x=$lvl1sp y=$lvl1sptotal assign='lvl1sptotal']-->
			    	<!--[math equation="x + y" x=$lvl2sp y=$lvl2sptotal assign='lvl2sptotal']-->
			    	<!--[math equation="x + y" x=$lvl3sp y=$lvl3sptotal assign='lvl3sptotal']-->
			    	<!--[math equation="x + y" x=$lvl4sp y=$lvl4sptotal assign='lvl4sptotal']-->
			    	<!--[math equation="x + y" x=$lvl5sp y=$lvl5sptotal assign='lvl5sptotal']-->
			    	<!--[math equation="x + y" x=$lvl0 y=$lvl0total assign='lvl0total']-->	
			    	<!--[math equation="x + y" x=$lvl1 y=$lvl1total assign='lvl1total']-->	
			    	<!--[math equation="x + y" x=$lvl2 y=$lvl2total assign='lvl2total']-->	
			    	<!--[math equation="x + y" x=$lvl3 y=$lvl3total assign='lvl3total']-->	
			    	<!--[math equation="x + y" x=$lvl4 y=$lvl4total assign='lvl4total']-->	
			    	<!--[math equation="x + y" x=$lvl5 y=$lvl5total assign='lvl5total']-->	
			    	<!--[math equation="x + y" x=$countsk y=$totalSkills assign='totalSkills']-->	    	
      <!--[/foreach]-->
      <!--[math equation="(x / y) * z" x=$totalSkills y=$getskillstotal z=100 format="%.1f" assign='GroupTotalPercentage']-->       
      <!--[math equation="(x / y) * z" x=$lvl0total y=$totalSkills z=100 format="%.1f" assign='TotalPercentageSkills0']-->      
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
             <br /><strong>Stats:</strong>
              <br /><span style="color:#777;"><span class="navdot">&bull;</span><strong>~<span style="color:gold;"><!--[$totalCost|number_format]--></span></strong> ISK spent on skills.</span>
                <br /><span style="color:#777;"><span class="navdot">&bull;</span><span style="color:gold;"><strong><!--[$totalSkills]--></strong>/<!--[$getskillstotal]--></span> (<!--[$GroupTotalPercentage]-->%) <!--[if $totalSkills == 1]-->skill<!--[elseif $totalSkills != 1]-->skills<!--[/if]--> trained for a total of <span style="color:gold;"><strong><!--[$skillpointstotal]--></span></strong> skillpoints.</span>
                <br /><span style="color:#777;"><span class="navdot">&bull;</span><span style="color:gold;"><strong><!--[$lvl0total]--></strong></span> (<!--[$TotalPercentageSkills0]-->%)  <!--[if $lvl0total == 1]-->skill<!--[elseif $lvl0total != 1]-->skills<!--[/if]--> injected awaiting training.</span>
                <br /><span style="color:#777;"><span class="navdot">&bull;</span><span style="color:gold;"><strong><!--[$lvl1total]--></strong></span> (<!--[$TotalPercentageSkills1]-->%) <!--[if $lvl1total == 1]-->skill<!--[elseif $lvl1total != 1]-->skills<!--[/if]--> trained to <span style="color:gold;"><strong>level 1</strong></span><!--[if $lvl1total == 0]-->. <!--[elseif $lvl1total > 0]--> for a total of <span style="color:gold;"><strong><!--[$lvl1sptotal|number_format]--></strong></span> skillpoints which makes up <span style="color:gold;"><strong><!--[$TotalPercentageSkillPoints1]-->%</span></strong> of your total skillpoints.</span><!--[/if]-->
                <br /><span style="color:#777;"><span class="navdot">&bull;</span><span style="color:gold;"><strong><!--[$lvl2total]--></strong></span> (<!--[$TotalPercentageSkills2]-->%) <!--[if $lvl2total == 1]-->skill<!--[elseif $lvl2total != 1]-->skills<!--[/if]--> trained to <span style="color:gold;"><strong>level 2</strong></span><!--[if $lvl2total == 0]-->. <!--[elseif $lvl2total > 0]--> for a total of <span style="color:gold;"><strong><!--[$lvl2sptotal|number_format]--></strong></span> skillpoints which makes up <span style="color:gold;"><strong><!--[$TotalPercentageSkillPoints2]-->%</span></strong> of your total skillpoints.</span><!--[/if]-->
                <br /><span style="color:#777;"><span class="navdot">&bull;</span><span style="color:gold;"><strong><!--[$lvl3total]--></strong></span> (<!--[$TotalPercentageSkills3]-->%) <!--[if $lvl3total == 1]-->skill<!--[elseif $lvl3total != 1]-->skills<!--[/if]--> trained to <span style="color:gold;"><strong>level 3</strong></span><!--[if $lvl3total == 0]-->. <!--[elseif $lvl3total > 0]--> for a total of <span style="color:gold;"><strong><!--[$lvl3sptotal|number_format]--></strong></span> skillpoints which makes up <span style="color:gold;"><strong><!--[$TotalPercentageSkillPoints3]-->%</span></strong> of your total skillpoints.</span><!--[/if]-->
                <br /><span style="color:#777;"><span class="navdot">&bull;</span><span style="color:gold;"><strong><!--[$lvl4total]--></strong></span> (<!--[$TotalPercentageSkills4]-->%) <!--[if $lvl4total == 1]-->skill<!--[elseif $lvl4total != 1]-->skills<!--[/if]--> trained to <span style="color:gold;"><strong>level 4</strong></span><!--[if $lvl4total == 0]-->. <!--[elseif $lvl4total > 0]--> for a total of <span style="color:gold;"><strong><!--[$lvl4sptotal|number_format]--></strong></span> skillpoints which makes up <span style="color:gold;"><strong><!--[$TotalPercentageSkillPoints4]-->%</span></strong> of your total skillpoints.</span><!--[/if]-->
                <br /><span style="color:#777;"><span class="navdot">&bull;</span><span style="color:gold;"><strong><!--[$lvl5total]--></strong></span> (<!--[$TotalPercentageSkills5]-->%) <!--[if $lvl5total == 1]-->skill<!--[elseif $lvl5total != 1]-->skills<!--[/if]--> trained to <span style="color:gold;"><strong>level 5</strong></span><!--[if $lvl5total == 0]-->. <!--[elseif $lvl5total > 0]--> for a total of <span style="color:gold;"><strong><!--[$lvl5sptotal|number_format]--></strong></span> skillpoints which makes up <span style="color:gold;"><strong><!--[$TotalPercentageSkillPoints5]-->%</span></strong> of your total skillpoints.</span><!--[/if]-->
            </div>
        <br /><br />
      </td>
    </tr>
    <tr>
      <td><div style="margin: auto; width: 100%; text-align: center;"><br /><br /></div></td>
    </tr>
  </tbody>
  </table>
<!--[/strip]-->
<!--[include file='footer.tpl']-->