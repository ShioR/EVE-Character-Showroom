<?php


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