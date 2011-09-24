<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
  <meta content="text/html; charset=UTF-8" http-equiv="Content-Type" />
  <meta name="description" content="Eve Online Skill sheet" />
  <meta name="robots" content="index,follow" />
  <meta name="resource-type" content="document" />
  <meta http-equiv="expires" content="0" />
  <meta name="author" content="Eve Online" />
  <meta name="copyright" content="Copyright (c) 2011 The Xenodus Initiative." />
  <meta name="revisit-after" content="1 days" />
  <meta name="distribution" content="Global" />
  <meta name="generator" content="Eve Online" />
  <meta name="rating" content="General" />
  <meta name="KEYWORDS" content="eveonline, skills" />
  <!--[if $page eq 'skills']-->
  <title><!--[$name]--> / Skills</title>
  <!--[elseif $page eq 'ships']-->
  <title><!--[$name]--> / Ships</title>
  <!--[elseif $page eq 'certs']-->
  <title><!--[$name]--> / Certificates</title>   
  <!--[elseif $page eq 'standings']-->
  <title><!--[$name]--> / Standings</title>   
  <!--[elseif $page eq 'siglist']-->
  <title><!--[$name]--> / Signatures</title>    
  <!--[else]-->
  <title>Skills Showroom</title>
  <!--[/if]-->
  <link rel="stylesheet" type="text/css" href="/themes/<!--[$theme]-->/style/<!--[$theme]-->.css" />
  <script src="/themes/<!--[$theme]-->/js/js.js" type="text/javascript"></script>
  <script>function newPopup(url){popupWindow=window.open(url,'popUpWindow','height=810,width=975,left=10,top=10,resizable=yes,scrollbars=yes,toolbar=no,menubar=no,location=no,directories=no,status=yes')}</script>
  <script>function i(which){if(!document.getElementById)
return
if(which.style.display=="block")
which.style.display="none"
else
which.style.display="block"}</script>
</head>
  <div class="headerribbon"<!--[if not $page]--> style="height: 26px;"<!--[/if]-->>
  <!--[if $page]-->
<span class="headerleft"><a onmouseover="ShowContent('skillsidebox'); return true;" onmouseout="HideContent('skillsidebox'); return true;" href="#"><img align="left" style="border: 1px solid gray;" src="https://image.eveonline.com/Character/<!--[$characterID]-->_32.jpg" width="32" height="32" title="" alt="<!--[$name]-->" vspace="3" hspace="3" /></a>Skillsheet for <span style="color:gold;"><!--[$name]--></span><span style="color:gold; cursor:pointer;" onclick="JavaScript:newPopup('https://gate.eveonline.com/Mail/Compose/<!--[$name]-->');"> [Send EVEMail]</span><br />Member of <span style="color:gold; cursor:pointer;" onclick="JavaScript:newPopup('http://evemaps.dotlan.net/corp/<!--[$corporationName|replace:" ":"_"]-->');"><!--[$corporationName]--></span><!--[if $allianceName neq '']--> <span style="color:gold; cursor:pointer;" onclick="JavaScript:newPopup('http://evemaps.dotlan.net/alliance/<!--[$allianceName|replace:" ":"_"]-->');">[<!--[$allianceName]-->]</span><!--[else]--><!--[/if]--></span>
    <span class="headerright2">
    <!--[if $page eq 'skills']-->
      [ SKILLS ]
      [ <a class="golden" href="/<!--[$name|replace:' ':'_']-->/ships" title="Ships <!--[$name]--> can fly">SHIPS</a> ]
      [ <a class="golden" href="/<!--[$name|replace:' ':'_']-->/certs" title="Certificates for <!--[$name]-->">CERTS</a> ]
<!--      [ <a class="golden" href="/<!--[$name|replace:' ':'_']-->/standings" title="Standings for <!--[$name]-->">STANDINGS</a> ] -->
      [ <a class="golden" href="/<!--[$name|replace:' ':'_']-->/sigs" title="Signatures for <!--[$name]-->">SIGNATURES</a> ]
    <!--[elseif $page eq 'ships']-->
      [ <a class="golden" href="/<!--[$name|replace:' ':'_']-->/" title="Skillsheet for <!--[$name]-->">SKILLS</a> ]
      [ SHIPS ]
      [ <a class="golden" href="/<!--[$name|replace:' ':'_']-->/certs" title="Certificates for <!--[$name]-->">CERTS</a> ]
<!--      [ <a class="golden" href="/<!--[$name|replace:' ':'_']-->/standings" title="Standings for <!--[$name]-->">STANDINGS</a> ] -->
      [ <a class="golden" href="/<!--[$name|replace:' ':'_']-->/sigs" title="Signatures for <!--[$name]-->">SIGNATURES</a> ]
    <!--[elseif $page eq 'certs']-->
      [ <a class="golden" href="/<!--[$name|replace:' ':'_']-->/" title="Skillsheet for <!--[$name]-->">SKILLS</a> ]   
      [ <a class="golden" href="/<!--[$name|replace:' ':'_']-->/ships" title="Ships <!--[$name]--> can fly">SHIPS</a> ] 
      [ CERTS ]
<!--      [ <a class="golden" href="/<!--[$name|replace:' ':'_']-->/standings" title="Standings for <!--[$name]-->">STANDINGS</a> ] -->
      [ <a class="golden" href="/<!--[$name|replace:' ':'_']-->/sigs" title="Signatures for <!--[$name]-->">SIGNATURES</a> ]
    <!--[elseif $page eq 'siglist']-->
      [ <a class="golden" href="/<!--[$name|replace:' ':'_']-->/" title="Skillsheet for <!--[$name]-->">SKILLS</a> ]
      [ <a class="golden" href="/<!--[$name|replace:' ':'_']-->/ships" title="Ships <!--[$name]--> can fly">SHIPS</a> ]
      [ <a class="golden" href="/<!--[$name|replace:' ':'_']-->/certs" title="Certificates for <!--[$name]-->">CERTS</a> ]
<!--      [ <a class="golden" href="/<!--[$name|replace:' ':'_']-->/standings" title="Standings for <!--[$name]-->">STANDINGS</a> ] -->
      [ SIGNATURES ]
    <!--[else]-->
      [ <a class="golden" href="/<!--[$name|replace:' ':'_']-->/" title="Skillsheet for <!--[$name]-->">SKILLS</a> ]   
      [ <a class="golden" href="/<!--[$name|replace:' ':'_']-->/ships" title="Ships <!--[$name]--> can fly">SHIPS</a> ]         
      [ <a class="golden" href="/<!--[$name|replace:' ':'_']-->/certs" title="Certificates for <!--[$name]-->">CERTS</a> ]    
      [ STANDINGS ]
      [ <a class="golden" href="/<!--[$name|replace:' ':'_']-->/sigs" title="Signatures for <!--[$name]-->">SIGNATURES</a> ]
    <!--[/if]-->
	<span style="color:gold;"><a href="#" onClick="showBox();return false"><img src="/imgs/chart_bar.png" align="absmiddle" width="16 height="16" border="0" title="Toggle Skills Barchart" alt="Toggle Skills Barchart" hspace="4" /></a></span>    
   <br /> <span class="gold"><!--[$totalsks]--></span> skills for a total of <span class="gold"><!--[$skillpointstotal]--></span> SP's. </span>
  <!--[else]-->
  <span class="headerleft"><a href="/" title="Skills Shrowroom">Showroom: Characters List</a></span>
  <span class="headerright"  style="color:gold;"><a href="/add" title="Add your characters now">Add your character!</a></span>
  <!--[/if]-->
  </div>
  <!--[literal]-->
    <!--[if IE]>--><br /><!--<![endif]-->
  <!--[/literal]-->