<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
  <head>
  <meta content="text/html; charset=UTF-8" http-equiv="Content-Type" />
  <meta name="description" content="Eve Online Skill sheet" />
  <meta name="robots" content="index,follow" />
  <meta name="resource-type" content="document" />
  <meta http-equiv="expires" content="1" />
  <meta name="author" content="Eve Online" />
  <meta name="copyright" content="Copyright (c) 2016 The Xenodus Initiative." />
  <meta name="revisit-after" content="1 days" />
  <meta name="distribution" content="Global" />
  <meta name="generator" content="Eve Online" />
  <meta name="rating" content="General" />
  <meta name="KEYWORDS" content="eveonline, skills" />
  <title>Skills Showroom / Add Character</title>
  <link rel="shortcut icon" href="/imgs/favicon.png">
  <link rel="apple-touch-icon" href="/imgs/favicon.png" sizes="114x114">
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
  <style type="text/css">
  /*<![CDATA[*/
    body{font-family:'Open Sans',sans-serif;font-size:9pt;padding:0;margin:0;color:white;background:#1B1B1B;}
*]-->.newsTitleImage{left:5px;float:left;margin-right:-40px;position:relative;}
.navdot{padding-right:5px;font-size:6pt;vertical-align:0;}
table.dataTable{border-right:#666 1px solid;border-top:#666 1px solid;}
.dataTableHeader{padding:5px;font-weight:bolder;font-size:10px;border-left:#666 1px solid;color:white;border-bottom:#666 1px solid;background:#434343;}
td.dataTableCell{padding:4px;font-size:10px;border-left:#666 1px solid;border-bottom:#666 1px solid;}
.headerribbon{margin:0;height:26px;line-height:30px;position:fixed;top:0;left:0;width:100%;z-index:100;font-weight:bold;border-bottom:1px solid gray;background:#2C2C38;vertical-align:middle;}
.headerleft{float:left;margin-left:10px;width:30%;z-index:160;}
.headerright{float:right;width:44%;margin-right:10px;text-align:right;}
.headerright2{float:right;width:20%;text-align:right;margin-right:10px;line-height:36px;}
.headerright3{float:right;width:20%;text-align:right;margin-right:10px;line-height:30px;}
.statusmsg{margin-top:25px;color:yellow;}
#skillsidebox{margin:0;height:250px;position:fixed;top:26px;left:0;width:260px;z-index:99;border-bottom:1px solid gray;border-right:1px solid gray;background:#2C2C38;vertical-align:middle;padding:15px 0 0 5px;opacity:0.80;}
.mcenter{margin-left:auto;margin-right:auto;}
.txtcenter{text-align:center;}
a,a:visited{color:gold;text-decoration:none;}
a:hover{color:gold;}
a img{border:none;}
  /*]]>*/
  </style>  
</head>
<body bgcolor="#1B1B1B" style="height: 100%">
<div class="headerribbon">
  <span class="headerleft">Skillsheet: Add Characters</span>
  <span class="headerright" style="color:gold;"><a href="/" title="Skills Shrowroom">CHARACTER LIST</a></span>
</div>

        <div id="content" style="margin-left:auto;margin-right:auto;width:970px;margin-top:100px;" >
          <br />
<!--[if $submit]-->
					<form id="addcharacters" method="post" action="skillsheet.php?show=addnew">
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
												<img src="https://image.eveonline.com/Character/<!--[$char.characterID]-->_128.jpg" class="mbAvatar" style="border:1px solid gray" alt="<!--[$char.name]-->" />
												<br /><!--[$char.name]-->
												<br /><!--[$char.corporationName]-->
												<hr />
												Save <input type="checkbox" name="save[<!--[$char.characterID]-->]" />
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
										<!--[*<p><!--[if $stoppage]--><a href="skillsheet.php?show=addnew" title="Retry">Retry<!--[else]--><a href="install.php?step=<!--[$nextstep]-->">Next Step<!--[/if]--></a></p>*]-->
										<!--[else]-->
						<div class="counter"></div>
              <p style="text-align:center;"><span style="color:orange;"><i><strong>Please be aware that in order to use this site you need to give your new API Key the correct permissions!</strong></i></span><br />
				  An easy way to make sure you have the correct permissions is to <a target="_blank" href="https://community.eveonline.com/support/api-key/CreatePredefined?accessMask=8781832">create a pre-defined key!</a></p>
                <br />
            <div style="margin-left:38%;">
                We need access to;
				  <ul>
					<li><i>'/char/CharacterSheet.xml.aspx'</i></li>
					<li><i>'/char/SkillInTraining.xml.aspx'</i></li>
					<li><i>'/char/SkillQueue.xml.aspx'</i></li>
					<li><i>'/eve/CharacterInfo.xml.aspx'</i></li>
				  </ul>
                </div>
                    <p style="text-align:center;">Note: If the 'No Expiry' box is not ticked, your key will expire and access to the API key you provided us will be revoked.
                    Confirm it is ticked or <a href="/settings/api" rel="iframe-500-300" class="pirobox">update your key</a> when it expires to allow us to maintain access to your character.</p>
						<br /><br /> 
						<br /><br /> 
					<form id="options" name="options" method='post' action='skillsheet.php?show=addnew'>
						<table style="margin-left:auto;margin-right:auto;" border='0' cellspacing='2' cellpadding='0' align='center'>
								<tr>
								    <td bgcolor='#1B1B1B'><strong>Key ID:</strong></td>
								    <td bgcolor='#1B1B1B' align='center'><input id="keyID" name="keyID" type="text" tabindex="1"></td>
								</tr>
								<tr>
								    <td bgcolor='#1B1B1B'><strong>Verification Code:</strong></td>
								    <td bgcolor='#1B1B1B' align='center'><input id="key" name="vCode" type="text" tabindex="2"></td>
								</tr>
								<tr>
								    <td></td>
								    <td bgcolor='#1B1B1B' align='center'><input type='submit' name="submit" value='Get Characters'></td>
								</tr>
                        </table>
								</br></br>
                  <p class="newsmalltext" style="text-align:center;">Create a pre-defined key with the correct permissions we require by clicking<a target="_blank" href="https://community.eveonline.com/support/api-key/CreatePredefined?accessMask=8781832"> here.</a><br />Want to use an existing API Key? They can be found <a target="_blank" href="https://community.eveonline.com/support/api-key/">here</a>.</p>
						<!--[/if]-->
					</form>
          </div>
<div id"footerPad" style="position:absolute;bottom:0;width:100%;">
    <!--[include file='footer.tpl']-->
</div>