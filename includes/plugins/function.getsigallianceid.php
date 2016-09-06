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

// Yes, I know this actually pulls all sizes, but the benefit outweighs the cost imo.
function getalliance($allianceID)
{
    global $allianceID, $domain;
    $path = '../cache/alliances/';
    if (!file_exists($path.$allianceID.'_128.png')) {

      $distantImg = 'https://imageserver.eveonline.com/Corporation/'.$allianceID.'_128.png';

        $local    = $path.$allianceID;
        $localimage = $path.$allianceID.'_128.png';

        $fp=fopen($distantImg,'rb');

        while (!feof($fp)) {
            $file = $file . fread($fp, 1024*8);
        }
        fclose($fp);
        $fp=fopen($localimage,'w');
        fwrite($fp,$file);
        fclose($fp);

        $img = imagecreatefrompng($localimage);
        if ($img) {
            $newimg = imagecreatetruecolor(32, 32);
            imagecopyresampled($newimg, $img, 0, 0, 0, 0, 32, 32, 128, 128);
            imagepng($newimg, $local.'_32.png', 90);
            $newimg = imagecreatetruecolor(64, 64);
            imagecopyresampled($newimg, $img, 0, 0, 0, 0, 64, 64, 128, 128);
            imagepng($newimg, $local.'_64.png', 95);
            $newimg = imagecreatetruecolor(128, 128);
            imagecopyresampled($newimg, $img, 0, 0, 0, 0, 128, 128, 128, 128);
            imagepng($newimg, $local.'_128.png', 100);
        }
    }

        return '../cache/alliances/'.$allianceID.'_128.png';
     
    }
?>