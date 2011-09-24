<?php
/**
 * $Id$
 * Smarty plugin
 * @package Skillsheet
 * @subpackage plugins
 */

function smarty_function_topsps($params, &$smarty)
{

    global $eve;

    $chars = GetAllCharacters(true);

    $x     = 0;
    $limit = 10;

    foreach ($chars as $charid => $char) {
        $xml = ParseXMLFile($char['data']);
        $data = BuildSkillSet($xml['result']['rowset'][0]['row'], null);
        $totalsps[$charid]['name']             = $xml['result']['name'];
        $totalsps[$charid]['characterID']      = $charid;
        $totalsps[$charid]['skillpointstotal'] = $data['skillpointstotal'];
        $totaldrones[$charid]['name']             = $xml['result']['name'];
        $totaldrones[$charid]['characterID']      = $charid;
        $totaldrones[$charid]['lvl5sps'] = $data['lvl5sps'];                   
        $sortAarr[] = $data['skillpointstotal'];
    }

    //arsort($totalsps);
    array_multisort($sortAarr, SORT_DESC, $totalsps);

    $final = array();
    foreach ($totalsps as $ts) {
        if ($x >= $limit) {
            break;
        }
        $final[] = $ts;
        $x++;
    }

    if (empty($params['assign'])) {
        $smarty->assign('totalsps', $final);
    } else {
        $smarty->assign($params['assign'], $final);
    }

}

?>