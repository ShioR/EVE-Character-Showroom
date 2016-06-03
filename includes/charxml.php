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

// Includes for error page
include_once 'eveclass.php';
$eve = new Eve();
       $sys['theme']    = 'default';
       $sys['filepath'] = 'cache/templates';
include_once('eveRender.class.php');
// Creating a Render instance
   $eveRender = New eveRender($sys);
   $eveRender->Assign('version',        _SKILLSHEET_VERSION);
   $eveRender->Assign('data_version',   _DATA_VERSION);
   
// The REAL big beef !!!
// Might do the PHPDoc thing one day but for now, this
// thing do a login on you account on the eve-online
// website and pull the XML data from your character.
// The xml is saved in a folder so that it doesn't try to
// login on every load. By default, the cache time is 1 hour.


function GetDefaultCharacter()
{

    global $eve;

    $dbconn =& DBGetConn(true);

    $sql = "SELECT * FROM skillsheet_apis WHERE selected = '1'";

    $result = $dbconn->Execute($sql);

    if ($dbconn->ErrorNo() != 0) {
        $eve->SessionSetVar('errormsg', 'Get All Characters: ' . $dbconn->ErrorMsg() . $sql);
        return false;
    }

    $chars = array();

    for (; !$result->EOF; $result->MoveNext()) {
        $char = $result->GetRowAssoc(2);
    }

    $result->Close();

    return $char;

}

function GetCharacterByID($characterID = 0)
{

    global $eve;

    if (empty($characterID)) {
        return false;
    }

    $dbconn =& DBGetConn(true);

    $sql = "SELECT * FROM skillsheet_apis WHERE characterID = '".Eve::VarPrepForStore($characterID)."'";

    $result = $dbconn->Execute($sql);

    if ($dbconn->ErrorNo() != 0) {
        $eve->SessionSetVar('errormsg', 'Get All Characters: ' . $dbconn->ErrorMsg() . $sql);
        return false;
    }

    $chars = array();

    for (; !$result->EOF; $result->MoveNext()) {
        $char = $result->GetRowAssoc(2);
    }

    $result->Close();

    return $char;

}

function GetCharacterByName($name = '')
{

    global $eve;

    if (empty($name)) {
        return false;
    }

    $dbconn =& DBGetConn(true);

    $sql = "SELECT * FROM skillsheet_apis WHERE name = '".$eve->VarPrepForStore($name)."'";

    $result = $dbconn->Execute($sql);

    if ($dbconn->ErrorNo() != 0) {
        $eve->SessionSetVar('errormsg', 'GetCharacterByName: ' . $dbconn->ErrorMsg() . $sql);
        return false;
    }

    $chars = array();

    for (; !$result->EOF; $result->MoveNext()) {
        $char = $result->GetRowAssoc(2);
    }

    $result->Close();

    return $char;

}

function GetAllCharacters($data = false, $limit = 0)
{

    global $eve;

    $dbconn =& DBGetConn(true);

    $getdata = "";

    if ($data) {
        $getdata = ", data";
    }

    $sql = "SELECT   name,
                     id,
                     characterID,
                     corporationName,
                     queue,
                     characterInfo
                     $getdata
            FROM     skillsheet_apis
            WHERE    public = '1'";
            //ORDER BY name";

    if ($limit && is_numeric($limit)) {
        $result = $dbconn->SelectLimit($sql, $limit, 1);
    } else {
        $result = $dbconn->Execute($sql);
    }

    if ($dbconn->ErrorNo() != 0) {
        $eve->SessionSetVar('errormsg', 'Get All Characters: ' . $dbconn->ErrorMsg() . $sql);
        return false;
    }

    $chars = array();

    for (; !$result->EOF; $result->MoveNext()) {
        $char = $result->GetRowAssoc(2);
        $chars[$char['characterID']] = $char;
    }

    $result->Close();

    return $chars;

}

function GetCharacters($config = array())
{

    if (!isset($config['keyID']) || !isset($config['vCode'])) {
        return false;
    }

    //if (!file_exists('cache/'.$config['keyID'].'.xml') || (time()-filemtime('cache/'.$config['keyID'].'.xml')) > 60*60) {
        $url = 'https://api.eveonline.com/account/Characters.xml.aspx';

        $data = array();

        $data = array('keyID'      => $config['keyID'],
                      'vCode'      => $config['vCode'],
                      'version'     => 2);
//echo '<pre>';print_r($data);echo '</pre>';exit;
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_HEADER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
        curl_setopt($ch, CURLOPT_CAINFO, getcwd() . "eveapi.crt");
        if ($data) {
            curl_setopt($ch, CURLOPT_POST, 1);
            curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
        }

        $content = curl_exec($ch);

        curl_close($ch);
/*
        if (sizeof($ch) > '0') {
            $file = fopen('cache/'.$config['keyID'].'.xml', 'w');
            fwrite($file, $content);
            fclose($file);
        }*/
    //} else {
    //    $content = file_get_contents('cache/'.$config['keyID'].'.xml');
    //}

    return $content;

}

function GetIDfromName($config = array())
{

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, "https://api.eveonline.com/eve/CharacterID.xml.aspx?names=".$char['corporationName']."");
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
$response = curl_exec($ch);
$prestr = "characterID=\"";
$prelen = strlen($prestr);
$tmpstr = strstr($ch,$prestr);
$tmppos = strpos($tmpstr,"\" />", $prelen);
$corpID = substr($tmpstr, $prelen, $tmppos - $prelen);

    return $nameToID;

}

function GetXML($config = array())
{

    if (!$config) {
  
		global $eveRender;
		$eveRender->Display('error_notfound.tpl');
        exit;
    }

    global $eve;
    //echo '<pre>';print_r($config);echo '</pre>';exit;

    if('0000-00-00' == $config['cachedUntil'] || '0000-00-00 00:00:00' == $config['cachedUntil']) {
        $config['cachedUntil'] = '1870-01-01 00:00:00';
    }
    //echo $config['cachedUntil'];echo strtotime($config['cachedUntil']); exit;
    //echo '<pre>';print_r($stime);echo '</pre>';exit;
    //$cachetime = $time
    
   if ((time()-strtotime($config['cachedUntil'])) > 3600) {
        $dbconn =& DBGetConn(true);
        $extensions = get_loaded_extensions();

        $curl = ((in_array('curl', $extensions)) ? 'Yes' : 'No');
        if ($curl) {

            $url = 'https://api.eveonline.com/char/CharacterSheet.xml.aspx';

            $data = array();
            if (isset($config['keyID']) && isset($config['vCode']) && isset($config['characterID'])) {
                $data = array('keyID'      => $config['keyID'],
                              'vCode'      => $config['vCode'],
                              'characterID' => $config['characterID'],
                              'version'     => 2);
                              
                $info = array('characterID'  => $config['characterID'],
							   'vCode'		 => $config['vCode'],
							   'keyID'		 => $config['keyID'],
                               'version'     => 2);                           
                                  
            } elseif (isset($config['keyID']) && isset($config['vCode']) && isset($config['characterID'])) {
                $data = array('keyID'      => $config['keyID'],
                              'vCode'      => $config['vCode'],
                              'characterID' => $config['characterID'],
                              'version'     => 2);
                              
                $info = array('characterID'  => $config['characterID'],
							   'vCode'		 => $config['vCode'],
							   'key'		 => $config['keyID'],
                               'version'     => 2);                              
            }

            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_HEADER, false);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
            curl_setopt($ch, CURLOPT_CAINFO, getcwd() . "eveapi.crt");            
            if ($data) {
                curl_setopt($ch, CURLOPT_POST, 1);
                curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
            }

            $content = curl_exec($ch);

            curl_close($ch);

            /*
            if (sizeof($ch) > '0') {
                $file = fopen($config['filename'], 'w');
                fwrite($file, $content);
                fclose($file);
            }*/

            $url = 'https://api.eveonline.com/char/SkillInTraining.xml.aspx';

            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_HEADER, false);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
            curl_setopt($ch, CURLOPT_CAINFO, getcwd() . "eveapi.crt");            
            if ($data) {
                curl_setopt($ch, CURLOPT_POST, 1);
                curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
            }

            $training = curl_exec($ch);

            curl_close($ch);


            // Get Queue Info
            $url = 'https://api.eveonline.com/char/SkillQueue.xml.aspx';

            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_HEADER, false);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
            curl_setopt($ch, CURLOPT_CAINFO, getcwd() . "eveapi.crt");             
            if ($data) {
                curl_setopt($ch, CURLOPT_POST, 1);
                curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
            }

            $queue = curl_exec($ch);

            curl_close($ch);
            
             // Get Character Info
            $url = 'https://api.eveonline.com/eve/CharacterInfo.xml.aspx';

            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_HEADER, false);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
            curl_setopt($ch, CURLOPT_CAINFO, getcwd() . "eveapi.crt");             
            if ($data) {
                curl_setopt($ch, CURLOPT_POST, 1);
                curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($info));
            }

            $characterInfo = curl_exec($ch);

            curl_close($ch);

            /*
            if (sizeof($ch) > '0') {
                $file = fopen($config['trainfile'], 'w');
                fwrite($file, $content);
                fclose($file);
            }*/

            if ($content) {
                $start = '<cachedUntil>';
                $end   = '</cachedUntil>';

                $cache = substr($content, strpos($content, $start)+13, 19);
                $sql = "UPDATE skillsheet_apis
                        SET    characterInfo   = '".$eve->VarPrepForStore($characterInfo)."',
							   data            = '".$eve->VarPrepForStore($content)."',
                               training        = '".$eve->VarPrepForStore($training)."',
                               queue           = '".$eve->VarPrepForStore($queue)."',
	                           cachedUntil     = '".$eve->VarPrepForStore($cache)."'
                        WHERE  characterID     = '".$eve->VarPrepForStore($config['characterID'])."'";

                $dbconn->Execute($sql);
            }

            return array('characterInfo' => $characterInfo, 'data' => $content, 'training' => $training, 'queue' => $queue, 'cachedUntil' => $cache);

        } else {
            return WriteCharXMLFile($config);
        }
    }

}

function simplexml2ISOarray($xml,$attribsAsElements=0) {
    if (get_class($xml) == 'SimpleXMLElement') {
        $attributes = $xml->attributes();
        foreach($attributes as $k=>$v) {
            if ($v) $a[$k] = (string) $v;
        }
        $x = $xml;
        $xml = get_object_vars($xml);
    }
    if (is_array($xml)) {
        if (count($xml) == 0) return (string) $x; // for CDATA
        foreach($xml as $key=>$value) {
            $r[$key] = simplexml2ISOarray($value,$attribsAsElements);
            if (!is_array($r[$key])) $r[$key] = utf8_decode($r[$key]);
        }
        if (isset($a)) {
            if($attribsAsElements) {
                $r = array_merge($a,$r);
                unset($r["@attributes"]);
            //} else {
            //    $r['@'] = $a; // Attributes
            }
        }
        return $r;
    }
    return (string) $xml;
}

function ParseXMLFile($content = '', $file = false)
{

    if (empty($content)) {
        echo "ARGG !!! NO FILE TO READ!";
        return false;
    }

    if ($file) {
        $filename = $content;
        if ($fp = @fopen($filename, 'r')) {
            $content = fread($fp, 1000000);
            fclose($fp);
        } else {
            echo "ARGG !!! PODKILLED BY FILE!";
            exit;
        }
    }

    $sxml = new SimpleXMLElement($content);

    $xml = simplexml2ISOarray($sxml,1);

    return $xml;

}

function WriteCharXMLFile($config=array())
{

    if ($config['eveconnect']) {

        $filename  = $config['filename'];
        $trainfile = $config['trainfile'];
        $filepath  = $config['filepath'];
        $charid    = $config['charid'];

        if (!file_exists($filename) || (time()-filemtime($filename)) > 60*60) {
            $req  = "keyID="       .$config['keyID'];
            $req .= "&vCode="      .$config['vCode'];
            $req .= "&characterID=" .$config['characterID'];
            $req .= "&version=2";

            // Wallet here only for the example.
            $target  = "POST /char/CharacterSheet.xml.aspx HTTP/1.1\r\n";
            $header .= "Host: api.eveonline.com\r\n";
            $header .= "Content-Type: application/x-www-form-urlencoded\r\n";
            $header .= "Content-Length: " . strlen($req) . "\r\n";
            $header .= "Connection: close\r\n\r\n";

            $fp = fsockopen ('api.eveonline.com', 80, $errno, $errstr, 30);

            if (!$fp) {
                echo 'meh! Eve server is such a n00b! '.$errstr; exit;
            }

            fputs ($fp, $target . $header . $req);
            $res = '';
            $done = false;
            while (!feof($fp)) {
                $res .= fgets ($fp, 1024);
            }
            $data  = array();
            $start = '<eveapi';
            $end   = '</eveapi>';

            $null = eregi("$start(.*)$end", $res, $data);

            if (sizeof($data) > '0') {
                $file = fopen($filename, 'w');
                fwrite($file, "<?xml version=\"1.0\" encoding=\"iso-8859-1\" ?>\n".$data[0]);
                fclose($file);
            }

            $target  = "POST /char/SkillInTraining.xml.aspx HTTP/1.0\r\n";
            $fp = fsockopen ('api.eveonline.com', 80, $errno, $errstr, 30);
            if (!$fp) {
                echo 'meh! Eve server is such a n00b! '.$errstr; exit;
            }

            fputs ($fp, $target . $header . $req);
            while (!feof($fp)) {
                $training .= fgets ($fp, 1024);
            }
            $data  = array();
            $null = eregi("$start(.*)$end", $training, $data);

            if (sizeof($data) > '0') {
                $file = fopen($trainfile, 'w');
                fwrite($file, "<?xml version=\"1.0\" encoding=\"iso-8859-1\" ?>\n".$data[0]);
                fclose($file);
            }

        }
    }

    return true;

}

?>