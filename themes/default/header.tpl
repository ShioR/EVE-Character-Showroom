<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
  <meta content="text/html; charset=UTF-8" http-equiv="Content-Type" />
  <meta name="description" content="Eve Online Skill sheet" />
  <meta name="robots" content="noindex,nofollow" />
  <meta name="resource-type" content="document" />
  <meta http-equiv="expires" content="0" />
  <meta name="author" content="Eve Online" />
  <meta name="copyright" content="Copyright (c) 2016 The Xenodus Initiative." />
  <meta name="revisit-after" content="1 days" />
  <meta name="distribution" content="Global" />
  <meta name="generator" content="Eve Online" />
  <meta name="rating" content="General" />
  <meta name="KEYWORDS" content="eveonline, skills" />
  <!--[if $page eq 'skills']-->
  <title><!--[$name]--> / Skills</title>
  <!--[elseif $page eq 'ships']-->
  <title><!--[$name]--> / Ships</title>
  <!--[elseif $page eq 'siglist']-->
  <title><!--[$name]--> / Signatures</title>    
  <!--[else]-->
  <title>Skills Showroom</title>
  <!--[/if]-->  
  <link rel="shortcut icon" href="/imgs/favicon.png">
  <link rel="apple-touch-icon" href="/imgs/favicon.png" sizes="114x114">
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:300,400,400italic,600,600italic' rel='stylesheet' type='text/css'>  
  <link rel="stylesheet" type="text/css" href="/themes/<!--[$theme]-->/style/<!--[$theme]-->.css" />
  <link rel="stylesheet" type="text/css" href="/themes/<!--[$theme]-->/style/piro.css" />
<script type="text/javascript" src="/themes/<!--[$theme]-->/js/jquery.min.js"></script>
<script type="text/javascript" src="/themes/<!--[$theme]-->/js/jquery-ui-1.8.2.custom.min.js"></script>
<script type="text/javascript" src="/themes/<!--[$theme]-->/js/pirobox_extended.js"></script>
<script type="text/javascript" src="/themes/<!--[$theme]-->/js/countdown.js"></script>
<script type="text/javascript" src="/themes/<!--[$theme]-->/js/js.js"></script>    
<script type="text/javascript">
$(function(){$('a[href*="#"]:not([href="#"])').click(function(){if(location.pathname.replace(/^\//,"")==this.pathname.replace(/^\//,"")&&location.hostname==this.hostname){var t=$(this.hash);if(t=t.length?t:$("[name="+this.hash.slice(1)+"]"),t.length)return $("html, body").animate({scrollTop:t.offset().top-400},1e3),!1}})});</script>
<script type="text/javascript">$(document).ready(function(){$().piroBox_ext({piro_speed:900,bg_alpha:.5,piro_scroll:!0})});</script>
<script type="text/javascript">function i(l){document.getElementById&&("block"==l.style.display?l.style.display="none":l.style.display="block")}</script>
</head>
<body>
<!-- HEADER -->
  <div id="header" class="headerribbon"<!--[if not $page]--> style="height: 26px;"<!--[/if]-->>
  <!--[if $page]-->
<span class="headerleft"><img align="left" style="border:#666 1px solid; margin:3px;" src="<!--[getportrait characterID=$characterID size=64]-->" width="32" height="32" title="" alt="<!--[$name]-->" /></a>Skillsheet for <span style="color:gold;"><!--[$name]--></span><span style="color:gold;"> <a style="text-decoration:none;" href="https://gate.eveonline.com/Mail/Compose/<!--[$name]-->" rel="iframe-875-610" class="pirobox"> [Send EVEMail]</a></span><br />Member of <span style="color:gold;"><a style="text-decoration:none;" href="https://gate.eveonline.com/Corporation/<!--[$corporationName|replace:" ":"%20"]-->" rel="iframe-875-610" class="pirobox"><!--[$corporationName]--></a></span><!--[if $allianceName neq '']--> <span style="color:gold;"><a style="text-decoration:none;" href="https://gate.eveonline.com/Alliance/<!--[$allianceName|replace:" ":"%20"]-->" rel="iframe-875-610" class="pirobox"> [<!--[$allianceName]-->]</a></span><!--[else]--><!--[/if]--></span>
    <span class="headerright2">
    <!--[if $page eq 'skills']-->
      [ SKILLS ]
      [ <a class="golden" href="/<!--[$name|replace:' ':'_']-->/ships" title="Ships <!--[$name]--> can fly">SHIPS</a> ]
      [ <a class="golden" href="/<!--[$name|replace:' ':'_']-->/sigs" title="Signatures for <!--[$name]-->">SIGNATURES</a> ]
      [ <a href="/<!--[$name|replace:' ':'_']-->/chart" rel="iframe-718-448" class="pirobox" style="text-decoration:none;">GRAPH</a> ]
    <!--[elseif $page eq 'ships']-->
      [ <a class="golden" href="/<!--[$name|replace:' ':'_']-->" title="Skillsheet for <!--[$name]-->">SKILLS</a> ]
      [ SHIPS ]
      [ <a class="golden" href="/<!--[$name|replace:' ':'_']-->/sigs" title="Signatures for <!--[$name]-->">SIGNATURES</a> ]
      [ <a href="/<!--[$name|replace:' ':'_']-->/chart" rel="iframe-718-448" class="pirobox" style="text-decoration:none;">GRAPH</a> ]
    <!--[else]-->
      [ <a class="golden" href="/<!--[$name|replace:' ':'_']-->" title="Skillsheet for <!--[$name]-->">SKILLS</a> ]
      [ <a class="golden" href="/<!--[$name|replace:' ':'_']-->/ships" title="Ships <!--[$name]--> can fly">SHIPS</a> ]
      [ SIGNATURES ]
      [ <a href="/<!--[$name|replace:' ':'_']-->/chart" rel="iframe-718-448" class="pirobox" style="text-decoration:none;">GRAPH</a> ]
    <!--[/if]-->
   <br />
    <!--[if $Training]-->
                        <script type="text/javascript">
                          var totalSP = <!--[$inProgressTotalSP]-->;
                            window.setInterval(
                            function () {
                            totalSP = totalSP + <!--[$spRate]-->;
                            document.getElementById("inProgressTotalSP").innerHTML = totalSP.toLocaleString(undefined, {minimumFractionDigits:0, maximumFractionDigits:0});
                            }, 1000);</script>
        <span class="gold"><!--[$totalsks]--></span> skills for a total of <span id="inProgressTotalSP" class="gold"><!--[$inProgressTotalSP|round:0|number_format]--></span> skillpoints </span>
    <!--[else]-->
        <span class="gold"><!--[$totalsks]--></span> skills for a total of <span class="gold"><!--[$skillpointstotal]--></span> skillpoints </span>
    <!--[/if]-->
  <!--[else]-->
  <span class="headerleft"><a href="/" title="Skills Shrowroom">Showroom: Characters List</a></span>
  <span class="headerright"  style="color:gold;"><a href="/add" title="Add your characters now">Add your character!</a></span>
  <!--[/if]-->
  </div>
  <!--[literal]-->
    <!--[if IE]>--><br /><!--<![endif]-->
  <!--[/literal]-->