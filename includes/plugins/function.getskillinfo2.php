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

function smarty_function_getskillinfo2($params, &$smarty)
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
        // Strip line breaks and bold from the description
            $strip = str_replace(array('\r','\n', '<br>', '<br />', '<b>', '<BR>'), '', $output[0]);
            echo wordwrap($strip, 106, '<br /><span style="margin-left:7px;">');
        // Free result & close connection
            mysqli_free_result($result);
            mysqli_close($connect);
}
?>