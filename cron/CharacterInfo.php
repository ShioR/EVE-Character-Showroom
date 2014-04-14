<?php
/////////////////////////////////////////////////////////////////////////
/// Yay for Shio's pro hax skills. This script will get new data from ///
//////////// the API server, load it into simplexml and /////////////////
//// insert the new data into the MySQL server. This, with a correct ////
///////// setup nullifies the need for the cachedUntil timer. ///////////
/////////////////////////////////////////////////////////////////////////
///////// This script should be run as a cron job every 1 HOUR //////////
////////////// EXAMPLE: php /path/to/file/CharacterInfo.php /////////////
/////////////////////////////////////////////////////////////////////////

// Include the config file for the database so you can connect
include '../eveconfig/eveconfig.php';

// Connect to the server and select the database
MYSQL_CONNECT($dbconfig['dbhost'], $dbconfig['dbuname'], $dbconfig['dbpass']);
MYSQL_SELECT_DB($dbconfig['dbname']);

// Queries for name, vCode, keyID and CharacterID
$navn = MYSQL_QUERY("SELECT skillsheet_apis.name FROM skillsheet_apis ORDER by id"); 
$api = MYSQL_QUERY("SELECT skillsheet_apis.vCode FROM skillsheet_apis ORDER by id"); 
$user = MYSQL_QUERY("SELECT skillsheet_apis.keyID FROM skillsheet_apis ORDER by id"); 
$charID = MYSQL_QUERY("SELECT skillsheet_apis.characterID FROM skillsheet_apis ORDER by id"); 
$num=MYSQL_NUMROWS($navn); 

// Get the results as arrays ready for merging.
$i=0; 
while ($i < $num) { 
$nafn=MYSQL_FETCH_ARRAY($navn, MYSQL_ASSOC); 
$vCode=MYSQL_FETCH_ARRAY($api, MYSQL_ASSOC); 
$keyID=MYSQL_FETCH_ARRAY($user, MYSQL_ASSOC); 
$characterid=MYSQL_FETCH_ARRAY($charID, MYSQL_ASSOC); 

// Merge the above arrays and extract the keys
$auth = array_merge($nafn, $keyID, $vCode, $characterid);
extract($auth);

// Get CharacterInfo from API Server and do some xml stuff that for some reason seems to work...
		$url = "https://api.eveonline.com/eve/CharacterInfo.xml.aspx?characterID=$characterID&keyID=$keyID&vCode=$vCode";

      $xml = simplexml_load_file($url);
			header('Content-Type: text/xml'); 
			$dbxml = $xml->asXML(); 

// Write the new information to the database
MYSQL_QUERY("UPDATE skillsheet_apis SET characterInfo = '$dbxml' WHERE characterID = '$characterID'");

// Keep running so that all characters are updated
$i++;
} 
// Close the connection
MYSQL_CLOSE();
?>