<?php
function smarty_function_getskillinfo2($params, &$smarty)
{
    global $eve;
    include(dirname(__FILE__).'/../config.php');
    mysql_connect($dbconfig['dbhost'], $dbconfig['dbuname'], $dbconfig['dbpass']);
   	mysql_select_db($dbconfig['dbname']);
		// Get the skill.typeID var from smarty
				$typeID = $params['typeID'];
		// get the description using the typeID // Base price too, for teh epeens!
				$result = mysql_query("SELECT description FROM skillsheet_skills WHERE typeID = '$typeID'");
		// Wordwrap to stop the page getting borked
				$text = mysql_result($result, 0);
				$description = wordwrap($text, 108, "<br>&nbsp;&nbsp;");  
				echo nl2br($description);
   	mysql_close();
		// Fini!
}
?>