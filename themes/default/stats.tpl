  <!--[include file='header.tpl']-->


  <div id="content" class="mcenter" style="width:70%;margin-top:50px;" >
    <br /><br />
    <table summary="Characters List" style="border: #666666 1px solid; margin-left: 10px;">
    <thead>
      <tr style="background: #1B1B1B;">
        <th colspan="2" class="dataTableHeader">Top Skillpoints</th>
      </tr>
    </thead>
    <tbody>
      <!--[topsps assign='charlist']-->
      <!--[assign var='counter' value=1]-->
      <!--[foreach item='char' from=$charlist]-->      
      <tr>
        <td class="txtcenter">
          <img src="https://image.eveonline.com/Character/<!--[$char.characterID]-->_64.jpg" class="mbAvatar" style="border:1px solid gray" alt="<!--[$char.name]-->" />
        </td>
        <td>
          <br /><!--[$char.name]-->
          <br /><strong><!--[$char.skillpointstotal|number_format]--></strong>
          <br /><a href="/<!--[$char.name|replace:' ':'_']-->" title="Skillsheet for <!--[$char.name]-->">Skillsheet</a>
        </td>
      </tr>
      <!--[/foreach]-->
    </tbody>
    </table>
  </div>

<br />
<br />
<br />
<br />
<br />
  <!--[include file='footer.tpl']-->