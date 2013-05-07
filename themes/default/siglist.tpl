  <!--[include file='header.tpl' page='siglist']-->

  <table class="mcenter" style="width:768px;margin-top:25px;" summary="Main">
  <tbody>
    <tr>
      <td><br /><br /><br />


          <!--[include file='mainheader.tpl']-->
          <!--[if $implants == 1]--><!--[include file='maininfo.tpl']--><!--[else]--><!--[include file='maininfo2.tpl']--><!--[/if]-->
          
  <div style="margin-top: 40px; margin-bottom: -24px;">
        <div style="margin-top: 10px;">
          <div style="border-top: 1px solid rgb(67, 67, 67); border-bottom: 1px solid rgb(67, 67, 67); background: rgb(44, 44, 56)  no-repeat scroll 24px 5px; margin-bottom: 10px; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial; height: 21px;">
            <font style="border: 0px none; position:relative; left: 15px; top: 4px; font-weight: bold;">Signatures for <!--[$name]--></font>
          </div>
        </div>
      </div>
      <br />
      <br />
      <div style="color:gold; cursor:pointer;" onclick="javascript:i(document.getElementById('bar'));" href="#toggle">Show 'bar' style signatures</div>       
      <div style="color:gold; cursor:pointer;" onclick="javascript:i(document.getElementById('race'));" href="#toggle">Show 'racial' style signatures</div>
      <br />
          <div style="margin-top: 5px; display:none;" id="bar">
            <div style="margin-top: 5px;">
              <div style="margin-left: 30px;">
                <table style="border-collapse:collapse;border: #666666 1px solid;">        
                    <td class="dataTableHeader" style="width:138px;">Pink</td>
                    <td class="dataTableHeader" style="width:630px;"><img alt="Sig, yo!" src="/sigs/pink?n=<!--[$name|replace:' ':'_']-->&s=y" /></td>
                  </tr>
                  <tr>
                    <td class="dataTableHeader">BBCode :</td>
                    <td><div>
                      <input id="BBCode" name="BBCode" type="text" size="102" value="[url=http://<!--[php]-->echo $_SERVER['SERVER_NAME'];<!--[/php]-->/<!--[$name|replace:' ':'_']-->][img]http://<!--[php]-->echo $_SERVER['SERVER_NAME'];<!--[/php]-->/sigs/pink?n=<!--[$name|replace:' ':'_']-->&s=y[/img][/url]" onclick="this.focus();this.select();" />
                    </div></td>  
                </div>
                </table><br /><br />  
                <table style="border-collapse:collapse;border: #666666 1px solid;">        
                    <td class="dataTableHeader" style="width:138px;">Gray</td>
                    <td class="dataTableHeader" style="width:630px;"><img alt="Sig, yo!" src="/sigs/gray?n=<!--[$name|replace:' ':'_']-->" /></td>
                  </tr>
                  <tr>
                    <td class="dataTableHeader">BBCode :</td>
                    <td><div>
                      <input id="BBCode" name="BBCode" type="text" size="102" value="[url=http://<!--[php]-->echo $_SERVER['SERVER_NAME'];<!--[/php]-->/<!--[$name|replace:' ':'_']-->][img]http://<!--[php]-->echo $_SERVER['SERVER_NAME'];<!--[/php]-->/sigs/gray?n=<!--[$name|replace:' ':'_']-->[/img][/url]" onclick="this.focus();this.select();" />
                    </div></td>  
                </div><div>
                    </div></td>  
                </div>
                </table><br /><br />  
                <table style="border-collapse:collapse;border: #666666 1px solid;">        
                    <td class="dataTableHeader" style="width:138px;">Blue</td>
                    <td class="dataTableHeader" style="width:630px;"><img alt="Sig, yo!" src="/sigs/white?n=<!--[$name|replace:' ':'_']-->&s=y" /></td>
                  </tr>
                  <tr>
                    <td class="dataTableHeader">BBCode :</td>
                    <td><div>
                      <input id="BBCode" name="BBCode" type="text" size="102" value="[url=http://<!--[php]-->echo $_SERVER['SERVER_NAME'];<!--[/php]-->/<!--[$name|replace:' ':'_']-->][img]http://<!--[php]-->echo $_SERVER['SERVER_NAME'];<!--[/php]-->/sigs/white?n=<!--[$name|replace:' ':'_']-->&s=y[/img][/url]" onclick="this.focus();this.select();" />
                    </div></td>  
                </div>
                </table><br /><br />
                <table style="border-collapse:collapse;border: #666666 1px solid;">        
                    <td class="dataTableHeader" style="width:138px;">Gold</td>
                    <td class="dataTableHeader" style="width:630px;"><img alt="Sig, yo!" src="/sigs/gold?n=<!--[$name|replace:' ':'_']-->&s=y" /></td>
                  </tr>
                  <tr>
                    <td class="dataTableHeader">BBCode :</td>
                    <td><div>
                      <input id="BBCode" name="BBCode" type="text" size="102" value="[url=http://<!--[php]-->echo $_SERVER['SERVER_NAME'];<!--[/php]-->/<!--[$name|replace:' ':'_']-->][img]http://<!--[php]-->echo $_SERVER['SERVER_NAME'];<!--[/php]-->/sigs/gold?n=<!--[$name|replace:' ':'_']-->&s=y[/img][/url]" onclick="this.focus();this.select();" />
                    </div></td>  
                </div>
                </table><br /><br />
                <table style="border-collapse:collapse;border: #666666 1px solid;">        
                    <td class="dataTableHeader" style="width:138px;">Transparent</td>
                    <td class="dataTableHeader" style="width:630px;background-color:azure;"><img alt="Sig, yo!" src="/sigs/trans.php?n=<!--[$name|replace:' ':'_']-->" /></td>
                  </tr>
                  <tr>
                    <td class="dataTableHeader">BBCode :</td>
                    <td><div>
                      <input id="BBCode" name="BBCode" type="text" size="102" value="[url=http://<!--[php]-->echo $_SERVER['SERVER_NAME'];<!--[/php]-->/<!--[$name|replace:' ':'_']-->][img]http://<!--[php]-->echo $_SERVER['SERVER_NAME'];<!--[/php]-->/sigs/trans.php?n=<!--[$name|replace:' ':'_']-->[/img][/url]" onclick="this.focus();this.select();" />
                    </div></td>  
                </div>
                </table><br /><br />                                                                                                                                 
              </div>
            </div>
          </div>
      </div>
   <div style="margin-top: 5px; display:none;" id="race">
            <div style="margin-top: 5px;" align="center">
              <div style="margin-left: 30px;">
                <table style="border-collapse:collapse;border: #666666 1px solid;">
                  <tr>
                    <td class="dataTableHeader" style="width:138px;">Amarr</td>
                    <td class="dataTableHeader" style="width:420px;" align="center"><img alt="Sig, yo!" src="/sigs/amarr?n=<!--[$name|replace:' ':'_']-->&id=<!--[$characterID]-->&s=y" /></td>
                  </tr>
                  <tr>
                    <td class="dataTableHeader">BBCode :</td>
                    <td><div>
                      <input id="BBCode" name="BBCode" type="text" size="67" value="[url=http://<!--[php]-->echo $_SERVER['SERVER_NAME'];<!--[/php]-->/<!--[$name|replace:' ':'_']-->][img]http://<!--[php]-->echo $_SERVER['SERVER_NAME'];<!--[/php]-->/sigs/amarr?n=<!--[$name|replace:' ':'_']-->&id=<!--[$characterID]-->&s=y[/img][/url]" onclick="this.focus();this.select();" />
                    </div></td>                  
                </div>
                </table><br /><br />
                <table style="border-collapse:collapse;border: #666666 1px solid;">        
                    <td class="dataTableHeader" style="width:138px;">Caldari</td>
                    <td class="dataTableHeader" style="width:420px;" align="center"><img alt="Sig, yo!" src="/sigs/caldari?n=<!--[$name|replace:' ':'_']-->&id=<!--[$characterID]-->&s=y" /></td>
                  </tr>
                  <tr>
                    <td class="dataTableHeader">BBCode :</td>
                    <td><div>
                      <input id="BBCode" name="BBCode" type="text" size="67" value="[url=http://<!--[php]-->echo $_SERVER['SERVER_NAME'];<!--[/php]-->/<!--[$name|replace:' ':'_']-->][img]http://<!--[php]-->echo $_SERVER['SERVER_NAME'];<!--[/php]-->/sigs/caldari?n=<!--[$name|replace:' ':'_']-->&id=<!--[$characterID]-->&s=y[/img][/url]" onclick="this.focus();this.select();" />
                    </div></td>  
                </div>
                </table><br /><br />
                <table style="border-collapse:collapse;border: #666666 1px solid;">        
                    <td class="dataTableHeader" style="width:138px;">Gallente</td>
                    <td class="dataTableHeader" style="width:420px;" align="center"><img alt="Sig, yo!" src="/sigs/gallente?n=<!--[$name|replace:' ':'_']-->&id=<!--[$characterID]-->&s=y" /></td>
                  </tr>
                  <tr>
                    <td class="dataTableHeader">BBCode :</td>
                    <td><div>
                      <input id="BBCode" name="BBCode" type="text" size="67" value="[url=http://<!--[php]-->echo $_SERVER['SERVER_NAME'];<!--[/php]-->/<!--[$name|replace:' ':'_']-->][img]http://<!--[php]-->echo $_SERVER['SERVER_NAME'];<!--[/php]-->/sigs/gallente?n=<!--[$name|replace:' ':'_']-->&id=<!--[$characterID]-->&s=y[/img][/url]" onclick="this.focus();this.select();" />
                    </div></td>  
                </div>
                </table><br /><br />
                <table style="border-collapse:collapse;border: #666666 1px solid;">        
                    <td class="dataTableHeader" style="width:138px;">Minmatar</td>
                    <td class="dataTableHeader" style="width:420px;" align="center"><img alt="Sig, yo!" src="/sigs/minmatar?n=<!--[$name|replace:' ':'_']-->&id=<!--[$characterID]-->&s=y" /></td>
                  </tr>
                  <tr>
                    <td class="dataTableHeader">BBCode :</td>
                    <td><div>
                      <input id="BBCode" name="BBCode" type="text" size="67" value="[url=http://<!--[php]-->echo $_SERVER['SERVER_NAME'];<!--[/php]-->/<!--[$name|replace:' ':'_']-->][img]http://<!--[php]-->echo $_SERVER['SERVER_NAME'];<!--[/php]-->/sigs/minmatar?n=<!--[$name|replace:' ':'_']-->&id=<!--[$characterID]-->&s=y[/img][/url]" onclick="this.focus();this.select();" />
                    </div></td>  
                </div>
                </table><br /><br />                                                                                                                        
              </div>
            </div>
          </div>
      </div>
      <br /><br />
        </div>
      </td>
    </tr>
    <tr>
      <td><div style="margin: auto; width: 100%; text-align: center;"><br /><br /></div></td>
    </tr>
  </tbody>
  </table>

  <!--[include file='footer.tpl']-->