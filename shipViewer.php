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
?>
<?php
// Get the name, make sure first character of each part uppercase
$name = ($_GET['id']);
$typeName = ucwords(strtolower($name));
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
        <title><?php echo $typeName;?> | Ship Viewer</title>
          
<?php
  // Include config to get db info
    include 'includes/config.php';
    
      // Connect to db using credentials from the config file
      mysql_connect($dbconfig['dbhost'], $dbconfig['dbuname'], $dbconfig['dbpass']);
      mysql_select_db($dbconfig['dbname']);
      
       // Get the graphicID from the URL
            $typeName = ($_GET['id']);
            
       // Get the graphicFile from the db
				$name = mysql_query("SELECT graphicFile FROM skillsheet_ships WHERE typeName = '$typeName'");
				$path = mysql_result($name, 0);
		 // Get the raceID from the db & close the connection
				$raceID = mysql_query("SELECT raceID FROM skillsheet_ships WHERE typeName = '$typeName'");
				$race = mysql_result($raceID, 0);
   	mysql_close();
?>
<?php
  // Get racial specific backgrounds
    if ($race == '1') {
        $nebula = 'res:/dx9/scene/universe/c03_cube.red';
    } elseif ($race == '2') {    
        $nebula = 'res:/dx9/scene/universe/m01_cube.red';
    } elseif ($race == '4') {
        $nebula = 'res:/dx9/scene/universe/a04_cube.red';
    } elseif ($race == '8') {    
        $nebula = 'res:/dx9/scene/universe/g04_cube.red';
    } elseif ($race == '32') {
        $nebula = 'res:/dx9/scene/universe/g04_cube.red';  
    } elseif ($race == '64') {
        $nebula = 'res:/dx9/scene/universe/g04_cube.red';
    } else {
        $nebula = 'res:/dx9/scene/universe/c10_cube.red';
    }   

?>   
        <script type="text/javascript" src="/includes/ccpwgl/src/external/glMatrix-0.9.5.min.js"></script>
        <script type="text/javascript" src="/includes/ccpwgl/src/ccpwgl_int.js"></script>
        <script type="text/javascript" src="/includes/ccpwgl/src/test/TestCamera2.js"></script>
        <script type="text/javascript" src="/includes/ccpwgl/src/ccpwgl.js"></script>
        <script type="text/javascript">

            function onDocumentLoad()
            {
              //  ccpwgl.setResourcePath('res', 'https://web.ccpgamescdn.com/ccpwgl/res/');


                var canvas = document.getElementById('mainCanvas');
                ccpwgl.initialize(canvas);
                
                    // Nebula
                var scene = ccpwgl.loadScene('<?php echo $nebula; ?>');

        		var camera = new TestCamera(canvas);
                    camera.minDistance = 10;
                    camera.maxDistance = 20000;
                    camera.fov = 30;
                    camera.distance = 3500;
                    camera.rotationX = -0.5;
                    camera.rotationY = 0.2;
                    camera.nearPlane = 1;
                    camera.farPlane = 10000000;
                    camera.minPitch = -0.5;
                    camera.maxPitch = 0.65;
                    ccpwgl.setCamera(camera);

                    // Load the data for the ship
                scene.loadShip('<?php echo $path; ?>', undefined);
                
                // Bloom Setting
                ccpwgl.enablePostprocessing(true);

        		ccpwgl.onPreRender = function () 
        		{ 
        		
        		
        		};
        		

            }
        	
            onload = onDocumentLoad;

        </script>

    </head>
    <body style="margin:0">
          <canvas id="mainCanvas" style="position:fixed;width:100%;height:100%"></canvas>
    </body>
</html>