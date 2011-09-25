<?
// Set the content-type
header('Content-type: image/png');

// Create the image
$im = imagecreatetruecolor(630, 25);

// Create some colors
$darkgrey = imagecolorallocatealpha($im, 27, 27, 27, 0);
$whitebg = imagecolorallocatealpha($im, 255, 255, 255, 25);
$grey = imagecolorallocatealpha($im, 150, 150, 150, 0);
$gold = imagecolorallocatealpha($im, 255, 215, 0, 0);
imagefilledrectangle($im, 0, 0, 630, 25, $darkgrey);

// The text to draw
$text = file_get_contents ($domain.$_GET["n"].'/sig');
// Replace path by your own font path
$font = 'arial.ttf';

// Add some shadow to the text if desired.
if (isset($_GET["s"]) == "y") {
imagettftext($im, 9, 0, 6, 17, $darkgrey, $font, $text);
imagefilter($im, IMG_FILTER_GAUSSIAN_BLUR);
imagettftext($im, 9, 0, 5, 16, $gold, $font, $text);
} else {
imagettftext($im, 9, 0, 5, 16, $gold, $font, $text);
}

// Add the text (Depreciated due to the text being applied in the above if statement)
//imagettftext($im, 9, 0, 5, 17, $gold, $font, $text);

// Using imagepng() results in clearer text compared with imagejpeg()
imagepng($im);
imagedestroy($im);
?>