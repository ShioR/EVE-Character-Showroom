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
            $connect = mysqli_connect($dbconfig['dbhost'], $dbconfig['dbuname'], $dbconfig['dbpass'], $dbconfig['dbname']);
        // Get the graphicFile and factionID from the db
            $query = "SELECT graphicFile, factionID FROM skillsheet_ships WHERE typeName = '$typeName'";
            $result = mysqli_query($connect, $query);
            $output = mysqli_fetch_row($result);
            $graphicFile = $output[0];
            $faction = $output[1];
        // Free result & close connection
            mysqli_free_result($result);
            mysqli_close($connect);

  // Set racial specific backgrounds
        // Calamari - The Forge
    if ($faction == '500001') {
        $nebula = 'res:/dx9/scene/universe/c02_cube.red';
        // Slaves - Heimatar
    } elseif ($faction == '500002') {    
        $nebula = 'res:/dx9/scene/universe/m02_cube.red';
        // Amarr victor! - Domain
    } elseif ($faction == '500003') {
        $nebula = 'res:/dx9/scene/universe/a03_cube.red';
        // Galscrubte - Everyshore
    } elseif ($faction == '500004') {    
        $nebula = 'res:/dx9/scene/universe/g03_cube.red';
        // Guristas - Venal
    } elseif ($faction == '500010') {    
        $nebula = 'res:/dx9/scene/universe/c12_cube.red';
        // Angels - Curse
    } elseif ($faction == '500011') {    
        $nebula = 'res:/dx9/scene/universe/m06_cube.red';
        // Blood Raiders - Delve
    } elseif ($faction == '500012') {    
        $nebula = 'res:/dx9/scene/universe/a11_cube.red';
        // ORE - Outer ring
    } elseif ($faction == '500014') {
        $nebula = 'res:/dx9/scene/universe/g08_cube.red';  
        // Sisters of EVE - Pure Blind
    } elseif ($faction == '500016') {
        $nebula = 'res:/dx9/scene/universe/c05_cube.red';  
        // Mordus Legon - Pure Blind
    } elseif ($faction == '500018') {
        $nebula = 'res:/dx9/scene/universe/c05_cube.red';  
        // Sanshas - Stain
    } elseif ($faction == '500019') {
        $nebula = 'res:/dx9/scene/universe/a16_cube.red';
        // If all else fails, must be those pesky Serpentis again, right?
        // I heard they come from Fountain
    } else {
        $nebula = 'res:/dx9/scene/universe/g10_cube.red';
    }   

?>   
        <script type="text/javascript" src="/includes/ccpwgl/src/external/glMatrix-0.9.5.min.js"></script>
        <script type="text/javascript" src="/includes/ccpwgl/src/ccpwgl_int.js"></script>
        <script type="text/javascript" src="/includes/ccpwgl/src/test/TestCamera2.js"></script>
        <script type="text/javascript" src="/includes/ccpwgl/src/ccpwgl.js"></script>
        <script type="text/javascript">       
            
            function onDocumentLoad()
            {
                var canvas = document.getElementById('mainCanvas');
                ccpwgl.initialize(canvas);
                var scene = ccpwgl.loadScene('<?php echo $nebula; ?>');

                var camera = new TestCamera(canvas);
                camera.minDistance = 10;
                camera.maxDistance = 10000;
                camera.fov = 30;
                camera.distance = 5000;
                camera.rotationX = 2.8;
                camera.rotationY = 0.25;
                camera.nearPlane = 1;
                camera.farPlane = 10000000;
                camera.minPitch = -0.5;
                camera.maxPitch = 0.65;
                ccpwgl.setCamera(camera);

                // Load the data for the ship
                var ship = scene.loadShip('<?php echo $graphicFile; ?>', whenLoaded);

                var distanceScaler = 4.5;

                /**
                 * A function that auto focuses the scene's camera to a space object
                 * @param (spaceObject) a ccpwgl space object (Ship, Object or Planet)
                 * @param (distanceScaler) numeric value
                 * @throws SpaceObject is not loaded
                 */
                function autoFocus(spaceObject, distanceScaler)
                {
                    // The spaceObject must be loaded to get it's bounding sphere data
                    if (!spaceObject.isLoaded())
                    {
                        throw new ccpwgl.IsStillLoadingError();
                    }

                    // Set the camera's point of interest as the space object's position in world space
                    camera.poi[0] = spaceObject.getTransform()[12];
                    camera.poi[1] = spaceObject.getTransform()[13];
                    camera.poi[2] = spaceObject.getTransform()[14];

                    // Get the radius of the space object
                    var spaceObjectRadius = parseInt(spaceObject.getBoundingSphere()[1]);

                    // Set the camera's minimum distance
                    camera.minDistance = spaceObjectRadius * 0.8;

                    // Set the camera's distance
                    camera.distance = spaceObjectRadius * distanceScaler;
                }

                // A callback function that is run once the ship's base javascript object has loaded.
                function whenLoaded()
                {
                    autoFocus(ship, distanceScaler)
                var rotation = [0, 0, 0]; // Values are in degrees
                var position = [0, 0, 0];
                var scale = [1, 1, 1];
                /**
                 *  Creates a new transform from an identity matrix and supplied arguments
                 *  @param (position) vec3 array - Position in space [x,y,z]
                 *  @param (rotation) vec3 array - Rotation in space [x,y,z]
                 *  @param (scale) vec3 array - Scale [x,y,z]
                 *  @returns {mat4} Transform matrix
                 */
                function createTransform(rotation, position, scale)
                {
                        var transform = mat4.identity(mat4.create());
                        mat4.translate(transform, position);
                        mat4.rotate(transform, rotation[0] * ( Math.PI / 180 ), [1, 0, 0]);
                        mat4.rotate(transform, rotation[1] * ( Math.PI / 180 ), [0, 1, 0]);
                        mat4.rotate(transform, rotation[2] * ( Math.PI / 180 ), [0, 0, 1]);
                        mat4.scale(transform, scale);
                        return transform;
                }
                // Rotation
                Object.defineProperty(ship, 'rotation', {
                    get: function ()
                    {
                        return rotation;
                    },
                    set: function (vec3)
                    {
                        if (!ship.isLoaded())
                        {
                            throw new ccpwgl.IsStillLoadingError();
                        }
                        try
                        {
                            var newTransform = createTransform(vec3, position, scale);
                            ship.setTransform(newTransform)
                        }
                        catch (err)
                        {
                            throw('Transform Error');
                        }
                        rotation = vec3;
                    },
                    enumerable: true,
                    configurable: true
                });
                // Position
                Object.defineProperty(ship, 'position', {
                    get: function ()
                    {
                        return position;
                    },
                    set: function (vec3)
                    {
                        if (!ship.isLoaded())
                        {
                            throw new ccpwgl.IsStillLoadingError();
                        }
                        try
                        {
                            var newTransform = createTransform(rotation, vec3, scale);
                            ship.setTransform(newTransform)
                        }
                        catch (err)
                        {
                            throw('Transform Error');
                        }
                        position = vec3;
                    },
                    enumerable: true,
                    configurable: true
                });
                // Scale
                Object.defineProperty(ship, 'scale', {
                    get: function ()
                    {
                        return scale;
                    },
                    set: function (vec3)
                    {
                        if (!ship.isLoaded())
                        {
                            throw new ccpwgl.IsStillLoadingError();
                        }
                        try
                        {
                            var newTransform = createTransform(rotation, position, vec3);
                            ship.setTransform(newTransform)
                        }
                        catch (err)
                        {
                            throw('Transform Error');
                        }
                        scale = vec3;
                    },
                    enumerable: true,
                    configurable: true
                });
                // Example values
                ship.rotation = [0, 180, 0];
                ship.position = [0, 0, 0];
                ship.scale = [1, 1, 1];
            }

                ccpwgl.enablePostprocessing(true);

            }

        onload = onDocumentLoad;

    </script>
    </head>
    <body style="margin:0">
        <canvas id="mainCanvas" style="position:fixed;width:100%;height:100%"></canvas>
    </body>
</html>