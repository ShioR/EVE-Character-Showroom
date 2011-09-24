<?php
/**
 * $Id$
 * Smarty plugin
 * @package Skillsheet
 * @subpackage plugins
 */

function smarty_function_corplist($params, &$smarty)
{

    global $eve, $eveconfig;

    $characters = GetAllCharacters();

    //foreach($eveconfig as $char) {
    foreach($characters as $char) {
        if (isset($char['corporationName']) && is_numeric($char['corporationName']) && strlen($char['corporationName']) >= 8 && $char['excluded'] == false) {
            $chars[] = array('corpid'   => $char['corporationID'],
                             'corpname' => $char['corporationName']);
        }
    }

    $corplist['count'] = count($chars);
    $corplist['corps'] = $corps;

    if (empty($params['assign'])) {
        $smarty->assign('corplist', $corpist);
    } else {
        $smarty->assign($params['assign'], $corplist);
    }

}

?>