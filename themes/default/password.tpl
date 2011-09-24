<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
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
  <title>Skill Sheet</title>
  <style type="text/css">
  /*<![CDATA[*/
    body
    {
      font-size: 8pt;
      padding-right: 0px;
      padding-left: 0px;
      padding-bottom: 0px;
      margin: 0px;
      color: white;
      padding-top: 0px;
      font-family: Verdana,Arial;
    }
    <!--[* /*.png
    {
      behavior: url('pngbehavior.htc');
    }*/ *]-->
    .newsTitleImage
    {
      <!--[* behavior: url('pngbehavior.htc'); *]-->
      left: 5px;
      float: left;
      margin-right: -40px;
      position: relative;
    }
    .navdot
    {
      padding-right: 5px;
      font-size: 6pt;
      vertical-align: 0px;
    }
    table.dataTable
    {
      border-right: #666666 1px solid;
      border-top: #666666 1px solid;
    }
    .dataTableHeader
    {
      padding-right: 5px;
      padding-left: 5px;
      font-weight: bolder;
      font-size: 10px;
      padding-bottom: 5px;
      border-left: #666666 1px solid;
      color: white;
      padding-top: 5px;
      border-bottom: #666666 1px solid;
      background-color: #434343;
    }
    td.dataTableCell
    {
      padding-right: 4px;
      padding-left: 4px;
      font-size: 10px;
      padding-bottom: 4px;
      border-left: #666666 1px solid;
      padding-top: 4px;
      border-bottom: #666666 1px solid;
    }
    .headerribbon {
      margin: 0px;
      height: 26px;
      line-height: 30px;
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      z-index: 100;
      font-weight: bold;
      border-bottom: 1px solid gray;
      background: rgb(44, 44, 56);
      vertical-align:middle;
    }

    .headerleft {
      float: left;
      margin-left: 10px;
      width:30%;
      z-index: 160;
    }

    .headerright {
      float: right;
      width: 44%;
      margin-right: 10px;
      /*align: right;*/
      text-align: right;
    }

    .headerright2 {
      float: right;
      width: 20%;
      /*align: right;*/
      text-align: right;
      margin-right: 10px;
      line-height: 36px;
    }

    .headerright3 {
      float: right;
      width: 20%;
      /*align: right;*/
      text-align: right;
      margin-right: 10px;
      line-height: 30px;
    }

    .statusmsg {
      margin-top:50px;
      color:yellow;
    }

    #skillsidebox {
      margin: 0px;
      height: 250px;
      position: fixed;
      top: 26px;
      left: 0;
      width: 260px;
      z-index: 99;
      border-bottom: 1px solid gray;
      border-right: 1px solid gray;
      background: rgb(44, 44, 56);
      vertical-align:middle;
      padding: 15px 0 0 5px;
/*      filter: alpha(opacity=80);*/
      opacity: 0.80;
    }

    .mcenter {
      margin-left:auto;
      margin-right:auto;
    }
    .txtcenter {
      text-align:center;
    }
    a, a:visited { color:gold; }
  /*]]>*/
  </style>
</head>
<body bgcolor="#1B1B1B" style="height: 100%">
  <div class="headerribbon">
    <span class="headerleft">Skillsheet: Characters List</span>
    <span class="headerright" style="color:gold;"><a href="http://txsi.co.uk" title="The Xenodus Initiative.">The Xenodus Initiative.</a></span>
  </div>
  <!--[getstatusmsg]-->

  <div id="content" style="margin-left: 10px;width:70%;margin-top:50px;" >
    <form id="options" name="options" method="post" action="skillsheet.php">
    <div>
      <input type="hidden" name="cid"  value="<!--[$characterID]-->" />
      <input type="hidden" name="show" value="<!--[$show]-->" />
      <label for="userID"><strong>Password <!--[$name]-->:</strong><br />
      <input id="password" name="password" type="text" tabindex="1" size="25" /><br /><br />
      </label>
      <br /><br />
      <input type="submit" name="submit" value="View Character" />
      </div>
    </form>
  </div>


  <div class="counter"></div>
</body>
</html>