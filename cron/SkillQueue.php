<?php
/////////////////////////////////////////////////////////////////////////
/// Yay for Shio's pro hax skills. This script will get new data from ///
/// the API server, write it to a local file in the cache folder and ////
//// insert the new data into the MySQL server. This, with a correct ////
///////// setup nullifies the need for the cachedUntil timer. ///////////
/////////////////////////////////////////////////////////////////////////
/////// This script should be run as a cron job every 30 MINUTES ////////
//////////////// EXAMPLE: php /path/to/file/queue.php ///////////////////
/////////////////////////////////////////////////////////////////////////

// Include the config file for the database
include '../eveconfig/eveconfig.php';
$xmlpath = _XMLPATH;

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
extract($auth, EXTR_PREFIX_SKIP);

// Get skill queue
		$url = "https://api.eveonline.com/char/SkillQueue.xml.aspx?keyID=$keyID&vCode=$vCode&characterID=$characterID";

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_HEADER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
        curl_setopt($ch, CURLOPT_CAINFO, getcwd() . "../includes/eveapi.crt");

        $queue = curl_exec($ch);

        curl_close($ch);

// Take the output from the API server and write it to the cache folder (See below for why)
$file = 'SkillQueue';
$f = fopen("$xmlpath/$file/$characterID.$file.xml", "w");
fwrite($f, $queue);
fclose($f);

// Where the 'cached' XML file was saved to. MySQL needs the full path.
$path = "'$xmlpath/$file/$characterID.$file.xml'";

// Write the new information to the database from the file, this needs to come from a xml file rather than straight from php, for some reason o.O
MYSQL_QUERY("UPDATE skillsheet_apis SET queue=LOAD_FILE($path) WHERE characterID = '$characterID'");

++$i; 
} 
// Close the connection
MYSQL_CLOSE();
?>