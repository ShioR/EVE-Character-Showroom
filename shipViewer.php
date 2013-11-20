<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
        <title>Ship Viewer</title>
          
<?php
  // Include config to get db info
    include 'eveconfig/eveconfig.php';
    
      // Connect to db using credentials from the config file
      mysql_connect($dbconfig['dbhost'], $dbconfig['dbuname'], $dbconfig['dbpass']);
      mysql_select_db($dbconfig['dbname']);
      
       // Get the graphicID from the URL
            $typeName = ($_GET['id']);
            
       // Get the graphicFile from the db & close the connection
				$result = mysql_query("SELECT graphicFile FROM skillsheet_ships WHERE typeName = '$typeName'");
				$path = mysql_result($result, 0);
   	mysql_close();
?>
        <script type="text/javascript" src="/includes/ccpwgl/src/external/glMatrix-0.9.5.min.js"></script>
        <script type="text/javascript" src="/includes/ccpwgl/src/ccpwgl_int.js"></script>
        <script type="text/javascript" src="/includes/ccpwgl/src/test/TestCamera2.js"></script>
        <script type="text/javascript" src="/includes/ccpwgl/src/ccpwgl.js"></script>
        <script type="text/javascript">

            function onDocumentLoad()
            {
                ccpwgl.setResourcePath('res', 'http://web.ccpgamescdn.com/ccpwgl/res/');


                var canvas = document.getElementById('mainCanvas');
                ccpwgl.initialize(canvas);
                // Nebula
                var scene = ccpwgl.loadScene('res:/dx9/scene/universe/a04_cube.red');
                // Sun
                sun = scene.loadSun('res:/dx9/model/lensflare/yellow.red', undefined);

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
                var ship = scene.loadShip('<?php echo $path; ?>', undefined);
               // var ship = scene.loadShip('res:/dx9/model/ship/amarr/Titan/AT1/AT1_T1.red', undefined);

                // Engine trails 
               // ship.loadBoosters('res:/dx9/model/ship/booster/booster_amarr.red');


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