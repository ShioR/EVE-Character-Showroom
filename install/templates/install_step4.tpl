        <!--[include file='header.tpl']-->


        <div id="content" style="margin-left: 10px;width:70%;margin-top:50px;" >
          <div class="block-header2">MySQL Database</div>
          <br /><br />
          <!--[if $files]-->
          <ul>
          <!--[foreach item='file' from=$files]-->
            <li><!--[$file]--> - Inserted</li>
          <!--[/foreach]-->
          </ul>
          <br />
          <p><a href="install.php?step=<!--[$nextstep]-->" title="Next Step">Next Step</a></p>
          <!--[else]-->
          We need to add tables to the database, please continue with <a href="install.php?step=4&amp;data=1" title="Creating Tables">Creating Tables</a>
          <!--[/if]-->
        </div>


        <!--[include file='footer.tpl']-->