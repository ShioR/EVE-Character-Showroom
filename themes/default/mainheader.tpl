
      <div class="charlist">
      <!--[charlist assign='charlist']-->
      <!--[if $charlist.count > 5]-->
        <!--[literal]-->
          <!--[if !IE]>--><br /><!--<![endif]-->
        <!--[/literal]--><a style="color: gold; font-weight: bold;" href="/" title="List of Characters">All Pilots...</a>&nbsp;
      <!--[else]-->
        <!--[foreach item=char from=$charlist.chars]-->
          &nbsp;&nbsp;<a href="/<!--[$char.charname|replace:' ':'_']-->" title="<!--[$char.charname]-->"><img src="http://image.eveonline.com/Character/<!--[$char.charid]-->_32.jpg" class="mbAvatar" style="border:1px solid gray;" alt="<!--[$char.charname]-->" /></a>
        <!--[/foreach]-->
      <!--[/if]-->
      </div>
        <div style="margin-top: 20px; margin-bottom: 24px;">
          <div style="margin-top: 20px;">
            <div style="border-top: 1px solid rgb(67, 67, 67); border-bottom: 1px solid rgb(67, 67, 67); background: rgb(44, 44, 56) url(/imgs/charinfo.jpg) no-repeat scroll 74px 5px; margin-bottom: 10px; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial; height: 22px;"></div>
            <img alt="Character Info" src="/imgs/charinfo.png" style="border: 0px none ; width: 64px; height: 64px; top: -52px;" class="newsTitleImage" />
            <div style="margin-left: 82px;"></div>
          <br /><br />