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