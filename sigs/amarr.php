<?php 
// Fetch the domain from the config
require_once "../eveconfig/eveconfig.php";
$domain = _DOMAIN;

// Set the content-type
header('Content-type: image/jpeg');

// Create the image from the base
$im = imagecreatefromjpeg('bases/amarr.jpg');

// Create some colors
$black = imagecolorallocate($im, 0, 0, 0);
$black1 = imagecolorallocatealpha($im, 7, 7, 7, 10);
$white = imagecolorallocate($im, 255, 255, 255);
$darkgrey = imagecolorallocatealpha($im, 40, 40, 40, 50);
$grey = imagecolorallocate($im, 150, 150, 150);
$gold = imagecolorallocate($im, 255, 215, 0);

// Get the signature text from the URL
$text = file_get_contents ($domain.$_GET["n"].'/newsig');
// Location of the font to use
$font = 'din1451e.ttf';

// Add a shadow to the text if the user wants it
if (isset($_GET["s"]) == "y") {
imagettftext($im, 10.5, 0, 77, 20, $darkgrey, $font, $text);
//imagefilter($im, IMG_FILTER_GAUSSIAN_BLUR);
imagettftext($im, 10.5, 0, 75, 18, $white, $font, $text);
} else {
imagettftext($im, 10.5, 0, 75, 18, $white, $font, $text);
}

// Character portrait from the EVE image server
$id = $_GET["id"];
$portrait = imagecreatefromjpeg('http://image.eveonline.com/Character/'.$id.'_64.jpg');
imagecopyresampled($im, $portrait, 6, 8, 0, 0, 64, 64, 64, 64);

// Use imagejpeg() to create the image with 95% quality
imagejpeg($im, NULL, 95);
imagedestroy($im);
?>