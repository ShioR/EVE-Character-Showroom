<?
// Set the content-type
header('Content-type: image/png');

// Create the image
$im = imagecreatetruecolor(630, 25);

// Create some colors
$darkgrey = imagecolorallocatealpha($im, 27, 27, 27, 0);
$black = imagecolorallocatealpha($im, 0, 0, 0, 25);
$grey = imagecolorallocatealpha($im, 150, 150, 150, 0);
$gold = imagecolorallocatealpha($im, 255, 215, 0, 0);
imagefilledrectangle($im, 0, 0, 630, 25, $darkgrey);

// The text to draw
$text = file_get_contents ('http://skills.txsi.co.uk/'.$_GET["n"].'&show=sig');
// Replace path by your own font path
$font = 'arial.ttf';

// Add some shadow to the text
imagettftext($im, 9, 0, 6, 18, $black, $font, $text);

// Add the text
imagettftext($im, 9, 0, 5, 17, $gold, $font, $text);

// Using imagepng() results in clearer text compared with imagejpeg()
imagepng($im);
imagedestroy($im);
?>