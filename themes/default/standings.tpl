  <!--[include file='header.tpl' page='standings']-->
  
  <table class="mcenter" style="width:768px;margin-top:25px;" summary="Main">
  <tbody>
    <tr>
      <td><br /><br /><br />


          <!--[include file='mainheader.tpl']-->

          <!--[include file='maininfo.tpl']-->
          <br /> <br /> <br />
           <table style="border-collapse:collapse;border: #666666 1px solid;" width="100%">

					<tr>
						<td colspan="3" class="dataTableHeader">Current Standings</td>
					</tr>

				<!--[foreach key='key' name='outer' item='agents' from=$characterNPCStandings]-->

<!--[assign var="standing" value=$standingItem.0]-->

<!--[ if $standing < '-3']-->
<!--[assign var="stColor" value="bad"]-->
<!--[ elseif $standing >= '-3' && $standing <= '0.5']-->
<!--[assign var="stColor" value="average"]-->
<!--[ elseif $standing > '0.5']-->
<!--[assign var="stColor" value="good"]-->
<!--[/if]-->

					<tr>
						<td class="dataTableCell" style="width:32px;"><img alt="<!--[$standingItem.1]-->" title="<!--[$standingItem.1]-->" src="imgs/<!--[$standingItem.2]-->.png" width="32" height="32" /></td>
						<td class="dataTableCell"><!--[$standingItem.1]--></td>
						<td class="dataTableCell3 <!--[$stColor]-->" width="40" align="center"6><!--[$standingItem.0]--></td>
					</tr>
				<!--[/foreach]-->
				</table>
      </div>
        </div>
      </td>
    </tr>
    <tr>
      <td><div style="margin: auto; width: 100%; text-align: center;"><br /><br /></div></td>
    </tr>
  </tbody>
  </table>

  <!--[include file='footer.tpl']-->

</body>
</html>