
      <div class="charlist">
      <!--[charlist assign='charlist']-->
      <!--[if $charlist.count > 1]-->
        <!--[literal]-->
          <!--[if !IE]>--><br /><!--<![endif]-->
        <!--[/literal]--><a style="color:gold;font-weight:bold;text-decoration:none;padding-right:10px;" href="/" title="List of Characters">All Pilots</a>
      <!--[else]-->
        <!--[foreach item=char from=$charlist.chars]-->
          &nbsp;&nbsp;<span onclick="location.href='/<!--[$char.charname|replace:' ':'_']-->'" onmouseover="this.style.cursor='pointer';" title="<!--[$char.charname]-->"><img src="https://imageserver.eveonline.com/Character/<!--[$char.charid]-->_32.jpg" class="mbAvatar" style="border:1px solid gray;" alt="<!--[$char.charname]-->" /></span>
        <!--[/foreach]-->
      <!--[/if]-->
      </div>
        <div style="margin-top: 20px; margin-bottom: 24px;">
          <div style="margin-top: 20px;">
            <div style="background: rgb(44, 44, 56) url(/imgs/charinfo.jpg) no-repeat scroll 74px 5px; margin-bottom: 10px; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial; height: 23px;"></div>
            <img alt="Character Info" src="/imgs/charinfo.png" style="border: 0px none ; width: 64px; height: 64px; top: -52px;" class="newsTitleImage" />
            <div style="margin-left: 82px;"></div>
          <br /><br />