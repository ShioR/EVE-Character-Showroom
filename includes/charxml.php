<?php
/***********************************************************/
/*           EVE Character Showroom - Version 4            */
/*       'Improved' and maintained by Shionoya Risa        */
/*          Originally created by DeTox MinRohim           */
/***********************************************************/
/*   This thing is free for you to take. You take all      */
/* responsabilities for using it. Whatever you do with it, */
/*  I don't care (although I would appreciate you send me  */
/*   any enhancement - ISK donations are also accepted).   */
/*                                                         */
/*   Lots of code snippets have been found in my travels   */
/*    if you think one of those snippets is yours, tell    */
/*         me. I will give all appropriate credits.        */
/***********************************************************/
/*   ISK donations to Shionoya Risa are also accepted ;)   */
/***********************************************************/

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

function GetCertInfo($certificateID = 0)
{

    global $eve;

    $dbconn =& DBGetConn(true);

    $sql = "SELECT     skillsheet_crtcategories.categoryName,
                       skillsheet_crtclasses.className,
                       skillsheet_crtcertificates.certificateID,
                       skillsheet_crtcertificates.categoryID,
                       skillsheet_crtcertificates.classID,
                       skillsheet_crtcertificates.grade,
                       skillsheet_crtcertificates.corpID,
                       skillsheet_crtcertificates.iconID,
                       skillsheet_crtcertificates.description
            FROM       skillsheet_crtcertificates
            INNER JOIN skillsheet_crtclasses    ON skillsheet_crtcertificates.classID    = skillsheet_crtclasses.classID
            INNER JOIN skillsheet_crtcategories ON skillsheet_crtcertificates.categoryID = skillsheet_crtcategories.categoryID
            WHERE      skillsheet_crtcertificates.certificateID = '".$eve->VarPrepForStore($certificateID)."'";

    $result = $dbconn->Execute($sql);

    if ($dbconn->ErrorNo() != 0) {
        $eve->SessionSetVar('errormsg', 'Get All Characters: ' . $dbconn->ErrorMsg() . $sql);
        return false;
    }

    $cert = array();

    for (; !$result->EOF; $result->MoveNext()) {
        $cert = $result->GetRowAssoc(2);
    }

    $result->Close();

    return $cert;

}

function GetCertsCategories()
{

    global $eve;

    $dbconn =& DBGetConn(true);

    $sql = "SELECT * FROM skillsheet_crtcategories ORDER BY categoryID";

    $result = $dbconn->Execute($sql);

    if ($dbconn->ErrorNo() != 0) {
        $eve->SessionSetVar('errormsg', 'Get All Characters: ' . $dbconn->ErrorMsg() . $sql);
        return false;
    }

    $cars = array();

    for (; !$result->EOF; $result->MoveNext()) {
        $car = $result->GetRowAssoc(2);
        $car['owned'] = array();
        $cars[$car['categoryID']] = $car;
    }

    $result->Close();

    return $cars;

}

function GetStandingInfo()
{

    global $eve;

    $dbconn =& DBGetConn(true);

    $sql = "SELECT * FROM skillsheet_apis.standings WHERE characterID = '".Eve::VarPrepForStore($characterID)."'";

    $result = $dbconn->Execute($sql);

    if ($dbconn->ErrorNo() != 0) {
        $eve->SessionSetVar('errormsg', 'Get All Characters: ' . $dbconn->ErrorMsg() . $sql);
        return false;
    }

    $stands = array();

    for (; !$result->EOF; $result->MoveNext()) {
        $stand = $result->GetRowAssoc(2);
        $stand['owned'] = array();
        $stands[$stand['categoryID']] = $stand;
    }

    $result->Close();

    return $stands;

}

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
                     characterInfo,
                     standings
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
        curl_setopt($ch, CURLOPT_CAINFO, getcwd() . "../includes/eveapi.crt");
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
		$eveRender->Display('errorheader.tpl');

  echo '<br /><br />
  <div id="content" class="mcenter" style="float:center;width:908px;margin-top:50px;" >
    <table summary="Characters List" style="border: #666666 1px solid; margin-left: 10px; width:910px;">
    <thead>
      <tr style="background: rgb(44, 44, 56);">
        <th colspan="<!--[$charcount]-->" class="dataTableHeader">Error</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>A character has not been found with that name, please check your spelling and try again. <br />This character may have been removed from the database due to an in-active account. <br />You can add your character <a href="/add">here.</a></td>
      </tr>   
     </tbody>
    </table>  
<br />
<br />
<br />
<br />
<br />';
		$eveRender->Display('footer.tpl');
	echo '</body>
</html>';
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
    
// hax the timer to make it a _few_ years ;)
   if ((time()-strtotime($config['cachedUntil'])) > 360) {
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
                $data = array('userID'      => $config['keyID'],
                              'apiKey'      => $config['vCode'],
                              'characterID' => $config['characterID'],
                              'version'     => 2);
                              
                $info = array('characterID'  => $config['characterID'],
							   'apiKey'		 => $config['vCode'],
							   'userID'		 => $config['keyID'],
                               'version'     => 2);                              
            }

            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_HEADER, false);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
            curl_setopt($ch, CURLOPT_CAINFO, getcwd() . "../includes/eveapi.crt");            
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
            curl_setopt($ch, CURLOPT_CAINFO, getcwd() . "../includes/eveapi.crt");            
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
            curl_setopt($ch, CURLOPT_CAINFO, getcwd() . "../includes/eveapi.crt");             
            if ($data) {
                curl_setopt($ch, CURLOPT_POST, 1);
                curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
            }

            $queue = curl_exec($ch);

            curl_close($ch);
            
            // Get standings
            $url = 'https://api.eveonline.com/char/Standings.xml.aspx';

            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_HEADER, false);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
            curl_setopt($ch, CURLOPT_CAINFO, getcwd() . "../includes/eveapi.crt");             
            if ($data) {
                curl_setopt($ch, CURLOPT_POST, 1);
                curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
            }

            $standings = curl_exec($ch);

            curl_close($ch);
            
             // Get Character Info
            $url = 'https://api.eveonline.com/eve/CharacterInfo.xml.aspx';

            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_HEADER, false);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
            curl_setopt($ch, CURLOPT_CAINFO, getcwd() . "../includes/eveapi.crt");             
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
                               standings       = '".$eve->VarPrepForStore($standings)."'
                        WHERE  characterID     = '".$eve->VarPrepForStore($config['characterID'])."'";

                $dbconn->Execute($sql);
            }

            return array('characterInfo' => $characterInfo, 'data' => $content, 'training' => $training, 'queue' => $queue, 'standings' => $standings);

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
            $req .= "&vCode="      .$config['userkey'];
            $req .= "&characterID=" .$config['charid'];
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