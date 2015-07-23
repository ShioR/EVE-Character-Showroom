<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
  <meta content="text/html; charset=UTF-8" http-equiv="Content-Type" />
  <meta name="description" content="Eve Online Skill sheet" />
  <meta name="robots" content="index,follow" />
  <meta name="resource-type" content="document" />
  <meta http-equiv="expires" content="0" />
  <meta name="author" content="Eve Online" />
  <meta name="copyright" content="Copyright (c) 2015 The Xenodus Initiative." />
  <meta name="revisit-after" content="1 days" />
  <meta name="distribution" content="Global" />
  <meta name="generator" content="Eve Online" />
  <meta name="rating" content="General" />
  <meta name="KEYWORDS" content="eveonline, skills" />
  <title>Install / EVE Character Showroom</title>
  <style type="text/css">
  /*<![CDATA[*/
   body{font-size:8pt;margin:0;color:#fff;font-family:Verdana,Arial;padding:0}
<!--[* /.png{behavior:url(pngbehavior.htc)}
*/ *]-->
.newsTitleImage{<--behavior:url(pngbehavior.htc);*--left:5px;float:left;margin-right:-40px;position:relative}
.navdot{padding-right:5px;font-size:6pt;vertical-align:0}
table.dataTable{border-right:#666 1px solid;border-top:#666 1px solid}
.dataTableHeader{font-weight:bolder;font-size:10px;border-left:#666 1px solid;color:#fff;border-bottom:#666 1px solid;background-color:#434343;padding:5px}
td.dataTableCell{font-size:10px;border-left:#666 1px solid;border-bottom:#666 1px solid;padding:4px}
.headerribbon{margin:0;height:26px;line-height:30px;position:fixed;top:0;left:0;width:100%;z-index:100;font-weight:700;border-bottom:1px solid gray;background:#2c2c38;vertical-align:middle}
.headerleft{float:left;margin-left:10px;width:30%;z-index:160}
.headerright{float:right;width:44%;margin-right:10px;text-align:right}
.headerright2{float:right;width:20%;text-align:right;margin-right:10px;line-height:36px}
.headerright3{float:right;width:20%;text-align:right;margin-right:10px;line-height:30px}
.statusmsg{margin-top:50px;color:#ff0}
#skillsidebox{margin:0;height:250px;position:fixed;top:26px;left:0;width:260px;z-index:99;border-bottom:1px solid gray;border-right:1px solid gray;background:#2c2c38;vertical-align:middle;padding:15px 0 0 5px;opacity:.8}
.mcenter{margin-left:auto;margin-right:auto}
.txtcenter{text-align:center}
a,a:visited{color:#ffd700}
  /*]]>*/
  </style>
</head>
<body bgcolor="#222222" style="height: 100%">
<div class="headerribbon">
  <span class="headerleft">EVE Character Showroom v5 - Installation | Step: <!--[$step]-->/6</span>
</div>
<br />
<br />
<br />

        <div id="content" style="margin-left:10px;width:70%;margin-top:50px;" >
          <div class="block-header2">Add Characters</div>
          <br />
<!--[if $submit]-->
					<form id="addcharacters" method="post" action="../skillsheet.php?show=addnew">
						<div>
							<input type="hidden" name="keyID" value="<!--[$keyID]-->" />
							<input type="hidden" name="vCode" value="<!--[$vCode]-->" />
							<input type="hidden" name="do" value="get" />
						<table summary="Characters List" style="border: #666666 1px solid; margin-left: 10px;">
								
									<tbody>
										<tr>
										<!--[if $error]-->
											<td class="txtcenter" style="color:red;"><!--[$error]--></td>
										<!--[else]-->
										<!--[foreach item='char' from=$charlist]-->
											<td class="txtcenter">
												<input type="hidden" name="names[<!--[$char.characterID]-->]" value="<!--[$char.name]-->" />
												<input type="hidden" name="corps[<!--[$char.characterID]-->]" value="<!--[$char.corporationName]-->" />
												<img src="https://imageserver.eveonline.com/Character/<!--[$char.characterID]-->_128.jpg" class="mbAvatar" style="border:1px solid gray" alt="<!--[$char.name]-->" />
												<br /><!--[$char.name]-->
												<br /><!--[$char.corporationName]-->
												<hr />
												Save <input type="checkbox" name="save[<!--[$char.characterID]-->]" />
												<br />
												Show Implants? <input type="checkbox" name="implants[<!--[$char.characterID]-->]" />
												<br />
												<hr />
												<strong>Remember this link</strong>:<br /><a href="/<!--[$char.name|replace:' ':'_']-->/" title="<!--[$char.name]-->"><!--[$char.name]--></a>
											</td>
										<!--[/foreach]-->
										<!--[/if]-->
										</tr>
										<tr>
											<td colspan="<!--[$charcount]-->"><hr /></td>
										</tr>
										<tr>
										<!--[if $error]-->
											<td class="txtcenter"><a href="/add" title="Go Back">Back to API Form</a></td>
										<!--[else]-->
											<td colspan="<!--[$charcount]-->" style="text-align:center;"><input type="submit" name="submit" value="Save Character(s)" /></td>
										<!--[/if]-->
										</tr>
									</tbody>
						</table>
						</div>
					</form>
										<!--[*<p><!--[if $stoppage]--><a href="../skillsheet.php?show=addnew" title="Retry">Retry<!--[else]--><a href="install.php?step=<!--[$nextstep]-->">Next Step<!--[/if]--></a></p>*]-->
										<!--[else]-->
					<form id="options" name="options" method='post' action='../skillsheet.php?show=addnew'>
						<table border='0' cellspacing='0' cellpadding='0' align='left'>
										<tr id='cat'>
										<tr>
											<td bgcolor='#222'><strong>Key ID:</strong></td>
											<td bgcolor='#222' align='center'><input id="keyID" name="keyID" type="text" tabindex="1"></td>
										</tr>
										<tr>
											<td bgcolor='#222'><strong>Verification Code:</strong></td>
											<td bgcolor='#222' align='center'><input id="key" name="vCode" type="text" tabindex="2"></td>
										</tr>
										<tr>
											<td></td>
											<td bgcolor='#222' align='center'><input type='submit' name="submit" value='Get Characters'></td>
										</tr>
										<tr>
											<td colspan='2'></br></br><span class="newsmalltext"><strong><a target="_blank" href="https://support.eveonline.com/api/Key/CreatePredefined/8781832">Create a new API Key for use on this site</a></strong><br />Your API keys can be found <a target="_blank" href="https://support.eveonline.com/api">here</a></span>.<br /></td>
										</tr>
						</table>
					</form>
										<!--[/if]-->
						<div class="counter"></div>
						<br />
						<br />
						<br />
						<br />
						<br />
						<br />
						<br />
						<br />
						<br />
              <p><span style="color:orange;"><i><strong>Please be aware that in order to use this site you need to give your new API Key the correct permissions!</strong></i></span><br />We need access to;</p>
				  <ul>
					<li><i>'/char/CharacterSheet.xml.aspx'<span style="font-size:x-small;"><sup>2</sup></span></i></li>
					<li><i>'/char/SkillInTraining.xml.aspx'<span style="font-size:x-small;"><sup>1</sup></span></i></li>
					<li><i>'/char/SkillQueue.xml.aspx'<span style="font-size:x-small;"><sup>1</sup></span></i></li>
					<li><i>'/eve/CharacterInfo.xml.aspx'<span style="font-size:x-small;"><sup>2</sup></span></i></li>
				  </ul>
				  <p>An easy way to make sure you have the correct permissions is to <a target="_blank" href="https://support.eveonline.com/api/Key/CreatePredefined/8781832">create a pre-defined key!</a></p>  
				  <p style="color:red;">Please note that if you don't tick 'No Expiry' you key will expire and access to the API key you provided us will be revoked. Either tick 'No Expiry' or <a href="/settings/api" rel="iframe-500-300" class="pirobox">update your key.</a></p>
                  <p style="font-size:xx-small;"><i><sup>1</sup> = Every 30 minutes, <sup>2</sup> = Once per hour</i> </p></strong></i></p>
                  <p style="clear:both" /> 
                </div> 
              </div>  
        <div id="footerWrapper"> 
          <div id="footer"> 
            <p style="padding-top:15px"> 
  <!--[include file='footer.tpl']-->
            </p> 
          </div> 
        </div> 
      </div> 
    </div> 
  </body>
</html>