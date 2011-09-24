<?php
/**
 * $Id$
 * Smarty plugin
 * @package Skillsheet
 * @subpackage plugins
 */

function smarty_function_charlist($params, &$smarty)
{

    global $eve, $eveconfig;

    $characters = GetAllCharacters();

    //foreach($eveconfig as $char) {
    foreach($characters as $char) {
        if (isset($char['characterID']) && is_numeric($char['characterID']) && strlen($char['characterID']) >= 8 && $char['excluded'] == false) {
            $chars[] = array('charid'   => $char['characterID'],
                             'charname' => $char['name']);
        }
    }

    $charlist['count'] = count($chars);
    $charlist['chars'] = $chars;

    if (empty($params['assign'])) {
        $smarty->assign('charlist', $charlist);
    } else {
        $smarty->assign($params['assign'], $charlist);
    }

}

?>