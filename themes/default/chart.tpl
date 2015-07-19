<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
  <meta content="text/html; charset=UTF-8" http-equiv="Content-Type" />
  <meta name="description" content="Eve Online Skill sheet" />
  <meta name="robots" content="noindex,nofollow" />
  <meta name="resource-type" content="document" />
  <meta http-equiv="expires" content="0" />
  <meta name="author" content="Eve Online" />
  <meta name="copyright" content="Copyright (c) 2015 The Xenodus Initiative." />
  <meta name="revisit-after" content="1 days" />
  <meta name="distribution" content="Global" />
  <meta name="generator" content="Eve Online" />
  <meta name="rating" content="General" />
  <meta name="KEYWORDS" content="eveonline, skills" />
<script type="text/javascript" src="/includes/charts/fusioncharts.js"></script>
<script type="text/javascript" src="/includes/charts/fusioncharts.charts.js"></script>
<script type="text/javascript">
           FusionCharts.ready(function () {
               var spChart = new FusionCharts({
                   "type": "column3d",
                   "renderAt": "chart",
                   "width": "700",
                   "height": "430",
                   "dataFormat": "xml",
                   "dataSource": "<chart caption='<!--[$name]-->' subcaption='Skillpoint Distribution' yaxisname='Skillpoints' bgalpha='100' borderalpha='20' canvasborderalpha='0' useplotgradientcolor='1' plotborderalpha='10' placevaluesinside='0' rotateValues='1' slantLabels='1' valuefontcolor='#333333' captionpadding='10' showaxislines='1' axislinealpha='25' divlinealpha='75' canvasBaseDepth='1' bgColor='#333333' canvasBaseColor='#666666' baseFontColor='#ffd700' tooltipBgColor='#333' tooltipSepChar=': ' formatNumberScale='0' numberSuffix=''><!--[foreach item='grp' from=$grptable]--><set label='<!--[$grp.grpname]-->' value='<!--[$grp.spcount2]-->' /><!--[/foreach]--></chart>"
    });
               spChart.render();
           });
        </script> 
</head>
<body>
<div id="chart"></div>
</body>
</html>