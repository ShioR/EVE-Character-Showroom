
<!-- QUEUE -->
<!--[strip]-->
<!--[if $SkillQueue]-->
	<table class="dataTable2" border="0" cellpadding="2" cellspacing="0" width="100%" summary="Skill Queue Info" style="margin-top: 40px;line-height: 1em;font-size:11px;">
	  <tbody style=" border-color: #000;">
	    <tr>
	      <td colspan="5" class="dataTableHeader2">Skill Queue</td>
	    </tr>
	    <tr style="font-weight: bold;">
	      <td class="dataTableCell">Skill</td>
	      <td class="dataTableCell">Skill Points</td>
	      <td class="dataTableCell">Starts</td>
	      <td class="dataTableCell" colspan="1">Ends</td>
	      <td class="dataTableCellEnd" colspan="1">Level</td>
	    </tr>
<!--[foreach item='queue' from=$SkillQueue]-->
	<!--[if $Training]-->
	    <tr>
            <!--[if $queue.queuePosition == 0]-->
                <td style="display:none;">
            <!--[elseif $queue.queuePosition > 0]-->
                <td class="dataTableCell13" onclick="javascript:i(document.getElementById('<!--[$queue.typeID]-->'));" onmouseover="this.style.backgroundColor='#303030';" onmouseout="this.style.backgroundColor='#1B1B1B'"><a style="color:white;text-decoration:none;padding-left:3px;font-size:12px;"  href="/<!--[$name|replace:' ':'_']-->#s<!--[$queue.typeID]-->" id="q<!--[$queue.typeID]-->"><!--[$queue.typeName]--> <span style="font-size:11px;"><span style="color:#777;font-size:11px;"><span style="color:#c1c1c1;"> » </span><i>Rank <!--[$queue.rank]--></i></span></span></a></td>
            <!--[/if]-->
	        <!--[if $queue.queuePosition == 0]-->
                <td style="display:none;">
            <!--[elseif $queue.queuePosition > 0]--> <td style="font-size:10px;" class="dataTableCell2" width="150" align="left"><!--[$queue.startSP|number_format]--> of <span style="color:gold;"><!--[$queue.endSP|number_format]--></span></td>
            <!--[/if]-->
	        <!--[if $queue.queuePosition == 0]-->
                <td style="display:none;">
            <!--[elseif $queue.queuePosition > 0]--><td style="font-size:10px;" class="dataTableCell2" width="120"><!--[$queue.startTime|date_format:"%a %d %b, %H:%M"]--></td>
            <!--[/if]-->
	        <!--[if $queue.queuePosition == 0]-->
                <td style="display:none;">
            <!--[elseif $queue.queuePosition > 0]--><td style="font-size:10px;" class="dataTableCell2" width="120"><!--[$queue.endTime|date_format:"%a %d %b, %H:%M"]--></td><!--[/if]-->
	        <!--[if $queue.queuePosition == 0]-->
                <td style="display:none;">
            <!--[elseif $queue.queuePosition > 0]--><td style="font-size:10px;" class="dataTableCell2" width="48"><img alt="level<!--[$queue.level]-->" src="/imgs/sklvlicons/level<!--[$queue.level]-->_q.gif" width="48" height="8" /></td>
            <!--[/if]-->
	    </tr>
	       <!--[else]-->   
        <tr>
            <td class="dataTableCell13"  onclick="javascript:i(document.getElementById('<!--[$queue.typeID]-->'));" onmouseover="this.style.backgroundColor='#303030';" onmouseout="this.style.backgroundColor='#1B1B1B'"><a style="color:white;text-decoration:none;padding-left:3px;font-size:12px;"  href="#s<!--[$queue.typeID]-->" id="q<!--[$queue.typeID]-->"><!--[$queue.typeName]--> <span style="font-size:11px;"><span style="color:#777; font-size:11px;"><span style="color:#c1c1c1;"> » </span><i>Rank <!--[$queue.rank]--></i></span></span></a></td>
	           <td class="dataTableCell2" width="150" align="left"><!--[$queue.startSP|number_format]--> of <span style="color: gold;"><!--[$queue.endSP|number_format]--></span></td>
	           <td class="dataTableCell2" width="120"><!--[$queue.startTime|date_format:"%a %d %b, %H:%M"]--></td>
	           <td class="dataTableCell2" width="120"><!--[$queue.endTime|date_format:"%a %d %b, %H:%M"]--></td>
	           <td class="dataTableCell2" width="48"><img alt="level<!--[$queue.level]-->" src="/imgs/sklvlicons/level<!--[$queue.level]-->_q.gif" width="48" height="8" /></td>
	    </tr>
	       <!--[/if]-->
<!--[/foreach]-->
	  </tbody>
  </table>
<!--[/if]-->
<!--[/strip]-->