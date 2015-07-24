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

// Includes
include "../includes/config.php";
include "../includes/plugins/function.getsigportrait.php";

$name = stripslashes($_GET['n']);       // Grab this from the query string
$nafn = str_replace('_', ' ', $name);   // MySQL friendly name (replaces any underscores with a space)
$nafn = str_replace("'", "\'", $nafn);  // MySQL friendly name (escapes apostrophes)
$domain = _DOMAIN;                      // Not needed, but easier to remember if I do it like this
$sigName = 'caldari';                  // Used for for loading the bg image

// Set the content-type with header
header('Content-type: image/jpeg');

// Create the image from the bg
$im = imagecreatefromjpeg('bg/'.$sigName.'.jpg');

// Specify some colors
$white = imagecolorallocate($im, 255, 255, 255);
$darkgrey = imagecolorallocatealpha($im, 40, 40, 40, 50);

// The signature text URL
$text = file_get_contents($domain.$name.'/newsig'); 
// Location of the font to use
$font = 'din1451e.ttf';

// Shadow & the text 
imagettftext($im, 10.5, 0, 77, 20, $darkgrey, $font, $text);
imagettftext($im, 10.5, 0, 75, 18, $white, $font, $text);

// Fetch the characterID from the database
    // Connect to DB using mysqli
        $db = mysqli_connect($dbconfig['dbhost'], $dbconfig['dbuname'], $dbconfig['dbpass'], $dbconfig['dbname']);
        $query = "SELECT characterID FROM skillsheet_apis WHERE name = '$nafn'";
        $result = mysqli_query($db, $query);
        $out = mysqli_fetch_row($result);
        $id = $out[0];
    // Free result & close connection
        mysqli_free_result($result);
   	    mysqli_close($db);

// Fetch portrait & add it to the image
$portrait = imagecreatefromjpeg(getportrait($id));
imagecopyresampled($im, $portrait, 6, 8, 0, 0, 64, 64, 64, 64);

// Use imagejpeg() to create the image with 95% quality
imagejpeg($im, NULL, 95);
imagedestroy($im);
?>