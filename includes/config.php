<?php
/**********************************************************/
/*           EVE Character Showroom - Version 6           */
/*       'Improved' and maintained by Shionoya Risa       */
/*          Originally created by DeTox MinRohim          */
/*            Copyright (C) 2016 Shionoya Risa            */
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

define('_INSTALLED', false);
define('_SHORTURLS', true);
define('_SHEETADMIN', '');
// Make sure you include 'http://' and the trailing slash '/' or signatures WILL NOT work.
define('_DOMAIN', '');
// No trailing slash!
define('_XMLPATH', '../cache/xml');

// Path for templates and xml files - MAKE THAT NON-BROWSABLE !
$eve_filepath = '../cache/templates'; // Remember to chmod it 777

// Done... no need to touch anything else. (Unless you know what you are doing)
///////////////////////////////////////////////////////////

global $evedebug;
$evedebug['debug']          = 0;
$evedebug['debug_sql']      = 0;
$evedebug['pagerendertime'] = 0;

$default = '';
$eveconnect = false;
$eveconfig['default']    = $default;
$eveconfig['filepath']   = $eve_filepath;
$eveconfig['eveconnect'] = $eveconnect;
?>