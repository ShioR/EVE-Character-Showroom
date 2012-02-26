<?php
function smarty_function_getskillinfo($params, &$smarty)
{
    global $eve;
    include 'eveconfig/eveconfig.php';
    mysql_connect($dbconfig['dbhost'], $dbconfig['dbuname'], $dbconfig['dbpass']);
   	mysql_select_db($dbconfig['dbname']);
		// Get the skill.typeID var from smarty
				$typeID = $params['typeID'];
		// get the description using the typeID // Base price too, for teh epeens!
				$result = mysql_query("SELECT description FROM data_invTypes WHERE typeID = '$typeID'");
		// Wordwrap to stop the page getting borked
				$text = mysql_result($result, 0);
				$description = wordwrap($text, 120, "<br />\n");
				echo $description, "<br />\n";
   	mysql_close();
		// Fini!
}
?>