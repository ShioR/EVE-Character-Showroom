    <table style="margin: auto auto 20px; width: 70%;" summary="Copyright Info">
  <tbody>
    <tr>
      <td style="text-align: center;color:grey;">All images and logos are Copyright &copy; <a style="text-decoration: none;color:grey;" title="Copyright CCP" href="http://www.ccpgames.com/">CCP</a></td>
    </tr>
    <tr>
      <td style="text-align: center; font-size: x-small;"><a style="text-decoration: none;color:grey;" href="/stats" title="Character Stats">Top SP</a> / <a style="text-decoration: none;color:grey;" target="_blank" href="http://txsi.co.uk/trac/changeset/latest/" title="Changelog"><!--[$version]--></a> / <a style="text-decoration: none;color:grey;" target="_blank" href="http://txsi.co.uk/trac/newticket/" title="Feedback">Feedback</a>
</td>
</tr>
<tr>
<td>
<center><a style="font-size:xx-small; text-decoration:none; color:grey;" href="https://www.deepspacesupply.com/product_info.php?ref=189&products_id=47&affiliate_banner_id=8" target="_blank">Support the site, buy a GTC!</a></center>
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
	<div id="box" style="display:none;">
	    <img id="close" src="/imgs/close.gif" onmouseover="this.style.cursor='pointer'" onclick="hideBox()" alt="Close" title="Close this window" />
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
<!-- Tracking --> 
<script type="text/javascript">
var pkBaseURL = (("https:" == document.location.protocol) ? "https://irsekrit.com/stats/" : "http://irsekrit.com/stats/");
document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
</script><script type="text/javascript">
try {
var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 2);
piwikTracker.trackPageView();
piwikTracker.enableLinkTracking();
} catch( err ) {}
</script><noscript><p><img src="http://irsekrit.com/stats/piwik.php?idsite=2" style="border:0" alt="" /></p></noscript>
<!-- End Tracking Tag -->  
