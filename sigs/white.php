<?php
// Fetch the domain from the config
require_once "../includes/config.php";
$domain = _DOMAIN;

// Set the content-type
header('Content-type: image/png');


// Get the signature text from the URL
$name = stripslashes($_GET['n']);
$text = file_get_contents ($domain.$name.'/sig');
// Location of the font to use
$font = 'OpenSans-Regular.ttf';

// Create the image
function imageCreateTransparent($x, $y) {
    $imageOut = imagecreatetruecolor($x, $y);
    $backgroundColor = imagecolorallocatealpha($imageOut, 0, 0, 0, 127);
    imagefill($imageOut, 0, 0, $backgroundColor);
    return $imageOut;
}

$image = imageCreateTransparent(630, 25);

// Create some colors
$pink = imagecolorallocate($image, 255, 51, 102);
$blue = imagecolorallocate($image, 0, 191, 255);
$gold = imagecolorallocate($image, 255, 215, 0);
$red = imagecolorallocate($image, 211, 25, 25);
$green = imagecolorallocate($image, 25, 145, 70);
$white = imagecolorallocate($image, 255, 255, 255);
$black = imagecolorallocate($image, 0, 0, 0);

// Add the text
imagettftext($image, 9, 0, 5, 16, $white, $font, $text);
imagesavealpha($image, true);
imagepng($image);
imagedestroy($image);
?>