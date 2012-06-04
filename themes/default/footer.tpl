    <table style="margin: auto auto 20px; width: 70%;" summary="Copyright Info">
  <tbody>
    <tr>
      <td style="text-align: center;color:grey;">All images and logos are Copyright &copy; <a style="text-decoration: none;color:grey;" title="Copyright CCP" href="http://www.ccpgames.com/">CCP</a></td>
    </tr>
    <tr>
      <td style="text-align: center; font-size: x-small;"><a style="text-decoration: none;color:grey;" href="/stats" title="Character Stats">Top SP</a> / <a style="text-decoration: none;color:grey;" target="_blank" href="https://github.com/ShioR/EVE-Character-Showroom/commits/master/" title="Github"><!--[$dVersion]--> <!--[$version]--></a> / <a style="text-decoration: none;color:grey;" target="_blank" href="https://github.com/ShioR/EVE-Character-Showroom/issues/new" title="New Ticket">Issues?</a>
</td>
</tr>
<tr>
<td style="font-size:xx-small; text-decoration:none; color:grey;" align="center">
</td>
</tr>
    </tr>
  </tbody>
  </table>
  <div id="overlay" style="display:none;" onmouseover="this.style.cursor='pointer'" onclick="hideBox()"></div>
	<div id="chart" style="display:none;">
	  <OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase=http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="700" height="430" id="Column3D" >
         <param name="movie" value="/includes/charts/Column3D.swf" />
         <param name="FlashVars" value="&chartWidth=700&chartHeight=430&dataXML=<chart caption='Skillpoint Distribution for <!--[$name]-->' yAxisName='Skillpoints' showNames='1' decimalPrecision='0' baseFontColor='ffd700' hoverCapBgColor='333333' formatNumberScale='0' rotateNames='1' slantLabels='1' showValues='0' canvasBaseDepth='2' bgColor='333333'>
	<!--[foreach item='grp' from=$grptable]-->
		   <set name='<!--[$grp.grpname]-->' value='<!--[$grp.spcount2]-->' />
    <!--[/foreach]-->			
		</chart>" />
         <param name="quality" value="high" />
         <embed src="/includes/charts/Column3D.swf" flashVars="&chartWidth=700&chartHeight=430&dataXML=<chart caption='Skillpoint Distribution for <!--[$name]-->' yAxisName='Skillpoints' showNames='1' decimalPrecision='0' baseFontColor='ffd700' hoverCapBgColor='333333' formatNumberScale='0' rotateNames='1' slantLabels='1' showvalues='0' canvasBaseDepth='2' bgColor='333333'>
	<!--[foreach item='grp' from=$grptable]-->
		   <set name='<!--[$grp.grpname]-->' value='<!--[$grp.spcount2]-->' />
    <!--[/foreach]-->	
		</chart>" quality="high" width="700" height="430" name="Column3D" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
      </object>    
	</div>