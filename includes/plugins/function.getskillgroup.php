<?php
function smarty_function_getskillgroup($params, &$smarty)
{
    global $eve;
    include 'eveconfig/eveconfig.php';
    mysql_connect($dbconfig['dbhost'], $dbconfig['dbuname'], $dbconfig['dbpass']);
   	mysql_select_db($dbconfig['dbname']);
		// Get the skill.groupID var from smarty
				$groupID = $params['groupID'];
		// Get the total using the groupID
				$result = mysql_query("SELECT groupID FROM skillsheet_skills WHERE groupID = '$groupID'"); 
		// Count rows & assume it's correct...
				$total = mysql_num_rows($result);
                echo $total;
   	mysql_close();
		// Fini!
}
?>