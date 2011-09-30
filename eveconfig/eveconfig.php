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

$dbconfig['dbtype'] = 'mysqli';
$dbconfig['dbtabletype'] = 'MyISAM';
$dbconfig['dbhost'] = '';
$dbconfig['dbuname'] = '';
$dbconfig['dbpass'] = '';
$dbconfig['dbname'] = '';


$dbconfig['system']      = '0';
$dbconfig['prefix']      = '';
$dbconfig['encoded'] 	 = '0';
$dbconfig['pconnect']	 = '0';
$dbconfig['temp']        = 'cache';

global $evedebug;
$evedebug['debug']          = 0;
$evedebug['debug_sql']      = 0;
$evedebug['pagerendertime'] = 0;

define('_INSTALLED', false);
define('_SHORTURLS', true);
// With trailing slash!
define('_DOMAIN', '');
// No trailing slash! Please edit this to the FULL path of the xml folder
define('_XMLPATH', '/home/example/public_html/cache/xml');

// Path to image caches
$eve_filepath = 'cache/templates'; // Remember to chmod it 777

// Done... no need to touch anything else. (Unless you know what you are doing)
///////////////////////////////////////////////////////////

$eveconfig['default']    = $default;
$eveconfig['filepath']   = $eve_filepath;
$eveconfig['eveconnect'] = $eveconnect;
?>