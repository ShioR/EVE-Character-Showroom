        <!--[include file='header.tpl']-->

        <div id="content" style="margin-left: 10px;width:70%;margin-top:50px;" >
          <div class="block-header2">Directory structure</div>
          <br /><br />
          <!--[if $cache]-->
            Cache directory is writeable, testing for subdirs now:
            <br /><br />
            <!--[foreach item='dir' key='key' from=$dirs]-->
            <!--[if $dir.val]-->
              Directory <span style="color:yellow;"><!--[$dir.dir]--></span> is there and writeable, excellent.<br />
            <!--[else]-->
              I cannot write into <!--[$dir.dir]--></span>, you need to fix that for me before you can continue.<br />
            <!--[/if]-->
            <!--[/foreach]-->
          <!--[else]-->
            I cannot write into ../cache, you need to fix that for me before you can continue.<br />
            Please issue a "chmod 777 ../cache" and "chmod 777 ../cache/*" on the commandline inside of this directory<br />
          <!--[/if]-->
            <br /><br />
            <div class="block-header2">Config files</div>
            Checking database and template config files:
            <br /><br />
            <!--[foreach item='file' key='key' from=$configs]-->
            <!--[if $file.val]-->
              File <span style="color:yellow;"><!--[$file.file]--></span> is there and writeable, excellent.<br />
            <!--[else]-->
              I cannot modify <span style="color:yellow;"><!--[$file.file]--></span>, you need to fix that for me before you can continue. (CHMOD: 666)<br />
            <!--[/if]-->
            <!--[/foreach]-->
            <br /><br />
            <div class="block-header2">Extensions</div>
            <ul>
              <li>CURL: <span style="color:yellow;"><!--[$curl]--><!--[if $curl eq 'No' && $fopen eq 'Yes']--> (Will use fopen)<!--[/if]--></span></li>
              <li>SimpleXML: <span style="color:yellow;"><!--[$simpleXML]--></span></li>
            </ul>
            <br /><br />
            <p><!--[if $stoppage]--><a href="install.php?step=<!--[$step]-->" title="Retry">Retry<!--[else]--><a href="install.php?step=<!--[$nextstep]-->">Next Step<!--[/if]--></a></p>
          </div>

        <!--[include file='footer.tpl']-->