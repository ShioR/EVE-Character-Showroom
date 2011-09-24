<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-en">
<head>
  <title>Skills Showroom Install</title>
  <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1" />
  <!--[if not $done]--><meta http-equiv="refresh" content="1; URL=install.php?step=4&amp;sub=data" /><!--[/if]-->
  <link rel="stylesheet" type="text/css" href="themes/common.css" />
  <link rel="stylesheet" type="text/css" href="install/style/style.css" />
</head>

<body bgcolor="#222222" style="height: 100%">
  <div align="center" id="popup" style="display:none; position:absolute; top:217px; width:99%; z-index:3; padding: 5px;"></div>
  <table class="main-table" align="center" bgcolor="#111111" border="0" cellspacing="1" style="height: 100%" summary="overall main table">
    <tr style="height: 100%">
      <td valign="top" style="height: 100%; padding:0; margin:0; cell-spacing:0;">
        <div id="header" style="padding:0;margin:0;"><img src="install/images/banners/default.jpg" alt="MADH KILLBOARD" /></div>
        <div id="page-title">Install Step 4 - Data Importation</div>
        <table cellpadding="0" cellspacing="0" width="100%" border="0">
          <tr>

            <td valign="top">
              <div id="content">
              <!--[if not $done]-->
                <!--[if $useopt]-->
                <p>Inserting optional data (<!--[$i]-->/<!--[$optsel]-->) into <!--[$table]--> from file <!--[$file]-->...<!--[if not $error]--> ...done!<!--[/if]--></p>
                <!--[else]-->
                <p>File <!--[$file]--> had <!--[$lines]--> lines with <!--[$query_count]--> querys. <!--[$errors]--> Querys failed.<!--[if not $error]--> ...done!<!--[/if]--></p>
                <!--[/if]-->
                <p>Automatic reload in 1s for next chunk. <a href="install.php?step=4&amp;sub=data" title="Manual Link">Manual Link</a></p>
              <!--[else]-->
                <p>All tables imported. Checking tables for correct data...</p>
                <!--[if $tables]-->
                <table class="kb-subtable" style="width:400px;" summary="Table check">
                <thead>
                  <tr>
                    <th style="text-align:left;">Table Name</th>
                    <th style="text-align:right;">Rows</th>
                    <th style="text-align:right;">Rows in table</th>
                    <th style="text-align:right;">Result</th>
                  </tr>
                </thead>
                <tbody>
                <!--[foreach item='table' key='name' from=$tables]-->
                  <tr>
                    <td style="text-align:left;"><!--[$name]--></td>
                    <td style="text-align:right;"><!--[$table.test]--></td>
                    <td style="text-align:right;"><!--[$table.count]--></td>
                    <td style="text-align:right;"><!--[if $table.result]-->PASSED<!--[else]-->FAILED<!--[/if]--></td>
                  </tr>
                <!--[/foreach]-->
                </table>
                <!--[/if]-->
                <!--[if not $stoppage]--><p><a href="install.php?step=<!--[$nextstep]-->" title="Next Step">Next Step</a></p><!--[/if]-->
              <!--[/if]-->
              </div>
            </td>
          </tr>
        </table>

        <div class="counter"></div>
      </td>
    </tr>
  </table>
</body>
</html>