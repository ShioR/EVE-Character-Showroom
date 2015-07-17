<?php 
// Fetch the domain from the config
include "../includes/config.php";
include "../includes/plugins/function.getsigportrait.php";
$domain = _DOMAIN;

// Set the content-type
header('Content-type: image/jpeg');

// Create the image from the bg
$im = imagecreatefromjpeg('bg/guristas.jpg');

// Create some colors
$black = imagecolorallocate($im, 0, 0, 0);
$black1 = imagecolorallocatealpha($im, 7, 7, 7, 10);
$white = imagecolorallocate($im, 255, 255, 255);
$darkgrey = imagecolorallocatealpha($im, 40, 40, 40, 50);
$grey = imagecolorallocate($im, 150, 150, 150);
$gold = imagecolorallocate($im, 255, 215, 0);

// Get the signature text from the URL
$name = stripslashes($_GET['n']);
// MySQL friendly name (replace the underscore for a space)
$navn = str_replace('_', ' ', $name);

// The signature .tpl output url
$text = file_get_contents ($domain.$name.'/newsig');
// Location of the font to use
$font = 'din1451e.ttf';

// Add a shadow & the text 
imagettftext($im, 10.5, 0, 77, 20, $darkgrey, $font, $text);
imagettftext($im, 10.5, 0, 75, 18, $white, $font, $text);

// Fetch the characterID from the database
    // Connect to DB using mysqli
        $mysqli = mysqli_connect($dbconfig['dbhost'], $dbconfig['dbuname'], $dbconfig['dbpass'], $dbconfig['dbname']);
        $query = "SELECT skillsheet_apis.characterID FROM skillsheet_apis WHERE name = '$navn'";
        $result = mysqli_query($mysqli, $query);
        $out = mysqli_fetch_row($result);
        $id = $out[0];
    // Free result & close connection
        mysqli_free_result($result);
   	    mysqli_close($mysqli);

// Fetch portrait
    if (file_exists('../cache/characters/'.$id.'_256.jpg')) {
        $portrait = imagecreatefromjpeg(getportrait());
    } else {
        $portrait = imagecreatefromjpeg('https://image.eveonline.com/Character/'.$id.'_64.jpg');
    }

imagecopyresampled($im, $portrait, 6, 8, 0, 0, 64, 64, 64, 64);

// Use imagejpeg() to create the image with 95% quality
imagejpeg($im, NULL, 95);
imagedestroy($im);
?>