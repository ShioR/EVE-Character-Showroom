<?
// Fetch the domain from the config
require_once "../eveconfig/eveconfig.php";
$domain = _DOMAIN;

// Set the content-type
header('Content-type: image/png');

// Create the image out of thin air!
$im = imagecreatetruecolor(630, 25);

// Create some colors
$white = imagecolorallocatealpha($im, 255, 255, 255, 0);
$grey = imagecolorallocatealpha($im, 80, 80, 80, 0);
$blue = imagecolorallocatealpha($im, 0, 191, 255, 0);
imagefilledrectangle($im, 0, 0, 630, 25, $blue);

// Get the signature text from the URL
$name = stripslashes($_GET['n']);
$text = file_get_contents ($domain.$name.'/sig');
// Location of the font to use
$font = 'arial.ttf';

// Add a shadow to the text if the user wants it
if (isset($_GET["s"]) == "y") {
imagettftext($im, 9, 0, 6, 17, $grey, $font, $text);
imagefilter($im, IMG_FILTER_GAUSSIAN_BLUR);
imagettftext($im, 9, 0, 5, 16, $white, $font, $text);
} else {
imagettftext($im, 9, 0, 5, 16, $white, $font, $text);
}

// Using imagepng() results in clearer text compared with imagejpeg()
imagepng($im);
imagedestroy($im);
?>