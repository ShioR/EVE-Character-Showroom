  <!--[include file='header.tpl' page='certs']-->

  <table class="mcenter" style="width:768px;margin-top:25px;" summary="Main">
  <tbody>
    <tr>
      <td><br /><br /><br />


          <!--[include file='mainheader.tpl']-->

          <!--[if $implants == 1]--><!--[include file='maininfo.tpl']--><!--[else]--><!--[include file='maininfo2.tpl']--><!--[/if]-->


        <!--[foreach item='category' key='categoryID' from=$categories]-->
        <!--[if $categoryID neq 'B']-->

      <div style="margin-top: 40px; margin-bottom: -24px;">
        <div style="margin-top: 10px;">
          <div style="border-top: 1px solid rgb(67, 67, 67); border-bottom: 1px solid rgb(67, 67, 67); background: rgb(44, 44, 56) url(/imgs/certs/<!--[$category.categoryName|lower|strip:'_']-->.png) no-repeat scroll 24px 5px; margin-bottom: 10px; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial; height: 21px;">
            <!--<font style="border: 0px none; position:relative; left: 15px; top: 4px; font-weight: bold;"><!--[$category.categoryName]--></font>-->
          </div>
        </div>
      </div>
      <br />
          <div style="margin-top: 5px;">
            <div style="margin-top: 5px;">
              <div style="margin-left: 30px;">
                <table style="border-collapse:collapse;border: #666666 1px solid;">
                <!--[foreach item='certificate' from=$category.owned]-->
                  <tr>
                    <td class="dataTableHeader" style="width:32px;"><img alt="<!--[$certificate.className]-->" <!--[if $certificate.gradeName eq 'Elite']-->src="/imgs/icon79_06.png" <!--[/if]--><!--[if $certificate.gradeName eq 'Improved']-->src="/imgs/icon79_04.png" <!--[/if]--><!--[if $certificate.gradeName eq 'Standard']-->src="/imgs/icon79_02.png" <!--[/if]-->src="/imgs/icon79_01.png" /></td>
                    <td class="dataTableHeader" style="width:765px;"><!--[$certificate.className]--> - <span <!--[if $certificate.gradeName eq 'Elite']-->style="color: gold;" <!--[/if]--><!--[if $certificate.gradeName eq 'Improved']-->style="color: red;" <!--[/if]--><!--[if $certificate.gradeName eq 'Standard']-->style="color: green;" <!--[/if]-->><!--[$certificate.gradeName]--></span></td>
                  </tr>
                <!--[/foreach]-->
                </table>
              </div>
            </div>
          </div>
        <!--[/if]-->
        <!--[/foreach]-->
      </div>
      <br /><br />
       <div id="skillsidebox" style="display:none;" >
          <!--[foreach item='grp' from=$grptable]-->
            <strong><!--[$grp.grpname]--></strong>: <!--[$grp.spcount]--><br />
          <!--[/foreach]-->
            <br /><strong>Total: <!--[$skillpointstotal]--></strong>
            <br /><br />
            <a style="color: orange; font-weight: bold; text-decoration: none;" onclick="HideContent('skillsidebox'); return true;" href="#">[ close ]</a>
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