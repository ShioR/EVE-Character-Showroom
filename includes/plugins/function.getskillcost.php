<?php
function smarty_function_getskillcost($params, &$smarty)
{
    global $eve;
    include 'eveconfig/eveconfig.php';
    mysql_connect($dbconfig['dbhost'], $dbconfig['dbuname'], $dbconfig['dbpass']);
   	mysql_select_db($dbconfig['dbname']);
		// get the description using the typeID // Base price too, for teh epeens!
				$basePrice = mysql_query("SELECT basePrice FROM skillsheet_skills WHERE typeID = '$typeID'"); 
		// Display the output in a nicely formatted way
				$cost = mysql_result($basePrice, 0);
				echo "Cost: ", number_format($cost), " ISK";
   	mysql_close();
		// Fini!
}
?>