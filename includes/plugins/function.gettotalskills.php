<?php
function smarty_function_gettotalskills($params, &$smarty)
{
    global $eve;
    include 'eveconfig/eveconfig.php';
    mysql_connect($dbconfig['dbhost'], $dbconfig['dbuname'], $dbconfig['dbpass']);
   	mysql_select_db($dbconfig['dbname']);
		// Get the total using the published flag
				$result = mysql_query("SELECT published FROM skillsheet_skills WHERE published = '1'"); 
		// Count rows & assume it's correct...
				$total = mysql_num_rows($result);
                echo $total;
   	mysql_close();
		// Fini!
}
?>