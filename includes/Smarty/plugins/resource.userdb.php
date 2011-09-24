<?php 
/**
 * Smarty plugin
 * @package Smarty
 * @subpackage plugins
 */

/** 
* Smarty plugin 
* ------------------------------------------------------------- 
* Type:     resource 
* Name:     userdb 
* Purpose:  read user maintained source as a template 
*           $tpl_name is parsed as a uri type of string where 
*          the path to the template field is encoded as: 
* 
* table/source_field?field=condtional&field=conditional... 
* 
* results in: 
*    SELECT source_field FROM table WHERE conditions... 
* ------------------------------------------------------------- 
*/ 
function smarty_resource_userdb_fetch($tpl_name, &$tpl_source, &$smarty, $default=false) 
{ 
	$_url = parse_url($tpl_name); 
	
	// (required) expected syntax: table/source_field 
	$_path_items = explode('/', $_url['path']); 
	$table = $_path_items[0]; 
	$source = $_path_items[1]; 

	// Theme Configuration
	$skinid = pnModAPIFunc('Xanthia','user','getSkinID',
								array('skin' => $table));

	$dbconn =& pnDBGetConn(true);
	$pntable =& pnDBGetTables();

	$table = $pntable['theme_tplsource'];
	$column = &$pntable['theme_tplsource_column'];
	$query = "SELECT $column[tpl_source]
					FROM $table
					WHERE $column[tpl_file_name]='$source'
					AND $column[tpl_skin_id]= '$skinid' LIMIT 1";
	$result =& $dbconn->Execute($query);        

	if ($result->EOF) {
	} else {
		list($tpl_source) = $result->fields;
	}
	$result->MoveNext();
	$result->Close();
	if ($tpl_source) { 
		return true; 
	} else { 
		return $default; 
	} 
} 

function smarty_resource_userdb_source($tpl_name, &$tpl_source, &$smarty) 
{ 
	if (smarty_resource_userdb_fetch($tpl_name, $tpl_source, $smarty)) { 
		$tpl_source = stripslashes($tpl_source); 
		return true; 
	}  
	return false; 
}  

/** 
* 
* ------------------------------------------------------------- 
* pass current time back to smarty.
* no need to make sql query since template will be updated in the database
* and local compiled template will be deleted automatically
* forcing smarty to reload template again form database 
* ------------------------------------------------------------- 
*/ 
function smarty_resource_userdb_timestamp($tpl_name, &$tpl_timestamp, &$smarty) 
{ 
/*
	$_url = parse_url($tpl_name); 
	
	// (required) expected syntax: table/source_field 
	$_path_items = explode('/', $_url['path']); 
	$table = $_path_items[0]; 
	$source = $_path_items[1]; 

	// Theme Configuration
	$skinid = pnModAPIFunc('Xanthia','user','getSkinID',
								array('skin' => $table));

	$dbconn =& pnDBGetConn(true);
	$pntable =& pnDBGetTables();
	$table = $pntable['theme_tplsource'];
	$column = &$pntable['theme_tplsource_column'];

	$query = "SELECT $column[tpl_timestamp]
					FROM $table
					WHERE $column[tpl_file_name]='$source'
					AND $column[tpl_skin_id]= '$skinid' LIMIT 1";
	$result =& $dbconn->Execute($query);        
	if ($result->EOF) {
	} else {
		list($tpl_timestamp) = $result->fields;
	}
	$result->MoveNext();
	$result->Close();

    if ($tpl_timestamp) {
        return true; 
    } else {
        return false;
    } 
}
*/

	$default=microtime(); 
	return $default;
}

function smarty_resource_userdb_secure($tpl_name, &$smarty) 
{ 
	return true; 
}  
function smarty_resource_userdb_trusted($tpl_name, &$smarty) 
{ 
	return true; 
}  

?> 