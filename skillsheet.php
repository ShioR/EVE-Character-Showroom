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

include_once 'includes/version.php';
include_once 'includes/dbfunctions.php';
EveDBInit();

include_once('includes/skilltree.php');

//error_reporting(E_ALL);
// Including basic functions - PostNuke ftw!
include_once 'includes/eveclass.php';
$eve = new Eve();

$show   = $eve->VarCleanFromInput('show');
$isigb  = $eve->IsMiniBrowser();
$encode = $eve->VarCleanFromInput('encode');


// Checking for which page was called...
if (!empty($encode) && $encode == 'password') {

    // Redirected to the Encode Password func...
    EncodePassword($eve);

} else {

    include_once('includes/charxml.php');

    $name        = $eve->VarCleanFromInput('name');
    $characterID = $eve->VarCleanFromInput('cid');

    $character = array();

    if ($characterID || $name) {
        if ($name) {
            $name        = str_replace('_', ' ', $name);
            $character   = GetCharacterByName($name);
            $characterID = $character['characterID'];
        } else {
            $character = GetCharacterByID($characterID);
        }

        if ($character['public'] == 0 && !empty($charater['password'])) {

            $submit = $eve->VarCleanFromInput('submit');

            if ($submit) {
                $password = $eve->VarCleanFromInput('password');

                if (sha1($password) == $character['password']) {
                    $eve->SessionSetVar('pass', sha1($password));
                }
                $eve->RedirectUrl('skillsheet.php?cid='.$character['characterID'].((!empty($show)) ? '&show='.$show : ''));
            }

            $pass = $eve->SessionGetVar('pass');

            if (empty($pass) || $pass != $character['password']) {
                $sys['theme']    = 'default';
                $sys['filepath'] = 'cache/templates';
                include_once('includes/eveRender.class.php');
                // Creating a Render instance
                $eveRender = New eveRender($sys);
                $eveRender->Assign('needpass',    true);
                //$eveRender->Assign('name',        $config['name']);
                $eveRender->Assign('show',        $show);
                $eveRender->Assign('characterID', $character['characterID']);
                $eveRender->Display('password.tpl');
                exit;
            }
        }

        $getxml = GetXML($character);

        if ($getxml) {
            $character['characterInfo']        = $getxml['characterInfo'];
            $character['data']      		   = $getxml['data'];
            $character['training']   		   = $getxml['training'];
            $character['queue']       		   = $getxml['queue'];
            $character['cachedUntil']		   = $getxml['cachedUntil'];
        }
    }

    $sys['theme']    = 'default';
    $sys['filepath'] = 'cache/templates';

    $config = array_merge($sys, $character);
    
// Show/hide implants code
include 'includes/config.php';
    mysql_connect($dbconfig['dbhost'], $dbconfig['dbuname'], $dbconfig['dbpass']);
    mysql_select_db($dbconfig['dbname']);

				$result = mysql_query("SELECT implants FROM skillsheet_apis WHERE name = '$name'");
				$showImplants = mysql_result($result, 0);
				define('_IMPLANTS', $showImplants);
				
    mysql_close();		

// Count the total skills in database
    mysql_connect($dbconfig['dbhost'], $dbconfig['dbuname'], $dbconfig['dbpass']);
   	mysql_select_db($dbconfig['dbname']);
		// Get the total using the published flag
				$result = mysql_query("SELECT published FROM skillsheet_skills WHERE published = '1'"); 
		// Count rows & assume it's correct...
				$total = mysql_num_rows($result);
               // Define the output
                define('_TOTALSKILLS', $total);
   	mysql_close();
    
    include_once('includes/eveRender.class.php');

    // Creating a Render instance
    $eveRender = New eveRender($config);

    $eveRender->Assign('theme',   $config['theme']);
    $eveRender->Assign('version',        _SKILLSHEET_VERSION);
    $eveRender->Assign('dVersion',       _DATA_VERSION);
    $eveRender->Assign('implants',       _IMPLANTS);
    $eveRender->Assign('getskillstotal', _TOTALSKILLS);
    
    switch ($show) {
        case 'ships':
            ships($config);
            break;
        case 'list':
            charlist($config);
            break; 
        case 'addnew':
            AddNew($config);
            break;
        case 'stats':
            $eveRender->display('stats.tpl');exit;
            break;
        case 'sig':
            sig($config);exit;
            break;
        case 'newsig':
            newsig($config);exit;
            break;
        case 'sig2':
            sig2($config);exit;
            break; 
        case 'sigs':
            siglist($config);exit;
            break;   
        case 'chart':
            chart($config);
            break;      
        case 'error':
            $eveRender->display('error.tpl');exit;
            break;        
        default:
            if ($characterID) {
                index($config);
            } else {
                charlist($config);
            }
    }
}

function AddNew($config)
{

    global $eve, $eveRender;
    
    $chars_stat = GetAllCharacters();
    $eveRender->Assign('charcount', count($chars_stat));  
    
    $step = $eve->VarCleanFromInput('step');

    //if (empty($step)) {
    $submit = $eve->VarCleanFromInput('submit');

    $do = $eve->VarCleanFromInput('do');

    if (!empty($submit)) {
        if ($do == 'get') {

            $dbconn =& DBGetConn(true);

            $keyID = $eve->VarCleanFromInput('keyID');
            $vCode = $eve->VarCleanFromInput('vCode');

            $save    = $eve->VarCleanFromInput('save');
            $names   = $eve->VarCleanFromInput('names');
            $corps   = $eve->VarCleanFromInput('corps');
            $corpsID  = $eve->VarCleanFromInput('corpsID');
            $alliances   = $eve->VarCleanFromInput('alliances');
            $alliancesID   = $eve->VarCleanFromInput('alliancesID');
            $public  = $eve->VarCleanFromInput('public');
            $implants  = $eve->VarCleanFromInput('implants');
            //$default = $eve->VarCleanFromInput('default');
            //$passwords = $eve->VarCleanFromInput('passwords');

            if ($save) {

                //if (empty($default)) {
                    //$keys = array_keys($save);
                    //$default[$keys[0]] = on;
                //}

                // Checking if there is already a default character
                //$defaultchar = GetDefaultCharacter();

                foreach ($save as $characterID => $value) {

                    $ispublic = true;
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

/*                    $password = "";
                    if (isset($passwords[$characterID]) && !empty($passwords[$characterID])) {
                        $password = sha1(trim($passwords[$characterID]));
                    }*/

                    $name = $names[$characterID];
                    $corp = $corps[$characterID];
                    $corpID = $corpsID[$characterID];
                    $alliance = $alliances[$characterID];
                    $allianceID = $alliancesID[$characterID];
                    $cacheTime = date("2000-m-d 13:37:00");         

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
                                                         '".(($ispublic) ? 1 : 1)."',
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

                $eve->RedirectUrl('../');

            }
        } else {

            $keyID = $eve->VarCleanFromInput('keyID');
            $vCode = $eve->VarCleanFromInput('vCode');

            $content = GetCharacters(array('keyID' => $keyID, 'vCode' => $vCode));

            if ($content) {
                $xml = ParseXMLFile($content);//ParseXMLFile('cache/'.$keyID.'.xml', true);

                // Check if character already exists
                if (isset($xml['result']['rowset']['row']['name'])) {
                    $test = GetCharacterByID($xml['result']['rowset']['row']['characterID']);
                    if ($test) {
                        $eve->SessionSetVar('errormsg', 'Character already saved!');
                        $eve->RedirectUrl('skillsheet.php?show=addnew');
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

                $eveRender->display('addnew.tpl');exit;

            }
        }
    } else {
        $eveRender->display('addnew.tpl');exit;
    }

}

function charlist($config)
{

    global $eveRender;                 

    $characters = GetAllCharacters();
    array_multisort($characters, SORT_ASC);

    $eveRender->Assign('charlist',  $characters);
    $eveRender->Assign('charcount', count($characters));    


    $eveRender->Display('charlist.tpl');//return $template = 'shipskills.tpl';
    exit;
}

function GetImplants($attEnhancers = array())
{

    if (!$attEnhancers) {
        return false;
    }

    $implants = array();

    if (count($attEnhancers) > 0) {
        $impInt = ((isset($attEnhancers['intelligenceBonus'])) ? $attEnhancers['intelligenceBonus']['augmentatorValue'] : 0);
        $impCha = ((isset($attEnhancers['charismaBonus']))     ? $attEnhancers['charismaBonus']['augmentatorValue']     : 0);
        $impPer = ((isset($attEnhancers['perceptionBonus']))   ? $attEnhancers['perceptionBonus']['augmentatorValue']   : 0);
        $impMem = ((isset($attEnhancers['memoryBonus']))       ? $attEnhancers['memoryBonus']['augmentatorValue']       : 0);
        $impWil = ((isset($attEnhancers['willpowerBonus']))    ? $attEnhancers['willpowerBonus']['augmentatorValue']    : 0);
        $implants        = array('intelligence' => $impInt,
                                 'charisma'     => $impCha,
                                 'perception'   => $impPer,
                                 'memory'       => $impMem,
                                 'willpower'    => $impWil);
    }

    return $implants;

}

function BuildSkillSet($skills, $training)
{

    global $skillsource;
    reset($skillsource);

    $x = 0;
    $y = 0;
    $count            = count($skills);///2;
    $skilltree        = array();
    $skillgroups      = array();
    $skillpointstotal = 0;
    $totalskillpoints = 0;
    $l1sps            = 0;
    $l2sps            = 0;
    $l3sps            = 0;
    $l4sps            = 0;
    $l5sps            = 0;
    $l1total          = 0;
    $l2total          = 0;
    $l3total          = 0;
    $l4total          = 0;
    $l5total          = 0;
    $alltotal         = 0;
    $skilltreeX       = array();
 //echo '<pre>';print_r($skillsource);echo '</pre>';exit;
    foreach ($skillsource as $groups) {
        foreach($groups as $groupID => $group) {
            $skilltreeX[$group['typeID']] = $group;
        }
    }
    
    $dumb = array();
    foreach ($skills as $skill) {
        $dumb[$skill['typeID']] = $skill;
    }
    $skills = $dumb;

    foreach ($skilltreeX as $skill) {
        if (isset($skills[$skill['typeID']])) {
    

    // Simplifying the skill tree...
    // for ($x = 0; $x < $count; $x++) {

        $typeID      = $skills[$skill['typeID']]['typeID'];
        $skillCost   = $skilltreeX[$typeID]['skillCost'];
        $groupID     = $skilltreeX[$typeID]['groupID'];
        $groupName   = $skilltreeX[$typeID]['groupName'];
        $skillpoints = $skills[$skill['typeID']]['skillpoints'];
        $level       = $skills[$skill['typeID']]['level'];
        $typeName    = $skilltreeX[$typeID]['typeName'];
        $rank        = $skilltreeX[$typeID]['rank'];

        $skillgroups[$groupID] = $groupName;

        // Temp fix
        $skilllevel1 = 250    * $rank;
        $skilllevel2 = 1414   * $rank;
        $skilllevel3 = 8000   * $rank;
        $skilllevel4 = 45255  * $rank;
        $skilllevel5 = 256000 * $rank;

        $flag = (($typeID == $training['trainingTypeID']) ? 61 : 0);
        $skilltree[$groupID][$typeID] = array('typeName'    => $typeName,
                                              'rank'        => $rank,
                                              'typeID'      => $typeID,
                                              'skillCost'   => $skillCost,
                                              'groupID'     => $groupID,
                                              'groupName'   => $groupName,
                                              'flag'        => $flag,
                                              'skillpoints' => $skillpoints,
                                              'level'       => $level,
                                              'skilllevel1' => $skilllevel1,
                                              'skilllevel2' => $skilllevel2,
                                              'skilllevel3' => $skilllevel3,
                                              'skilllevel4' => $skilllevel4,
                                              'skilllevel5' => $skilllevel5);

        $skillsearch["$typeName"] = array('level' => $level, 'trained' => 0);

        $alltotal++;
        switch ($level) {
            case 1:
                $l1total = $l1total+ 1;
                $l1sps   = $l1sps  + $skillpoints;
                break;
            case 2:
                $l2total = $l2total+ 1;
                $l2sps   = $l2sps  + $skillpoints;
                break;
            case 3:
                $l3total = $l3total+ 1;
                $l3sps   = $l3sps  + $skillpoints;
                break;
            case 4:
                $l4total = $l4total+ 1;
                $l4sps   = $l4sps  + $skillpoints;
                break;
            case 5:
                $l5total = $l5total+ 1;
                $l5sps   = $l5sps  + $skillpoints;
                break;
            case 0:
                break;
        }

        $skillpointstotal = $skillpointstotal + $skillpoints;
        $totalskillpoints = $totalskillpoints + $skillpoints;
      }
    }

    foreach ($skilltree as $grpid => $st) {
        $spcount = 0;
        foreach ($st as $s) {
            $spcount = $spcount+$s['skillpoints'];
        }

        $grptable[$grpid]['grpname'] = $skilltree[$grpid][$s['typeID']]['groupName'];
        $grptable[$grpid]['spcount'] = number_format($spcount, 0, '', ',');
        $grptable[$grpid]['spcount2'] = ($spcount);
    }

    $return = array('grptable' => $grptable,
                    'skilltree' => $skilltree,
                    'skillgroups' => $skillgroups,
                    'l1sps' => $l1sps,
                    'l1total' => $l1total,
                    'l2sps' => $l2sps,
                    'l2total' => $l2total,
                    'l3sps' => $l3sps,
                    'l3total' => $l3total,
                    'l4sps' => $l4sps,
                    'l4total' => $l4total,
                    'l5sps' => $l5sps,
                    'l5total' => $l5total,
                    'count'   => $count,
                    'skilltreeX' => $skilltreeX,
                    'skillsearch' => $skillsearch,
                    'totalskillpoints' => $totalskillpoints,
                    'skillpointstotal' => $skillpointstotal);

    return $return;
}

// The small big thing...
function index($config = array())
{
    global $eve, $skillsource, $eveRender;

    $xml = null;

    $training = GetTrainingData($config['training']);

    $xml = ParseXMLFile($config['data']);
    $cxml = ParseXMLFile($config['characterInfo']);
    
    $errortime = date("D, M d, G:i:s", strtotime($xml['cachedUntil']));
    
    if (isset($xml['error'])) {
	       
		global $eveRender;
		$eveRender->Display('errorheader.tpl');

  echo '<br /><br />
  <div id="content" class="mcenter" style="float:center;width:908px;margin-top:50px;" >
    <table summary="Characters List" style="border: #666666 1px solid; margin-left: 10px; width:910px;">
    <thead>
      <tr style="background: rgb(44, 44, 56);">
        <th colspan="<!--[$charcount]-->" class="dataTableHeader">NO INFORMATION FOUND!</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>No information about this character was retrieved last time the API was queried.<br />This will likely resolve itself, check back in an hour to try again.<br />You can check the status of the API <a href="http://eve-offline.net/api/" target="_blank">here.</a><br /><a href="javascript:history.back()" title="Go back">Go Back</a></td>
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
</html>';exit;
	    }
    

    $char      = $xml['result'];
    $info	   = $cxml['result'];

    $characterID     = $char['characterID'];

    $name            = $char['name'];
    $race            = $char['race'];
    $bloodLine       = $char['bloodLine'];
    $gender          = $char['gender'];
    $dob             = $char['DoB'];
    $secStatus 		 = $info['securityStatus'];
    $ancestry        = $char['ancestry'];    
    $corporationName = $char['corporationName'];
    $corporationID   = $char['corporationID'];
    $allianceName    = $char['allianceName'];
    $allianceID      = $char['allianceID'];    
    $balance         = $char['balance'];
    $freeSP          = $char['freeSkillPoints'];
/*    $attEnhancers    = $char['attributeEnhancers'];
    if($attEnhancers != ''){
    $memory			 = $attEnhancers['memoryBonus']['augmentatorValue'];
    $intelligence	 = $attEnhancers['intelligenceBonus']['augmentatorValue'];
    $willpower		 = $attEnhancers['willpowerBonus']['augmentatorValue'];
    $perception		 = $attEnhancers['perceptionBonus']['augmentatorValue'];
    $charisma		 = $attEnhancers['charismaBonus']['augmentatorValue'];
    }*/
    $attributes      = array('intelligence' => $char['attributes']['intelligence'],
                             'charisma'     => $char['attributes']['charisma'],
                             'perception'   => $char['attributes']['perception'],
                             'memory'       => $char['attributes']['memory'],
                             'willpower'    => $char['attributes']['willpower']);//echo '<pre>';

//  $implants = GetImplants($attEnhancers);

    $skillTraining   = $training;

    $skills          = $char['rowset'][3]['row'];

    $assign = BuildSkillSet($skills, $training);
    
    // APOCRYPHA Queue
    $SkillQueue   = GetQueueData($config['queue']);

    $eveRender->force_compile = true;

    // Assign the information
    $eveRender->Assign('name',              $name);
    $eveRender->Assign('race',              $race);
    $eveRender->Assign('bloodLine',         $bloodLine);
    $eveRender->Assign('gender',            $gender);
    $eveRender->Assign('DoB',               $dob);
    $eveRender->Assign('securityStatus',    $secStatus);
    $eveRender->Assign('ancestry',          $ancestry);     
    $eveRender->Assign('corporationName',   $corporationName);
    $eveRender->Assign('corporationID',     $corporationID);
    $eveRender->Assign('allianceName',      $allianceName);
    $eveRender->Assign('allianceID',        $allianceID);    
    $eveRender->Assign('balance',           number_format($balance, 2, '.', ' '));
    $eveRender->Assign('freeSP',            $freeSP);
    $eveRender->Assign('memoryImp',         $memory);
    $eveRender->Assign('intelligenceImp',   $intelligence);
    $eveRender->Assign('willpowerImp',      $willpower);
    $eveRender->Assign('perceptionImp',     $perception);
    $eveRender->Assign('charismaImp',       $charisma);
    if($skillTraining['skillName'] != '') {
        $eveRender->Assign('Training',          $skillTraining['skillName']);
        $eveRender->Assign('ToLevel',           $skillTraining['trainingToLevel']);
        $eveRender->Assign('TrainingID',        $skillTraining['trainingTypeID']);
        $eveRender->Assign('trainingStartTime', $skillTraining['trainingStartTime']);
        $eveRender->Assign('trainingEndTime',   $skillTraining['trainingEndTime']);
        $eveRender->Assign('TrainingTimeLeft',  $skillTraining['TrainingTimeLeft']);
        $eveRender->Assign('trainingStartstamp',  strtotime($skillTraining['trainingStartTime']));
        $eveRender->Assign('trainingEndstamp',  strtotime($skillTraining['trainingEndTime']));
        $eveRender->Assign('trainingStartFormat', date("m/d/Y G:i:s", strtotime($skillTraining['trainingStartTime']." GMT")));
        $eveRender->Assign('trainingEndFormat', date("m/d/Y G:i:s", strtotime($skillTraining['trainingEndTime']." GMT")));
    }
    $time     = time();
    $filetime = strtotime($config['cachedUntil']);//filemtime($config['filename']);
    $left     = ($filetime + 3600) - $time;
    $diffDate = $left;
    $days     = floor($diffDate / 24 / 60 / 60 );
    $diffDate = $diffDate - ($days*24*60*60);
    $hours    = floor($diffDate / 60 / 60);
    $diffDate = ($diffDate - ($hours*60*60));
    $minutes  = floor($diffDate/60);
    $diffDate = $diffDate - ($minutes*60);
    $seconds  = floor($diffDate);
    $eveRender->Assign('cachetimeleft',     date("m/d/Y G:i:s", strtotime($config['cachedUntil']." GMT")));
    $eveRender->Assign('skilltree',         $assign['skilltree']);
    $eveRender->Assign('skillgroups',       $assign['skillgroups']);
    $eveRender->Assign('characterID',       $characterID);
    $eveRender->Assign('attributes',        $attributes);
    $eveRender->Assign('attributeEnhancers',        $impBonus);
    $eveRender->Assign('pageupdateminutes', $minutes);
    $eveRender->Assign('pageupdateseconds', $seconds);
    $eveRender->Assign('l1total',           $assign['l1total']);
    $eveRender->Assign('l1spsformat',       number_format($assign['l1sps'], 0, '', ' '));
    $eveRender->Assign('l2total',           $assign['l2total']);
    $eveRender->Assign('l2spsformat',       number_format($assign['l2sps'], 0, '', ' '));
    $eveRender->Assign('l3total',           $assign['l3total']);
    $eveRender->Assign('l3spsformat',       number_format($assign['l3sps'], 0, '', ' '));
    $eveRender->Assign('l4total',           $assign['l4total']);
    $eveRender->Assign('l4spsformat',       number_format($assign['l4sps'], 0, '', ' '));
    $eveRender->Assign('l5total',           $assign['l5total']);
    $eveRender->Assign('l5spsformat',       number_format($assign['l5sps'], 0, '', ' '));
    $eveRender->Assign('l1sps',             $assign['l1sps']);
    $eveRender->Assign('l2sps',             $assign['l2sps']);
    $eveRender->Assign('l3sps',             $assign['l3sps']);
    $eveRender->Assign('l4sps',             $assign['l4sps']);
    $eveRender->Assign('l5sps',             $assign['l5sps']);
    $eveRender->Assign('grptable',          $assign['grptable']);
    $eveRender->Assign('totalsks',          $assign['count']);
    $eveRender->Assign('totalsps',          $assign['skillpointstotal']);
    $eveRender->Assign('totalskillpoints',  $assign['totalskillpoints']);
    $eveRender->Assign('skillpointstotal',  number_format($assign['skillpointstotal'], 0, '', ','));
    $eveRender->Assign('SkillQueue',        $SkillQueue);


    // Version
    $eveRender->Assign('version',           _SKILLSHEET_VERSION);
    $eveRender->Assign('dVersion',          _DATA_VERSION);

    // Display the template.
    $eveRender->Display('template.tpl');

    // We're done !
    exit;

}

function ships($config = array())
{

    global $skillsource, $eveRender;

    $training = GetTrainingData($config['training']);

    $parse = ParseXMLFile($config['data']);
    $info = ParseXMLFile($config['characterInfo']);

    $char = $parse['result'];
    $charInfo = $info['result'];

    $characterID     = $char['characterID'];

    $name            = $char['name'];
    $race            = $char['race'];
    $bloodLine       = $char['bloodLine'];
    $gender          = $char['gender'];
    $dob             = $char['DoB'];
    $secStatus 		 = $charInfo['securityStatus'];
    $ancestry        = $char['ancestry'];    
    $corporationName = $char['corporationName'];
    $corporationID   = $char['corporationID'];
    $allianceName    = $char['allianceName'];
    $allianceID      = $char['allianceID'];    
    $balance         = $char['balance'];
    $freeSP          = $char['freeSkillPoints'];
   /* $attEnhancers    = $char['attributeEnhancers'];
    if($attEnhancers != ''){
    $memory			 = $attEnhancers['memoryBonus']['augmentatorValue'];
    $intelligence	 = $attEnhancers['intelligenceBonus']['augmentatorValue'];
    $willpower		 = $attEnhancers['willpowerBonus']['augmentatorValue'];
    $perception		 = $attEnhancers['perceptionBonus']['augmentatorValue'];
    $charisma		 = $attEnhancers['charismaBonus']['augmentatorValue'];
    }*/
    $attributes      = array('intelligence' => $char['attributes']['intelligence'],
                             'charisma'     => $char['attributes']['charisma'],
                             'perception'   => $char['attributes']['perception'],
                             'memory'       => $char['attributes']['memory'],
                             'willpower'    => $char['attributes']['willpower']);//echo '<pre>';

//    $implants = GetImplants($attEnhancers);

    $skillTraining   = $training;

    $skills          = $char['rowset'][3]['row'];

    $assign = BuildSkillSet($skills, $training);
    
    // APOCRYPHA Queue
    $SkillQueue   = GetQueueData($config['queue']);

    $skillsearch = $assign['skillsearch'];

    $shipgroups = Shipgroups();
    $factions = array(500001  => 'Caldari State',
                      500002  => 'Minmatar Republic',
                      500003  => 'Amarr Empire',
                      500004  => 'Gallente Federation',
                      500010  => 'Guristas Pirates',
                      500011  => 'Angel Cartel',
                      500012  => 'Blood Raider Covenant',
                      500014  => 'ORE',
                      500016  => 'Servant Sisters of EVE',
                      500018  => 'Mordu\'s Legion Command',
                      500019  => 'Sansha\'s Nation',
                      500020  => 'Serpentis');

    $dbconn   =& DBGetConn(true);

    $ships = array();

       foreach ($shipgroups as $grouID => $group) {
        foreach ($factions as $factionNo => $shipfaction) {
            $sql = "SELECT   typeID,
                             groupID,
                             typeName,
                             tag,
                             factionID,
                             graphicID,
                             graphicFile
                    FROM     `skillsheet_ships`
                    WHERE    `skillsheet_ships`.groupID   = '".$grouID."'
                    AND      `skillsheet_ships`.factionID    = '".$factionNo."'
                    ORDER BY `skillsheet_ships`.typeName";

            $result = $dbconn->Execute($sql);

            if ($dbconn->ErrorNo() != 0) {
                echo $dbconn->ErrorMsg() . $sql;exit;
            }

            for (; !$result->EOF; $result->MoveNext()) {
                list($typeID, $groupID, $typeName, $tag, $factionID, $graphicID, $graphicFile) = $result->fields;

                $required  = GetRequiredSkills($typeID, $groupID, $skillsearch);

                $canfly = true;

                foreach ($required as $key => $value) {
                    $reqskillname = $value['skillName'];
                    if ($groupID == 893 && $value['skillName'] == 'Electronic Attack Ships') {
                        $reqskillname = 'Electronic Attack Ships';
                    }
                    if (!isset($skillsearch["$reqskillname"]) || $skillsearch["$reqskillname"]['level'] < $value['level']) {
                        $canfly = false;
                    }
                }

                if ($canfly) {
                    $shipscanfly[$group][$shipfaction][$groupID][] = array('typeID'  => $typeID,
                                                                    'groupID'        => $groupID,
                                                                    'group'          => $group,
                                                                    'typeName'       => $typeName,
                                                                    'tag'			 => $tag,
                                                                    'graphicID'      => $graphicID,
                                                                    'graphicFile'    => $graphicFile,
                                                                    'factionID'      => $factionID,
                                                                    'factionName'    => $factions[$factionID],
                                                                    'requiredSkill1' => $required['requiredSkill1'],
                                                                    'requiredSkill2' => ((isset($required['requiredSkill2'])) ? $required['requiredSkill2'] : ''),
                                                                    'requiredSkill3' => ((isset($required['requiredSkill3'])) ? $required['requiredSkill3'] : ''));
                                                                    //ksort($typeName, SORT_REGULAR); 
                }
            }

            $result->Close();
        }
    }

    $eveRender->Assign('name',              $name);
    $eveRender->Assign('race',              $race);
    $eveRender->Assign('bloodLine',         $bloodLine);
    $eveRender->Assign('gender',            $gender);
    $eveRender->Assign('DoB',               $dob);
    $eveRender->Assign('securityStatus',    $secStatus);
    $eveRender->Assign('ancestry',          $ancestry);     
    $eveRender->Assign('corporationName',   $corporationName);
    $eveRender->Assign('corporationID',     $corporationID);
    $eveRender->Assign('allianceName',      $allianceName);
    $eveRender->Assign('allianceID',        $allianceID);    
    $eveRender->Assign('balance',           number_format($balance, 2, '.', ' '));
    $eveRender->Assign('freeSP',            $freeSP);
    $eveRender->Assign('memoryImp',         $memory);
    $eveRender->Assign('intelligenceImp',   $intelligence);
    $eveRender->Assign('willpowerImp',      $willpower);
    $eveRender->Assign('perceptionImp',     $perception);
    $eveRender->Assign('charismaImp',       $charisma);
    if($skillTraining['skillName'] != '') {
        $eveRender->Assign('Training',          $skillTraining['skillName']);
        $eveRender->Assign('ToLevel',           $skillTraining['trainingToLevel']);
        $eveRender->Assign('TrainingID',        $skillTraining['trainingTypeID']);
        $eveRender->Assign('trainingStartTime', $skillTraining['trainingStartTime']);
        $eveRender->Assign('trainingEndTime',   $skillTraining['trainingEndTime']);
        $eveRender->Assign('TrainingTimeLeft',  $skillTraining['TrainingTimeLeft']);
        $eveRender->Assign('trainingEndstamp',  strtotime($skillTraining['trainingEndTime']));
        $eveRender->Assign('trainingEndFormat', date("m/d/Y G:i:s", strtotime($skillTraining['trainingEndTime']." GMT")));
    }
    $time     = time();
    $filetime = strtotime($config['cachedUntil']);//filemtime($config['filename']);
    $left     = ($filetime + 3600) - $time;
    $diffDate = $left;
    $days     = floor($diffDate / 24 / 60 / 60 );
    $diffDate = $diffDate - ($days*24*60*60);
    $hours    = floor($diffDate / 60 / 60);
    $diffDate = ($diffDate - ($hours*60*60));
    $minutes  = floor($diffDate/60);
    $diffDate = $diffDate - ($minutes*60);
    $seconds  = floor($diffDate);
    $eveRender->Assign('cachetimeleft',     date("m/d/Y G:i:s", strtotime($config['cachedUntil']." GMT")));
    $eveRender->Assign('skilltree',         $assign['skilltree']);
    $eveRender->Assign('skillgroups',       $assign['skillgroups']);
    $eveRender->Assign('characterID',       $characterID);
    $eveRender->Assign('attributes',        $attributes);
    $eveRender->Assign('pageupdateminutes', $minutes);
    $eveRender->Assign('pageupdateseconds', $seconds);
    $eveRender->Assign('l5total',           $assign['l5total']);
    $eveRender->Assign('l5spsformat',       number_format($assign['l5sps'], 0, '', ' '));
    $eveRender->Assign('l5sps',             $assign['l5sps']);
    $eveRender->Assign('grptable',          $assign['grptable']);
    $eveRender->Assign('totalsks',          $assign['count']);
    $eveRender->Assign('totalsps',          $assign['skillpointstotal']);
    $eveRender->Assign('totalskillpoints',  $assign['totalskillpoints']);
    $eveRender->Assign('skillpointstotal',  number_format($assign['skillpointstotal'], 0, '', ','));
    $eveRender->Assign('shipscanfly',       $shipscanfly);
    $eveRender->Assign('SkillQueue',        $SkillQueue);
    // Version
    $eveRender->Assign('version',           _SKILLSHEET_VERSION);
    $eveRender->Assign('dVersion',          _DATA_VERSION);

    $eveRender->Display('shipskills.tpl');
    exit;
}
function siglist($config)
{

    global $skillsource, $eveRender;

    $training = GetTrainingData($config['training']);

    $parse = ParseXMLFile($config['data']);
    $info = ParseXMLFile($config['characterInfo']);

    $char = $parse['result'];
    $charInfo = $info['result'];

    $characterID     = $char['characterID'];

    $name            = $char['name'];
    $race            = $char['race'];
    $bloodLine       = $char['bloodLine'];
    $gender          = $char['gender'];
    $dob             = $char['DoB'];
    $secStatus 		 = $charInfo['securityStatus'];
    $ancestry        = $char['ancestry'];    
    $corporationName = $char['corporationName'];
    $corporationID   = $char['corporationID'];
    $allianceName    = $char['allianceName'];
    $allianceID      = $char['allianceID'];  
    $freeSP          = $char['freeSkillPoints'];
/*  $attEnhancers    = $char['attributeEnhancers'];
    if($attEnhancers != ''){
    $memory			 = $attEnhancers['memoryBonus']['augmentatorValue'];
    $intelligence	 = $attEnhancers['intelligenceBonus']['augmentatorValue'];
    $willpower		 = $attEnhancers['willpowerBonus']['augmentatorValue'];
    $perception		 = $attEnhancers['perceptionBonus']['augmentatorValue'];
    $charisma		 = $attEnhancers['charismaBonus']['augmentatorValue'];
    }*/
    $attributes      = array('intelligence' => $char['attributes']['intelligence'],
                             'charisma'     => $char['attributes']['charisma'],
                             'perception'   => $char['attributes']['perception'],
                             'memory'       => $char['attributes']['memory'],
                             'willpower'    => $char['attributes']['willpower']);

//    $implants = GetImplants($attEnhancers);

    $skillTraining   = $training;

    $skills          = $char['rowset'][3]['row'];

    $assign = BuildSkillSet($skills, $training);
    
    // APOCRYPHA Queue
    $SkillQueue   = GetQueueData($config['queue']);

    $skillsearch = $assign['skillsearch'];


    $eveRender->Assign('name',              $name);
    $eveRender->Assign('race',              $race);
    $eveRender->Assign('bloodLine',         $bloodLine);
    $eveRender->Assign('gender',            $gender);
    $eveRender->Assign('DoB',               $dob);
    $eveRender->Assign('securityStatus',    $secStatus);
    $eveRender->Assign('ancestry',          $ancestry);     
    $eveRender->Assign('corporationName',   $corporationName);
    $eveRender->Assign('corporationID',     $corporationID);
    $eveRender->Assign('allianceName',      $allianceName);
    $eveRender->Assign('allianceID',        $allianceID);    
    $eveRender->Assign('balance',           number_format($balance, 2, '.', ' '));
    $eveRender->Assign('freeSP',            $freeSP);
    $eveRender->Assign('memoryImp',         $memory);
    $eveRender->Assign('intelligenceImp',   $intelligence);
    $eveRender->Assign('willpowerImp',      $willpower);
    $eveRender->Assign('perceptionImp',     $perception);
    $eveRender->Assign('charismaImp',       $charisma);
    if($skillTraining['skillName'] != '') {
        $eveRender->Assign('Training',          $skillTraining['skillName']);
        $eveRender->Assign('ToLevel',           $skillTraining['trainingToLevel']);
        $eveRender->Assign('TrainingID',        $skillTraining['trainingTypeID']);
        $eveRender->Assign('trainingStartTime', $skillTraining['trainingStartTime']);
        $eveRender->Assign('trainingEndTime',   $skillTraining['trainingEndTime']);
        $eveRender->Assign('TrainingTimeLeft',  $skillTraining['TrainingTimeLeft']);
        $eveRender->Assign('trainingEndstamp',  strtotime($skillTraining['trainingEndTime']));
        $eveRender->Assign('trainingEndFormat', date("m/d/Y G:i:s", strtotime($skillTraining['trainingEndTime']." GMT")));
    }
    $time     = time();
    $filetime = strtotime($config['cachedUntil']);//filemtime($config['filename']);
    $left     = ($filetime + 3600) - $time;
    $diffDate = $left;
    $days     = floor($diffDate / 24 / 60 / 60 );
    $diffDate = $diffDate - ($days*24*60*60);
    $hours    = floor($diffDate / 60 / 60);
    $diffDate = ($diffDate - ($hours*60*60));
    $minutes  = floor($diffDate/60);
    $diffDate = $diffDate - ($minutes*60);
    $seconds  = floor($diffDate);
    $eveRender->Assign('cachetimeleft',     date("m/d/Y G:i:s", strtotime($config['cachedUntil']." GMT")));
    $eveRender->Assign('skilltree',         $assign['skilltree']);
    $eveRender->Assign('skillgroups',       $assign['skillgroups']);
    $eveRender->Assign('characterID',       $characterID);
    $eveRender->Assign('attributes',        $attributes);
    $eveRender->Assign('pageupdateminutes', $minutes);
    $eveRender->Assign('pageupdateseconds', $seconds);  
    $eveRender->Assign('l5total',           $assign['l5total']);
    $eveRender->Assign('l5spsformat',       number_format($assign['l5sps'], 0, '', ' '));
    $eveRender->Assign('l5sps',             $assign['l5sps']);
    $eveRender->Assign('grptable',          $assign['grptable']);
    $eveRender->Assign('totalsks',          $assign['count']);
    $eveRender->Assign('totalsps',          $assign['skillpointstotal']);
    $eveRender->Assign('totalskillpoints',  $assign['totalskillpoints']);
    $eveRender->Assign('skillpointstotal',  number_format($assign['skillpointstotal'], 0, '', ','));
    $eveRender->Assign('SkillQueue',        $SkillQueue);
    // Version
    $eveRender->Assign('version',           _SKILLSHEET_VERSION);
    $eveRender->Assign('dVersion',          _DATA_VERSION);

    $eveRender->Display('siglist.tpl');
    exit;

}

function chart($config)
{

    global $skillsource, $eveRender;

    $training = GetTrainingData($config['training']);

    $parse = ParseXMLFile($config['data']);
    $info = ParseXMLFile($config['characterInfo']);

    $char = $parse['result'];
    $charInfo = $info['result'];

    $characterID     = $char['characterID'];

    $name            = $char['name'];

    $skillTraining   = $training;

    $skills          = $char['rowset'][3]['row'];

    $assign = BuildSkillSet($skills, $training);

    $skillsearch = $assign['skillsearch'];


    $eveRender->Assign('name',              $name);
    $eveRender->Assign('grptable',          $assign['grptable']);

    $eveRender->Display('chart.tpl');
    exit;

}

function sig($config)
{

    global $skillsource, $eveRender;

    $training = GetTrainingData($config['training']);

    $parse = ParseXMLFile($config['data']);

    $char = $parse['result'];

    $name            = $char['name'];
    
    $skillTraining   = $training;

    $skills          = $char['rowset'][3]['row'];

    $assign = BuildSkillSet($skills, $training);
    
    if($skillTraining['skillName'] != '') {
        $eveRender->Assign('Training',          $skillTraining['skillName']);
        $eveRender->Assign('ToLevel',           $skillTraining['trainingToLevel']);
    }
    $eveRender->Assign('name',              $name);
    $eveRender->Assign('totalsks',          $assign['count']);
    $eveRender->Assign('totalsps',          $assign['skillpointstotal']);
    $eveRender->Assign('skillpointstotal',  number_format($assign['skillpointstotal'], 0, '', ','));
    
    $eveRender->Display('sig.tpl');
    exit;

}

function newsig($config)
{

    global $skillsource, $eveRender;

    $training = GetTrainingData($config['training']);

    $parse = ParseXMLFile($config['data']);

    $char = $parse['result'];

    $name            = $char['name'];
    $skillTraining   = $training;

    $skills          = $char['rowset'][3]['row'];

    $assign = BuildSkillSet($skills, $training);

    $skillsearch = $assign['skillsearch'];

    if($skillTraining['skillName'] != '') {
        $eveRender->Assign('Training',          $skillTraining['skillName']);
        $eveRender->Assign('ToLevel',           $skillTraining['trainingToLevel']);
        $eveRender->Assign('TrainingTimeLeft',  $skillTraining['TrainingTimeLeft']);
    }
    $eveRender->Assign('name',              $name);
    $eveRender->Assign('totalsks',          $assign['count']);
    $eveRender->Assign('totalsps',          $assign['skillpointstotal']);
    $eveRender->Assign('totalskillpoints',  $assign['totalskillpoints']);
    $eveRender->Assign('skillpointstotal',  number_format($assign['skillpointstotal'], 0, '', ','));
    
    $eveRender->Display('newsig.tpl');
    exit;

}

function sig2($config)
{

    global $skillsource, $eveRender;

    $training = GetTrainingData($config['training']);

    $parse = ParseXMLFile($config['data']);

    $char = $parse['result'];

    $name            = $char['name'];
    $skillTraining   = $training;    
    $corporationName = $char['corporationName'];
    $allianceName    = $char['allianceName'];

    $skills          = $char['rowset'][3]['row'];

    $assign = BuildSkillSet($skills, $training);

    $skillsearch = $assign['skillsearch'];

    if($skillTraining['skillName'] != '') {
        $eveRender->Assign('Training',          $skillTraining['skillName']);
        $eveRender->Assign('ToLevel',           $skillTraining['trainingToLevel']);
        $eveRender->Assign('TrainingTimeLeft',  $skillTraining['TrainingTimeLeft']);
    }
    $eveRender->Assign('name',              $name);
    $eveRender->Assign('totalsks',          $assign['count']);
    $eveRender->Assign('totalsps',          $assign['skillpointstotal']);
    $eveRender->Assign('totalskillpoints',  $assign['totalskillpoints']);     
    $eveRender->Assign('corporationName',   $corporationName);
    $eveRender->Assign('allianceName',      $allianceName);
    $eveRender->Assign('skillpointstotal',  number_format($assign['skillpointstotal'], 0, '', ','));
    
    $eveRender->Display('sig2.tpl');
    exit;

}

function Shipgroups()
{
    return array('25'   => 'Frigates',
                 '831'  => 'Interceptors',
                 '830'  => 'Covert Ops',
                 '834'  => 'Stealth Bombers',
                 '893'  => 'Electronic Attack Ships',
                 '324'  => 'Assault Ships',
                 '1527' => 'Logistics Frigates',
                 '1283' => 'Mining Frigates',
                 '420'  => 'Destroyers',
                 '541'  => 'Interdictors',
                 '1534' => 'Command Destroyers',
                 '1305' => 'Tactical Destroyers',
                 '26'   => 'Cruisers',
                 '358'  => 'Heavy Assault Ships',
                 '894'  => 'Heavy Interdictors',
                 '833'  => 'Recon Ships',
                 '832'  => 'Logistics Cruisers',
                 '963'  => 'Strategic Cruisers',
                 '419'  => 'Battlecruisers',
                 '540'  => 'Command Ships',
                 '27'   => 'Battleships',
                 '900'  => 'Marauders',
                 '898'  => 'Black Ops',
                 '463'  => 'Mining Barges',
                 '543'  => 'Exhumers',
                 '28'   => 'Industrials',
                 '380'  => 'Transport Ships',
                 '941'  => 'Industrial Command Ships',
                 '513'  => 'Freighters',
                 '902'  => 'Jump Freighters',
                 '485'  => 'Dreadnoughts',
                 '547'  => 'Carriers',
                 '659'  => 'Supercarriers',
                 '30'   => 'Titans');
}

// Getting the training stuff... and only the training stuff... rest is useless.
// We also create the time left info.
function GetTrainingData($trainfile = '')
{

    if (empty($trainfile)) {
	       
		global $eveRender;
		$eveRender->Display('errorheader.tpl');

  echo '<br /><br />
  <div id="content" class="mcenter" style="float:center;width:908px;margin-top:50px;" >
    <table summary="Characters List" style="border: #666666 1px solid; margin-left: 10px; width:910px;">
    <thead>
      <tr style="background: rgb(44, 44, 56);">
        <th colspan="<!--[$charcount]-->" class="dataTableHeader">No training information</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>No information about this character was retrieved last time the API was queried. <br /> This will likely resolve itself, alternatively you can check back in an hour to try again.<br />You can check the status of the API <a href="http://eve-offline.net/api/">here.</a><br /><a href="javascript:history.back()" title="Go back">Go Back</a></td>
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

    global $skillsource;

    $parse = ParseXMLFile($trainfile);

    foreach ($skillsource as $groups) {
        foreach($groups as $groupID => $group) {
            $skilltreeX[$group['typeID']] = $group;
        }
    }

    $id = $parse['result']['trainingTypeID'];

    $parse['result']['skillName'] = $skilltreeX[$id]['typeName'];

    $trainingleft = $parse['result']['trainingEndTime'];//substr($data[0], 9, 19);
    $ampm = substr($trainingleft, -2);

    // FIX FOR GMT
    $now       = time();
    $gmmktime  = gmmktime();
    $finaltime = $gmmktime - $now;

    $year   = (int)substr($trainingleft, 0, 4);
    $month  = (int)substr($trainingleft, 5, 2);
    $day    = (int)substr($trainingleft, 8, 2);
    $hour   = (int)substr($trainingleft, 11, 2);// + floor($finaltime / 60 / 60);// + (($finaltime > 0) ? floor($finaltime / 60 / 60) : 0); //2007-06-22 16:47:50
    $minute = (int)substr($trainingleft, 14, 2);
    $second = (int)substr($trainingleft, 17, 2);

    $difference = gmmktime($hour, $minute, $second, $month, $day, $year) - $now;
    if ($difference >= 1) {
        $days = floor($difference/86400);
        $difference = $difference - ($days*86400);
        $hours = floor($difference/3600);
        $difference = $difference - ($hours*3600);
        $minutes = floor($difference/60);
        $difference = $difference - ($minutes*60);
        $seconds = $difference;
        $output = "$days Days, $hours Hours, $minutes Minutes and $seconds Seconds.";
    } else {
        $output = "Done!";
    }
    $parse['result']['TrainingTimeLeft'] = $output;

    return $parse['result'];

}

function GetQueueData($queue = '')
{
    if (empty($queue)) {
        //echo 'Damn, no queue file';
        //exit;
        return false;
    }

    global $skillsource;
    reset($skillsource);

    $parse = ParseXMLFile($queue);

    // FIX FOR GMT
    $now       = time();
    $gmmktime  = gmmktime();
    $finaltime = $gmmktime - $now;

    $skills = $parse['result']['rowset']['row'];

    $queueX = array();

    foreach ($skillsource as $groups) {
        foreach($groups as $groupID => $group) {
            foreach ($skills as $skill) {
                if ($group['typeID'] == $skill['typeID']) {
                    $group = $skill + $group;             
                    $queueX[$skill['typeID']] = $group;
                    $trainingleft = date("m/d/Y G:i:s", strtotime($group['endTime']));//substr($data[0], 9, 19);
                    $ampm = substr($trainingleft, -2);

                    $year   = (int)substr($trainingleft, 0, 4);
                    $month  = (int)substr($trainingleft, 5, 2);
                    $day    = (int)substr($trainingleft, 8, 2);
                    $hour   = (int)substr($trainingleft, 11, 2);// + floor($finaltime / 60 / 60);// + (($finaltime > 0) ? floor($finaltime / 60 / 60) : 0); //2007-06-22 16:47:50
                    $minute = (int)substr($trainingleft, 14, 2);
                    $second = (int)substr($trainingleft, 17, 2);

                    $difference = $now - gmmktime($hour, $minute, $second, $month, $day, $year);// - $now;

                    $queueX[$skill['typeID']]['endTime'] == (($difference >= 1) ? $queueX[$skill['typeID']]['endTime'] : 'Done');

                    $sortAarr[] = $queueX[$skill['typeID']]['queuePosition'];
                //    $sortAarr[] = $queueX[$skill['level']]['endTime'];
                }

            }
        }
    }

    array_multisort($queueX, SORT_ASC);

    return $queueX;

}

// Removed implant calculations for the time being, was causing smarty errors because the parameter was missing, thanks again CCP.
function Attributes(&$attributes, $implants)
{

    // Intelligence
    $int = $attributes['intelligence'];
/*    if (isset($implants['intelligence'])) {
        $int += $implants['intelligence'];
    }*/

    $attributes['intelligence'] = $int;

    // Perception
    $per = $attributes['perception'];
/*    if (isset($implants['perception'])) {
        $per += $implants['perception'];
    }*/

    $attributes['perception'] = $per;

    // Charisma
    $cha = $attributes['charisma'];
/*    if (isset($implants['charisma'])) {
        $cha += $implants['charisma'];
    }*/

    $attributes['charisma'] = $cha;

    // Willpower
    $wil = $attributes['willpower'];
/*    if (isset($implants['willpower'])) {
        $wil += $implants['willpower'];
    }*/

    $attributes['willpower'] = $wil;

    // Memory
    $mem = $attributes['memory'];
/*    if (isset($implants['memory'])) {
        $mem += $implants['memory'];
    }*/

    $attributes['memory'] = $mem;

}

// Encode password function.
function EncodePassword($eve)
{

    $scriptname = substr($eve->ServerGetVar('SCRIPT_NAME'), 1);

    if ($eve->ServerGetVar('REQUEST_METHOD') == 'POST') {
        $password = $eve->VarCleanFromInput('password');

        if (!empty($password)) {
            echo "Now paste this exact gibberish in the configuration file: <strong>" . base64_encode($password) ."</strong><br /><br />\n";
            echo "And go to <a href=\"" . $scriptname . "\" title=\"Your crappy char sheet\">Your skill sheet</a>\n";
        } else {
            echo "Give a damn password to encode will ya... you paranoid ! Got podkilled recently or what ?? Now <a href=\"" . $scriptname . "?encode=password\" title=\"paranoid\">GO BACK</a>\n";
        }
    } else {
        $content  = "<form action=\"".$scriptname."?encode=password\" method=\"post\" enctype=\"application/x-www-form-urlencoded\">\n";
        $content .= "<div>\n";
        $content .= "  <label for=\"field_password\">Enter your password</lable>\n";
        $content .= "  <input type=\"text\" id=\"field_password\" name=\"password\" size=\"30\" />\n";
        $content .= "  <input type=\"submit\" value=\"Encode\" />\n";
        $content .= "</div>\n";
        $content .= "</form>\n";

        echo $content;
    }

}

// PHPDoc might come one day...
function GetRequiredSkills($typeid, $groupid, &$skillsearch)
{

    $dbconn =& DBGetConn(true);

    $sql = "SELECT *
            FROM   skillsheet_reqs
            WHERE  typeID = '".$typeid."'
            AND    groupID = '".$groupid."'
            ORDER BY field(attributeName, 'requiredSkill1')";


    $result = $dbconn->Execute($sql);

    if ($dbconn->ErrorNo() != 0) {
        echo $dbconn->ErrorMsg() . $sql; exit;
    }

    $skills = array();
    $required1 = array();
    $required2 = array();
    $required3 = array();
    for (; !$result->EOF; $result->MoveNext()) {

        $row = $result->GetRowAssoc(2);

        if ($row['attributeName'] == 'requiredSkill1') {
            $required['requiredSkill1']['faction']      = $row['factionName'];
            $required['requiredSkill1']['skillName']    = ((isset($row['SkillName'])) ? $row['SkillName'] : $row['SkillName2']);
            $required['requiredSkill1']['groupid']      = $row['groupID'];
            $required['requiredSkill1']['typeid']       = $row['typeID'];
        } else if ($row['attributeName'] == 'requiredSkill2') {
            $required['requiredSkill2']['faction']      = $row['factionName'];
            $required['requiredSkill2']['skillName']    = ((isset($row['SkillName'])) ? $row['SkillName'] : $row['SkillName2']);
            $required['requiredSkill2']['groupid']      = $row['groupID'];
            $required['requiredSkill2']['typeid']       = $row['typeID'];
        } else if ($row['attributeName'] == 'requiredSkill3') {
            $required['requiredSkill3']['faction']      = $row['factionName'];
            $required['requiredSkill3']['skillName']    = ((isset($row['SkillName'])) ? $row['SkillName'] : $row['SkillName2']);
            $required['requiredSkill3']['groupid']      = $row['groupID'];
            $required['requiredSkill3']['typeid']       = $row['typeID'];
        } else if ($row['attributeName'] == 'requiredSkill1Level') {
            $required['requiredSkill1']['level']        = ((isset($row['valueInt'])) ? $row['valueInt'] : $row['valueFloat']);
        } else if ($row['attributeName'] == 'requiredSkill2Level') {
            $required['requiredSkill2']['level']        = ((isset($row['valueInt'])) ? $row['valueInt'] : $row['valueFloat']);
        } else if ($row['attributeName'] == 'requiredSkill3Level') {
            $required['requiredSkill3']['level']        = ((isset($row['valueInt'])) ? $row['valueInt'] : $row['valueFloat']);
        }

        $skills[] = array('typeID'        => $row['typeID'],
                          'attributeName' => $row['attributeName'],
                          'valueInt'      => ((isset($row['valueInt'])) ? $row['valueInt'] : $row['valueFloat']),
                          'groupID'       => $row['groupID'],
                          'typeName'      => $row['typeName'],
                          'factionID'     => $row['factionID'],
                          'factionName'   => $row['factionName'],
                          'skillName'     => ((isset($row['SkillName'])) ? $row['SkillName'] : $row['SkillName2']));
    }

    foreach($required as $key => $value) {
        if (!isset($required[$key]['level'])) {
            $required[$key]['level'] = 1;
        }
        $skillname = $required[$key]['skillName'];

        if ($skillsearch["$skillname"]['level'] >= $required[$key]['level']) {
             $required[$key]['trained'] = 1;
        } else {
             $required[$key]['trained'] = 0;
        }

        if (isset($skillsearch[$required[$key]['skillName']])) {
            $skillsearch[$required[$key]['skillName']]['trained'] = 1;
        }
    }

    $result->Close();

    return $required;

}
function sort_array($array) {
    sort($array);
    return $array;   
}
?>