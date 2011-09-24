<?php
<<<<<<< HEAD
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
=======
/**
 * $Id$
 * Smarty plugin
 * @package Skillsheet
 * @subpackage plugins
 */
>>>>>>> 0bf1007212ce2569de2b9c9811fa4d091ecbf85c

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