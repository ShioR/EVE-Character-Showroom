<?php
// Fetch the domain from the config
require_once "../includes/config.php";
$domain = _DOMAIN;

// Set the content-type
header('Content-type: image/png');

// Create the image
//$im = imagecreatetruecolor(630, 25);
$im = imagecreatefrompng('bg/trans.png');

// Create some colors
$black = imagecolorallocate($im, 0, 0, 0);
$white = imagecolorallocate($im, 255, 255, 255);
$alpha = imagecolorallocatealpha($im,0,0,0,127); 

imagecolortransparent($im,$black);
imagefill($im,0,0,$alpha);

// Get the signature text from the URL
$name = stripslashes($_GET['n']);
$text = file_get_contents ($domain.$name.'/sig');
// Location of the font to use
$font = 'arial.ttf';

// Add a shadow to the text if the user wants it
if (isset($_GET["s"]) == "y") {
imagettftext($im, 9, 0, 6, 17, $darkgrey, $font, $text);
} else {
imagettftext($im, 9, 0, 5, 16, $white, $font, $text);
}

// Using imagepng() results in clearer text compared with imagejpeg()
imagepng($im);
imagedestroy($im);
?>