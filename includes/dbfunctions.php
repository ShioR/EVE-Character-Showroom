<?php
/**********************************************************/
/*           EVE Character Showroom - Version 5           */
/*       'Improved' and maintained by Shionoya Risa       */
/*          Originally created by DeTox MinRohim          */
/*            Copyright (C) 2015 Shionoya Risa            */
/**********************************************************/
/* This program is free software: you can redistribute it */
/*   and/or modify it under the terms of the GNU General  */
/*     Public License as published by the Free Software   */
/*     Foundation, either version 3 of the License, or    */
/*           (at your option) any later version.          */
/*  This program is distributed in the hope that it will  */
/*  be useful, but WITHOUT ANY WARRANTY; without even the */
/*   implied warranty of MERCHANTABILITY or FITNESS FOR   */
/*                  A PARTICULAR PURPOSE.                 */
/*  See the GNU General Public License for more details.  */
/*         You should have received a copy of the         */
/*   GNU General Public License along with this program.  */
/*        If not, see http://www.gnu.org/licenses/        */
/**********************************************************/
/*   Lots of code snippets have been found in my travels  */
/*    if you think one of those snippets is yours, tell   */
/*         me. I will give all appropriate credits.       */
/**********************************************************/
/*  All EVE Online logos, images, trademarks and related  */
/* materials are copyright (C) CCP hf http://ccpgames.com */
/**********************************************************/

function EveDBInit()
{

    // force register_globals=off

    // force register_globals = off
    if(!defined('_PNINSTALLVER') && ini_get('register_globals')) {
        foreach($GLOBALS as $s_variable_name => $m_variable_value) {
            if (!in_array($s_variable_name, array('GLOBALS', 'argv', 'argc', '_FILES', '_COOKIE', '_POST', '_GET', '_SERVER', '_ENV', '_SESSION', '_REQUEST', 's_variable_name', 'm_variable_value'))) {
                unset($GLOBALS[$s_variable_name]);
            }
        }
        unset($GLOBALS['s_variable_name']);
        unset($GLOBALS['m_variable_value']);
    }

    // proper error_repoting
    // E_ALL for development
    // error_reporting(E_ALL);
    // without warnings and notices for release
    error_reporting(E_ALL & ~E_NOTICE & ~E_WARNING & ~E_STRICT);

    // Hack for some weird PHP systems that should have the
    // LC_* constants defined, but don't
    if (!defined('LC_TIME')) {
        define('LC_TIME', 'LC_TIME');
    }

    // Initialise and load configuration
    $dbconfig = array();
    $dbdebug  = array();
    include 'config.php';
    $GLOBALS['dbconfig'] = $dbconfig;
    $GLOBALS['dbdebug']  = $dbdebug;
//echo '<pre>';print_r($GLOBALS);echo '</pre>';exit;

    // Connect to database
    if (!DBInit()) {
        die('Database initialisation failed');
    }

    if (!defined('TBL_PREFIX')) {
        define('TBL_PREFIX', DBGetPrefix());
    }

    return true;

}

/**
* Initialise DB connection
* @return bool true if successful, false otherwise
*/
function DBInit()
{

    // load ADODB
    ADODBInit();

    // Get database parameters
    $dbtype   = $GLOBALS['dbconfig']['dbtype'];
    $dbhost   = $GLOBALS['dbconfig']['dbhost'];
    $dbname   = $GLOBALS['dbconfig']['dbname'];
    $dbuname  = $GLOBALS['dbconfig']['dbuname'];
    $dbpass   = $GLOBALS['dbconfig']['dbpass'];
    $pconnect = $GLOBALS['dbconfig']['pconnect'];

    // Start connection
    $GLOBALS['evedbconn'] =& ADONewConnection($dbtype);
    if ($pconnect) {
        $dbh = $GLOBALS['evedbconn']->PConnect($dbhost, $dbuname, $dbpass, $dbname);
    } else {
        // itevo: /Go; it's more safe to use NConnect instead of Connect because of the following:
        // If you create two connections, but both use the same userid and password, PHP will share the same connection.
        // This can cause problems if the connections are meant to different databases.
        // The solution is to always use different userid's for different databases, or use NConnect().
        // NConnect: Always force a new connection. In contrast, PHP sometimes reuses connections when you use Connect() or PConnect().
        // Currently works only on mysql (PHP 4.3.0 or later), postgresql and oci8-derived drivers.
        // For other drivers, NConnect() works like Connect().
        $dbh = $GLOBALS['evedbconn']->NConnect($dbhost, $dbuname, $dbpass, $dbname);

        // /itevo
    }
    if (!$dbh) {
        $_SESSION['errormsg'] = 'Database connection failed';
        return false;
        //die('Database connection failed');
    }
    $GLOBALS['evedbconn']->debug = (($GLOBALS['dbdebug']['debug_sql'] == 1) ? true:false);// sql debugging
    global $ADODB_FETCH_MODE;
    $ADODB_FETCH_MODE = ADODB_FETCH_NUM;

    // force oracle to a consistent date format for comparison methods later on
    if (strcmp($dbtype, 'oci8') == 0) {
        $GLOBALS['evedbconn']->Execute("alter session set NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS'");
    }

    return true;
}

function DBGetPrefix()
{

    return $GLOBALS['dbconfig']['prefix'];

}

function &DBGetConn($pass_by_reference = null)
{
    // If the function was called with pass_by_reference set to true
    // return a reference to the dbconn object
    if ($pass_by_reference == true) {
        return $GLOBALS['evedbconn'];
    } else {
        return array($GLOBALS['evedbconn']);
    }
}

function ADODBInit()
{


    // ADODB configuration
    global $ADODB_CACHE_DIR;
    $ADODB_CACHE_DIR = realpath('includes/adodb');
    if (!defined('ADODB_DIR')) {
        define('ADODB_DIR', 'includes/adodb');
    }
    include 'includes/adodb/adodb.inc.php';

    // ADODB Error handle
    if ($GLOBALS['dbdebug']['debug_sql']) {
        include 'includes/classes/adodb/adodb-errorhandler.inc.php';
    }

    // Decode encoded DB parameters
    if ($GLOBALS['dbconfig']['encoded']) {
        $GLOBALS['dbconfig']['dbuname'] = base64_decode($GLOBALS['dbconfig']['dbuname']);
        $GLOBALS['dbconfig']['dbpass'] = base64_decode($GLOBALS['dbconfig']['dbpass']);
        $GLOBALS['dbconfig']['encoded'] = 0;
    }

    // debugger if required
    if ($GLOBALS['dbdebug']['debug']) {
        include_once 'includes/classes/lensdebug/lensdebug.class.php';
        $GLOBALS['dbg'] = new LensDebug();
        $GLOBALS['debug_sqlcalls'] = 0;
    }

    // initialise time to render
    /*
    if ($GLOBALS['dbdebug']['pagerendertime']) {
        $mtime = explode(" ", microtime());
        $GLOBALS['dbg_starttime'] = $mtime[1] + $mtime[0];
    }*/
}

?>
