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

function smarty_function_getskillcost($params, &$smarty)
{
    global $eve;
    include 'eveconfig/eveconfig.php';
    mysql_connect($dbconfig['dbhost'], $dbconfig['dbuname'], $dbconfig['dbpass']);
   	mysql_select_db($dbconfig['dbname']);
		// Get the skill.typeID var from smarty
				$typeID = $params['typeID'];
		// get the description using the typeID // Base price too, for teh epeens!
				$basePrice = mysql_query("SELECT basePrice FROM data_invTypes WHERE typeID = '$typeID'"); 
		// Wordwrap to stop the page getting borked
				$cost = mysql_result($basePrice, 0);
				echo "Cost: ", number_format($cost), " ISK";
   	mysql_close();
		// Fini!
}
?>