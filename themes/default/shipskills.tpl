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
            <div style="background: rgb(44, 44, 56) url(/imgs/<!--[$shipclass|lower|replace:" ":"_"]-->.png)  no-repeat scroll 74px 5px; margin-bottom: 10px; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial; height: 23px;"></div>
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
<td width="72" align="center"><img alt="<!--[$race]-->" title="<!--[$race]-->" src="/imgs/factions/<!--[$race|lower]-->.png" hspace="10" /></td>
                               <!--[foreach item='ship' from=$ships]-->
                  <td style="cursor:default; background-image:url('https://imageserver.eveonline.com/Render/<!--[$ship.typeID]-->_64.png'); background-position:center; background-repeat:no-repeat; padding: 3px;" valign="top" align="center" onmouseover="this.style.backgroundColor='#303030';" onmouseout="this.style.backgroundColor='#1B1B1B'"><a style="cursor:zoom-in;" href="/ship/<!--[$ship.typeName]-->" rel="iframe-full-full" class="pirobox" title="<!--[$ship.typeName]-->"><!--[if $ship.tag >= 4]--><img src="/imgs/ships/faction.png"/><!--[elseif $ship.tag == 3]--><img src="/imgs/ships/tech3.png"/><!--[elseif $ship.tag == 2]--><img src="/imgs/ships/tech2.png"/><!--[else $ship.tag == 1]--><img src="/imgs/ships/t1.png"/><!--[/if]--><br /></td>
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