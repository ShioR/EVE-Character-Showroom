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

function smarty_function_getstatusmsg()
{
    global $eve;
    // Get the last message
    $statusmsg = $eve->GetStatusMsg();
    
// NO POLL
    return ((empty($statusmsg)) ? 'The EVE Online API has produced an error, the error message is: <strong>'.$xml['error']. '</strong> - Next Update: '.$errortime.' <br />You can check the status of the API <a href="http://eve-offline.net/api/">here.</a><br /><a href="skillsheet.php?show=list" title="Go back to list">Go Back</a>' : '<div class="statusmsg">'.$statusmsg.'</div>');

// POLL 
    return ((empty($statusmsg)) ? '' : '<div class="statusmsg">'.$statusmsg.'</div>');

}
//<strong>Attention</strong> users with inactive EVE accounts, your character is still here, but the API does not work for inactive accounts.<br />If you would like your character back on the main page if you re-subscribe, EVE Mail Shio. Thanks!

?>