<?php
function smarty_function_getskillinfo($params, &$smarty)
{
    global $eve;
    include(dirname(__FILE__).'/../config.php');        
    // Connect to db using credentials from the config file
            $connect = mysqli_connect($dbconfig['dbhost'], $dbconfig['dbuname'], $dbconfig['dbpass'], $dbconfig['dbname']);
		// Get the skill.typeID var from smarty
            $typeID = $params['typeID'];
        // Get the description from the database
            $query = "SELECT description FROM skillsheet_skills WHERE typeID = '$typeID'";
            $result = mysqli_query($connect, $query);
            $output = mysqli_fetch_row($result);
            $description = wordwrap($output[0], 112, "<br />");
        // Strip the <b> tag from the description
            $description = str_replace(array('<b>'), '', $description);
            echo nl2br($description);
        // Extra line break at the end to put the skill cost onto a new line
            echo "<br />";
        // Free result & close connection
            mysqli_free_result($result);
            mysqli_close($connect);
}
?>