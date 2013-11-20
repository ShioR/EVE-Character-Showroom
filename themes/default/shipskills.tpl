  <!--[include file='header.tpl' page='ships']-->
  <table class="mcenter" style="width:768px;margin-top:25px;" summary="Main">
  <tbody>
    <tr>
      <td><br /><br /><br />


          <!--[include file='mainheader.tpl']-->

          <!--[if $implants == 1]--><!--[include file='maininfo.tpl']--><!--[else]--><!--[include file='maininfo2.tpl']--><!--[/if]-->

<br />

      <!--[foreach item='races' key='shipclass' from=$shipscanfly]-->
      <a name="<!--[$shipclass]-->"</a>
      <div style="margin-top: 40px; margin-bottom: -24px;">
        <div style="margin-top: 10px;">
          <div style="border-top: 1px solid rgb(67, 67, 67); border-bottom: 1px solid rgb(67, 67, 67); background: rgb(44, 44, 56) url(/imgs/<!--[$shipclass|lower|replace:" ":"_"]-->.png) no-repeat scroll 24px 5px; margin-bottom: 10px; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial; height: 21px;">
            <!--<font style="border: 0px none ; text-align: right; position:relative; left: 5px; top: -11px;">[top]</font>-->
          </div>
        </div>
      </div>
        <div style="margin-top: 50px;">
      <!--[foreach item='groups' key='race' from=$races]-->
            <div style="margin-left: 22px;">
            <!--[foreach item='ships' key='group' from=$groups]-->
             <div>
              <table border="0" cellpadding="0" cellspacing="0" style="max-width: 768px;">
                <tr>
<td width="72" align="center"><img alt="<!--[$race]-->" title="<!--[$race]-->" src="/imgs/races/<!--[$race|lower]-->.png" width:44px; height:40px; hspace="10" /><!--<br /><!--[$race]-->--></td>
                               <!--[foreach item='ship' from=$ships]-->
                  <td style="background-image:url('http://image.eveonline.com/Render/<!--[$ship.typeID]-->_64.png'); background-position:center; background-repeat:no-repeat; cursor: pointer; padding: 3px;" valign="top" align="center" onmouseover="this.style.backgroundColor='#303030';" onmouseout="this.style.backgroundColor='#1B1B1B'"><a href="/shipViewer?gID=<!--[$ship.graphicID]-->" rel="iframe-875-610" class="pirobox" title="<!--[$ship.typeName]-->"><!--[if $ship.tag >= 4]--><img src="/imgs/ships/faction.png"/><!--[elseif $ship.tag == 3]--><img src="/imgs/ships/tech3.png"/><!--[elseif $ship.tag == 2]--><img src="/imgs/ships/tech2.png"/><!--[else $ship.tag == 1]--><img src="/imgs/ships/t1.png"/><!--[/if]--><br /></td>
                <!--[/foreach]-->
                </tr>
              </table>
              </div>
            <!--[/foreach]-->
            </div>
      <!--[/foreach]-->
        </div>
      <!--[/foreach]-->
      </div>
      <br /><br />
          
        </div>
      </div>
    </td>
  </tr>
  <tr>
    <td><div style="margin: auto; width: 100%; text-align: center;"><br /><br /></div></td>
  </tr>
      </td>
    </tr>
  </tbody>
  </table>

  <!--[include file='footer.tpl']-->

</body>
</html>