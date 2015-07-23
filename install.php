<?php
/**********************************************************/
/*           EVE Character Showroom - Version 5           */
/*       'Improved' and maintained by Shionoya Risa       */
/*          Originally created by DeTox MinRohim          */
/*            Copyright (C) 2015 Shionoya Risa            */
/**********************************************************/
/* This program is free software: you can redistribute it */
/*   and/or modify it under the terms of the GNU General  */
/*     Public License as published by the Free Software   */
/*     Foundation, either version 3 of the License, or    */
/*           (at your option) any later version.          */
/*  This program is distributed in the hope that it will  */
/*  be useful, but WITHOUT ANY WARRANTY; without even the */
/*   implied warranty of MERCHANTABILITY or FITNESS FOR   */
/*                  A PARTICULAR PURPOSE.                 */
/*  See the GNU General Public License for more details.  */
/*         You should have received a copy of the         */
/*   GNU General Public License along with this program.  */
/*        If not, see http://www.gnu.org/licenses/        */
/**********************************************************/
/*   Lots of code snippets have been found in my travels  */
/*    if you think one of those snippets is yours, tell   */
/*         me. I will give all appropriate credits.       */
/**********************************************************/
/*  All EVE Online logos, images, trademarks and related  */
/* materials are copyright (C) CCP hf http://ccpgames.com */
/**********************************************************/

include_once 'includes/eveclass.php';
include_once 'includes/Smarty/Smarty.class.php';

$eve = New Eve();

// Two global arrays
$reg_src = array();
$reg_rep = array();

// define our smarty object
$eveRender = new Smarty();
$eveRender->left_delimiter = '<!--[';
$eveRender->right_delimiter = ']-->';
$eveRender->compile_dir = 'cache/templates';
$eveRender->template_dir = 'install/templates';
$eveRender->caching = false;
$eveRender->force_compile = true;
if (is_dir('includes/plugins')) {
    array_push($eveRender->plugins_dir, 'includes/plugins');
}

include 'includes/config.php';

$step = $eve->VarCleanFromInput('step');

if (empty($step) || !is_numeric($step)) {

    if (defined('_INSTALLED') && _INSTALLED == true) {
        $eve->SessionSetVar('statusmsg', 'Installation already done... jumping to Adding Characters section');
        $eve->RedirectUrl('install.php?step=5');
    } else {
        unset($GLOBALS['dbconfig']);
        $step = 1;
    }
}

if (defined('_INSTALLED') && _INSTALLED == true && $step < 5) {
    $eve->SessionSetVar('statusmsg', 'Installation already done... jumping to Adding Characters section');
    //$step = 5;
    $eve->RedirectUrl('install.php?step=5');
}

$stoppage = false;

$func = "step{$step}";
if ($step == 4) {
    $val = step4($step);
} else {
    $val = $func($step);
}

$eveRender->Assign('stoppage',  $stoppage);
$eveRender->Assign('step',      $step);
$eveRender->Assign('nextstep',  $step+1);


if ($step == 4 && $eve->VarCleanFromInput('sub') == 'data') {
    $template = 'install_step4_data.tpl';
} else {
    $template = (($step == 1) ? 'main.tpl' : 'install_step'.$step.'.tpl');
}

$eveRender->display($template);


function setEveRender()
{
    include_once 'includes/eveRender.class.php';
    $Render = new Smarty();
    $Render->left_delimiter = '<!--[';
    $Render->right_delimiter = ']-->';
    $Render->compile_dir = 'cache/templates';
    $Render->template_dir = 'install/templates';
    if (is_dir('includes/plugins')) {
        array_push($Render->plugins_dir, 'includes/plugins');
    }
    $Render->caching = false;
    $Render->force_compile = true;
    return $Render;
}

function step1($step)
{

    return true;

}

function step2($step)
{

    global $eve, $eveRender, $stoppage;

    $gd        = false;
    $truetype  = false;
    $truecolor = false;

    $extensions = get_loaded_extensions();
    $functions  = get_defined_functions();
    $simpleXML = ((in_array('SimpleXML', $extensions)) ? 'Yes' : 'No');
    $curl      = ((in_array('curl',      $extensions)) ? 'Yes' : 'No');
    $fopen     = ((in_array('fopen',     $functions['internal']))  ? 'Yes' : 'No');



    $folders = array('templates' => 'cache/templates');
    $files = array('evedbconfig' => 'includes/config.php');

    $cache = is_writable('cache');

    if ($cache) {
        foreach ($folders as $dirname => $dir) {
            $dirs[$dirname] = array('dir' => $dir,
                                    'val' => checkdir($dir));
        }
        foreach ($dirs as $dir) {
            if ($dir['val'] == false) {
                $stoppage = true;
                break;
            }
        }
    } else {
        $stoppage = true;
    }

    foreach ($files as $filename => $file) {
        $configs[$filename] = array('file' => $file,
                                    'val'  => checkfile($file));
    }
    foreach ($configs as $config) {
        if ($config['val'] == false) {
            $stoppage = true;
            break;
        }
    }

    $eveRender->Assign('simpleXML',   $simpleXML);
    $eveRender->Assign('curl',        $curl);
    $eveRender->Assign('curlversion', (($curl=='Yes') ? curl_version() : '0'));
    $eveRender->Assign('fopen',       $fopen);
    $eveRender->Assign('gd',          $gd);
    $eveRender->Assign('truetype',    $truetype);
    $eveRender->Assign('truecolor',   $truecolor);
    $eveRender->Assign('cache',       $cache);
    $eveRender->Assign('dirs',        $dirs);
    $eveRender->Assign('configs',     $configs);
    $eveRender->Assign('allowfopen',  $allowfopen);

    return true;

}

function step3($step)
{

    global $eve, $eveRender, $stoppage;

    $host      = $eve->VarCleanFromInput('host');
    $user      = $eve->VarCleanFromInput('user');
    $dbpass    = $eve->VarCleanFromInput('dbpass');
    $db        = $eve->VarCleanFromInput('db');
    $domain    = $eve->VarCleanFromInput('domain');

    if (empty($host)) {
        $host = 'localhost';
    }

    $dbok    = false;
    $server  = false;
    $goforit = false;

    $submit = $eve->VarCleanFromInput('submit');

    if (!empty($user) && !empty($submit)) {


        $GLOBALS['dbconfig']['dbtype']   = 'mysqli';
        $GLOBALS['dbconfig']['dbhost']   = $host;
        $GLOBALS['dbconfig']['dbname']   = $db;
        $GLOBALS['dbconfig']['dbuname']  = $user;
        $GLOBALS['dbconfig']['dbpass']   = $dbpass;
        $GLOBALS['dbconfig']['pconnect'] = 0;
        $GLOBALS['dbconfig']['encoded']  = 0;
        $GLOBALS['dbconfig']['debug']    = 0;
        $GLOBALS['dbdebug']['debug_sql'] == 0;

        include 'includes/dbfunctions.php';

        if (!DBInit()) {
            $server = false;
            $selectdb = false;
            $stoppage = true;
        } else {
            $server = true;
            if (!$dbconn =& DBGetConn(true)) {
                $stoppage = true;
            } else {
                $selectdb = true;
                $result = $dbconn->Execute('SELECT VERSION() AS version');
                if ($dbconn->ErrorNo()!=0) {
                    $selectdb = false;
                    $mysqlerror = '<br />Something went wrong:<br />'.$dbconn->ErrorMsg();
                    $stoppage = true;
                } else {
                    list($version) = $result->fields;
                }
            }
            if (!$stoppage) { $goforit = true; }
        }
    } else {
        $stoppage = true;
    }

        $write = $eve->VarCleanFromInput('write');
        if (!empty($write)) {
            $host      = $eve->VarCleanFromInput('write_host');
            $user      = $eve->VarCleanFromInput('write_user');
            $dbpass    = $eve->VarCleanFromInput('write_pass');
            $db        = $eve->VarCleanFromInput('write_db');
            $domain    = $eve->VarCleanFromInput('write_domain');
            $args = array('dbhost'      => $host,
                          'dbuname'     => $user,
                          'dbpass'      => $dbpass,
                          'dbname'      => $db,
                          'dbtype'      => 'mysqli',
                          'domain'      => $domain,
                          'dbtabletype' => 'MyISAM');

            $done = update_dbconfig_php($args);

        }
    //}


    $eveRender->Assign('db',        $db);
    $eveRender->Assign('host',      $host);
    $eveRender->Assign('user',      $user);
    $eveRender->Assign('dbpass',    $dbpass);
    $eveRender->Assign('domain',    $domain);
    $eveRender->Assign('server',    $server);
    $eveRender->Assign('submit',    $submit);
    $eveRender->Assign('version',   $version);
    $eveRender->Assign('selectdb',  $selectdb);
    $eveRender->Assign('done',      $done);

    return true;
}

function step4($step)
{

    global $eve, $eveRender, $stoppage;

    $data = $eve->VarCleanFromInput('data');

    if ($data) {

        // at this point, we wrote the config file so we're good to include that one
        include_once 'includes/dbfunctions.php';
        DBInit();

        $struct = $opt = $data = array();
        $dir = opendir('install/sql');
        while ($file = readdir($dir)) {
            if (strpos($file, '.sql') !== false) {
                $files[] = $file;
            }
        }

        $dbconn =& DBGetConn(true);

        $result = $dbconn->Execute('show tables');

        if ($dbconn->ErrorNo()!=0) {//echo 'a';exit;
            $mysqlerror = '<br />Something went wrong:<br />'.$dbconn->ErrorMsg();echo $dbconn->ErrorMsg();exit;
            $stoppage = true;
        }

        foreach ($files as $file) {
            $sql = file_get_contents('install/sql/'.$file);
            $sql = explode(';', $sql);
            foreach ($sql as $query) {
                $query = trim($query);
                if (empty($query)) { continue; }
                $dbconn->Execute($query);
                if ($dbconn->ErrorNo() != 0) {
                    $stoppage = true;
                    echo $dbconn->ErrorMsg();exit;
                }
            }
        }

        $eveRender->Assign('files', $files);
        updateInstallValue();
    }

    $eveRender->Assign('stoppage',  $stoppage);
    $eveRender->Assign('step',      $step);
    $eveRender->Assign('nextstep',  $step+1);

    return true;


}

function step5($step)
{
    global $eve, $eveRender, $stoppage;

    $submit = $eve->VarCleanFromInput('submit');

    $do = $eve->VarCleanFromInput('do');

    if (!empty($submit)) {
        include_once 'includes/dbfunctions.php';
        include_once 'includes/charxml.php';

        DBInit();

        $keyID = $eve->VarCleanFromInput('keyID');
        $vCode = $eve->VarCleanFromInput('vCode');

        $content = GetCharacters(array('keyID' => $keyID, 'vCode' => $vCode));

        if ($content) {
            $xml = ParseXMLFile($content);
            
            // Check if character already exists
            if (isset($xml['result']['rowset']['row']['name'])) {
                $test = GetCharacterByID($xml['result']['rowset']['row']['characterID']);
                if ($test) {
                    $eve->SessionSetVar('errormsg', 'Character already saved!');
                    $eve->RedirectUrl('install.php?step=5');
                }
                $chars[] = $xml['result']['rowset']['row'];
            } else {
                foreach ($xml['result']['rowset']['row'] as $key => $check) {
                    $test = GetCharacterByID($check['characterID']);
                    if (!$test) {
                        $chars[] = $check;
                    }
                }
            }

            $eveRender->Assign('submit',    true);
            $eveRender->Assign('keyID',    $keyID);
            $eveRender->Assign('vCode',    $vCode);
            if (isset($xml['error'])) {
                $eveRender->Assign('error',  $xml['error']);
            } else {
                $eveRender->Assign('charlist',  $chars);
                $eveRender->Assign('charcount', count($chars));
            }

            $eveRender->display('install_step5.tpl');exit;

        }
    }
    $eveRender->Assign('stoppage',  $stoppage);
    $eveRender->Assign('step',      $step);
    $eveRender->Assign('nextstep',  $step+1);
    
    return true;

}

function step6()
{
    global $eve, $eveRender, $stoppage;

    $submit = $eve->VarCleanFromInput('submit');

    if ($submit) {

        include_once 'includes/dbfunctions.php';
        include_once 'includes/charxml.php';

        DBInit();

        $dbconn =& DBGetConn(true);

        $keyID = $eve->VarCleanFromInput('keyID');
        $vCode = $eve->VarCleanFromInput('vCode');

        $save    = $eve->VarCleanFromInput('save');
        $names   = $eve->VarCleanFromInput('names');
        $corps   = $eve->VarCleanFromInput('corps');
        $public  = $eve->VarCleanFromInput('public');
        $implants  = $eve->VarCleanFromInput('implants');

        if ($save) {

            foreach ($save as $characterID => $value) {

                    $ispublic = false;
                    $isdefault = false;
                    $isimplants = false;

                    if (isset($public[$characterID])) {
                        $ispublic = true;
                    }
                    if (isset($implants[$characterID])) {
                        $isimplants = true;
                    }                    
                    if (isset($default[$characterID]) && !$defaultchar) {
                        $isdefault = true;
                    }

                $name = $names[$characterID];
                $corp = $corps[$characterID];
                $cacheTime = date("0000-00-00 00:00:00");    

                $sql = "INSERT INTO skillsheet_apis (id,
                                                         name,
                                                         public,
                                                         characterID,
                                                         corporationName,
                                                         keyID,
                                                         vCode,
                                                         selected,
                                                         implants,
                                                         characterInfo,
                                                         data,
                                                         training,
                                                         queue,
                                                         cachedUntil)
                            VALUES                      (NULL,                            
                                                         '".$eve->VarPrepForStore($name)        ."',
                                                         '".(($ispublic) ? 1 : 0)."',
                                                         '".$eve->VarPrepForStore($characterID) ."',
                                                         '".$eve->VarPrepForStore($corp)        ."',
                                                         '".$eve->VarPrepForStore($keyID)      ."',
                                                         '".$eve->VarPrepForStore($vCode)      ."',
                                                         '".(($isdefault) ? 1 : 0)              ."',
                                                         '".(($isimplants) ? 1 : 0)              ."',
                                                         '".$eve->VarPrepForStore($characterInfo)      ."',
                                                         '".$eve->VarPrepForStore($data)      ."',
                                                         '".$eve->VarPrepForStore($training)      ."',
                                                         '".$eve->VarPrepForStore($queue)      ."',                                                           
                                                         '".$eve->VarPrepForStore($cacheTime)    ."')";


                    $dbconn->Execute($sql);

                if ($dbconn->ErrorNo() != 0) {
                    echo $dbconn->ErrorMsg() . $sql; exit;
                    return false;
                }

            }

            $eveRender->display('install_step6.tpl');exit;

        }
    }

    return $eve->RedirectUrl('install.php?step=5'); 

    return true;
}

function step7()
{
    global $eve, $eveRender, $stoppage;
    $eveRender->Assign('baseurl', $eve->GetBaseUrl());
    return true;

}

function step8()
{

    global $eve, $eveRender;

    $eveRender->clear_compiled_tpl();

    $eve->RedirectUrl('skillsheet.php');
    return;

}

function checkdir($dir)
{
    if (!file_exists($dir))
    {
        mkdir($dir);
        chmod($dir, 0777);
    }
    return is_writable($dir);
}

function checkfile($file)
{
    if (!file_exists($file))
    {
        return false;
    }
    return is_writable($file);
}

// Setup various searches and replaces
// Scott Kirkwood
function add_src_rep($key, $rep)
{
    global $reg_src, $reg_rep;
    // Note: /x is to permit spaces in regular expressions
    // Great for making the reg expressions easier to read
    // Ex: $pnconfig['sitename'] = stripslashes("Your Site Name");
    $reg_src[] = "/ \['$key'\] \s* = \s* stripslashes\( (\' | \") (.*) \\1 \); /x";
    $reg_rep[] = "['$key'] = stripslashes(\\1$rep\\1);";
    // Ex. $pnconfig['site_logo'] = "logo.gif";
    $reg_src[] = "/ \['$key'\] \s* = \s* (\' | \") (.*) \\1 ; /x";
    $reg_rep[] = "['$key'] = '$rep';";
    // Ex. $pnconfig['pollcomm'] = 1;
    $reg_src[] = "/ \['$key'\] \s* = \s* (\d*\.?\d*) ; /x";
    $reg_rep[] = "['$key'] = $rep;";

    if ($key == '_INSTALLED' || $key == '_SHORTURLS') {
        $reg_src[] = "/\'$key\', \s*\'(.*)\\1\'/x";
        $reg_rep[] = "'$key', \\1$rep\\1";
    } else {
        // PASS
        $reg_src[] = "/\'$key\', \s*\'(.*)\\1\'/x";
        $reg_rep[] = "'$key', '$rep'";
    }
}

function updateInstallValue()
{
    global $reg_src, $reg_rep;
    add_src_rep("_INSTALLED",  'true');

    $ret = modify_file('includes/config.php', '', $reg_src, $reg_rep);

    if (preg_match("/Error/", $ret)) {
        show_error_info();
    }

    return $ret;
}

function update_dbconfig_php($args = array())
{

    global $reg_src, $reg_rep;

    if (!$args) {
        return false;
    }

    $dbhost      = $args['dbhost'];
    $dbuname     = $args['dbuname'];
    $dbpass      = $args['dbpass'];
    $domain      = $args['domain'];
    $dbname      = $args['dbname'];
    $dbtype      = $args['dbtype'];
    $dbtabletype = $args['dbtabletype'];
    $encoded     = 0;


    add_src_rep("dbhost",      $dbhost);
    add_src_rep("dbuname",     $dbuname);
    add_src_rep("dbpass",      $dbpass);
    add_src_rep("_DOMAIN",     $domain);
    add_src_rep("dbname",      $dbname);
    add_src_rep("dbtype",      $dbtype);
    add_src_rep("dbtabletype", $dbtabletype);
    add_src_rep("encoded",     '0');
    add_src_rep("pconnect",    '0');
    
    $ret = modify_file('includes/config.php', '', $reg_src, $reg_rep);

    if (preg_match("/Error/", $ret)) {
        show_error_info();
    }

    return $ret;
}

// mod_file is general, give it a source file a destination.
// an array of search patterns (Perl style) and replacement patterns
// Returns a string which starts with "Err" if there's an error
function modify_file($src, $dest, $reg_src, $reg_rep)
{
    $in = @fopen($src, "r");
    if (! $in) {
        return "FILE NOT FOUND:" . $src;
    }
    $i = 0;
    while (!feof($in)) {
        $file_buff1[$i++] = fgets($in, 4096);
    }
    fclose($in);

    $lines = 0; // Keep track of the number of lines changed

    while (list ($bline_num, $buffer) = each ($file_buff1)) {
        $new = preg_replace($reg_src, $reg_rep, $buffer);
        if ($new != $buffer) {
            $lines++;
        }
        $file_buff2[$bline_num] = $new;
    }

    if ($lines == 0) {
        // Skip the rest - no lines changed
        return "0 lines changed, did nothing";
    }

    if (!empty($dest)) {
        reset($file_buff1);
        $out_backup = @fopen($dest, "w");

        if (! $out_backup) {
            return "Error: unable to open for write: $dest";
        } while (list ($bline_num, $buffer) = each ($file_buff1)) {
            fputs($out_backup, $buffer);
        }

        fclose($out_backup);
    }

    reset($file_buff2);
    $out_original = fopen($src, "w");
    if (! $out_original) {
        return "Error: unable to open for write: $src";
    } while (list ($bline_num, $buffer) = each ($file_buff2)) {
        fputs($out_original, $buffer);
    }

    fclose($out_original);
    // Success!
    return "$src updated with $lines lines of changes".((!empty($dest)) ? ", backup is called $dest" : "");
}

?>