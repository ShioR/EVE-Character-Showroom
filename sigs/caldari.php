<?
// Set the content-type
header('Content-type: image/jpeg');

// Create the image
$im = imagecreatefromjpeg('bases/caldari.jpg');

// Create some colors
$black = imagecolorallocate($im, 0, 0, 0);
$black1 = imagecolorallocatealpha($im, 7, 7, 7, 10);
$white = imagecolorallocate($im, 255, 255, 255);
$darkgrey = imagecolorallocatealpha($im, 40, 40, 40, 50);
$grey = imagecolorallocate($im, 150, 150, 150);
$gold = imagecolorallocate($im, 255, 215, 0);

// The text to draw
$text = file_get_contents ($domain.$_GET["n"].'/newsig');
// Replace path by your own font path
$font = 'din1451e.ttf';

// Add some shadow to the text if desired.
if (isset($_GET["s"]) == "y") {
imagettftext($im, 10.5, 0, 77, 20, $darkgrey, $font, $text);
//imagefilter($im, IMG_FILTER_GAUSSIAN_BLUR);
imagettftext($im, 10.5, 0, 75, 18, $white, $font, $text);
} else {
imagettftext($im, 10.5, 0, 75, 18, $white, $font, $text);
}

// Character portrait
$id = $_GET["id"];
$portrait = imagecreatefromjpeg('http://image.eveonline.com/Character/'.$id.'_64.jpg');
imagecopyresampled($im, $portrait, 6, 8, 0, 0, 64, 64, 64, 64);

// Using imagepng() results in clearer text compared with imagejpeg()
imagejpeg($im, NULL, 95);
imagedestroy($im);
?>
