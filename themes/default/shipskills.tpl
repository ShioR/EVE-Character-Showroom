  <!--[include file='header.tpl' page='ships']-->
  <table class="mcenter" style="width:768px;margin-top:25px;" summary="Main">
  <tbody>
    <tr>
      <td><br /><br /><br />


          <!--[include file='mainheader.tpl']-->

          <!--[if $implants == 1]--><!--[include file='maininfo.tpl']--><!--[else]--><!--[include file='maininfo2.tpl']--><!--[/if]-->
          <!--[include file='queue.tpl']-->
          
<!-- SHIPS -->
<!--[strip]-->          
<br />

      <!--[foreach item='races' key='shipclass' from=$shipscanfly]--><div style="margin-top: 50px; margin-bottom: -24px;">
          <div style="margin-top: 10px;">
            <div style="background: rgb(44, 44, 56); background-image: url('/imgs/<!--[$shipclass|lower|replace:" ":"_"]-->.png'); background-position:15% 50%; background-repeat:no-repeat; background-size:170px 13px; margin-bottom: 10px; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial; height: 23px;"></div>
             <div class="sklnk" title="<!--[$shipclass]-->"><img alt="<!--[$shipclass]-->" src="/imgs/ships/<!--[$shipclass|lower|replace:" ":"_"]-->.png" style="border: 0px none ; width: 64px; height: 64px; top: -52px;" class="newsTitleImage" /></div>
            <div style="margin-left: 82px;">
          </div>
        </div>
      </div>
        <div style="margin-top: 50px;">
      <!--[foreach item='groups' key='race' from=$races]-->
            <div style="margin-left: 25px;">
            <!--[foreach item='ships' key='group' from=$groups]-->
             <div>
              <table border="0" cellpadding="0" cellspacing="0" style="max-width: 768px;">
                <tr>
<td width="72" align="center"><img alt="<!--[$race]-->" title="<!--[$race]-->" src="/imgs/factions/<!--[$race|lower]-->.png" width="64" height="64" hspace="10" /></td>
                               <!--[foreach item='ship' from=$ships]-->
                    <td style="cursor:default; background-image:url('https://imageserver.eveonline.com/Render/<!--[$ship.typeID]-->_128.png'); background-position:center; background-repeat:no-repeat; background-size:64px 64px; padding: 3px;" valign="top" align="center" onmouseover="this.style.backgroundColor='#303030';" onmouseout="this.style.backgroundColor='#1B1B1B'"><a style="cursor:zoom-in;" href="/ship/<!--[$ship.typeName]-->" rel="iframe-full-full" class="pirobox" title="<!--[$ship.typeName]-->"><!--[if $ship.tag >= 4]--><img src="/imgs/ships/faction.png"/><!--[elseif $ship.tag == 3]--><img src="/imgs/ships/tech3.png"/><!--[elseif $ship.tag == 2]--><img  src="/imgs/ships/tech2.png"/><!--[else $ship.tag == 1]--><img src="/imgs/ships/t1.png"/><!--[/if]--><br /></a><div style="bottom:0px; left:0px; width:64px; text-align:center; padding:0 0.5em; -moz-box-sizing:border-box; box-sizing:border-box; background-color: rgba(15, 15, 15, 0.4); font-size:xx-small; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;"><!--[$ship.typeName]--></div></td>
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
<!--[/strip]-->
  <!--[include file='footer.tpl']-->
</body>
</html>