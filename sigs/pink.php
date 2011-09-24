<?php 
// -- Piwik Tracking API init -- 
require_once "../includes/stats.php";
require_once "../eveconfig/eveconfig.php";
$domain = _DOMAIN;
PiwikTracker::$URL = 'http://irsekrit.com/stats/';
?>
<?php 
$piwikTracker = new PiwikTracker( $idSite = 2 );
// You can manually set the visitor details (resolution, time, plugins, etc.) 
// See all other ->set* functions available in the PiwikTracker.php file
//$piwikTracker->setResolution(1600, 1400);

// Sends Tracker request via http
$piwikTracker->doTrackPageView('Signatures / Pink');
?>
<?
// Set the content-type
header('Content-type: image/png');

// Create the image
$im = imagecreatetruecolor(630, 25);

// Create some colors
$darkgrey = imagecolorallocatealpha($im, 27, 27, 27, 0);
$whitebg = imagecolorallocatealpha($im, 255, 255, 255, 25);
$black = imagecolorallocate($im, 0, 0, 0);
$pink = imagecolorallocate($im, 255, 51, 102);
imagefilledrectangle($im, 0, 0, 630, 25, $darkgrey);

// The text to draw
$text = file_get_contents ($domain.$_GET["n"].'/sig');
// Replace path by your own font path
$font = 'arial.ttf';

// Add some shadow to the text if desired.
if (isset($_GET["s"]) == "y") {
imagettftext($im, 9, 0, 6, 17, $black, $font, $text);
imagefilter($im, IMG_FILTER_GAUSSIAN_BLUR);
imagettftext($im, 9, 0, 5, 16, $pink, $font, $text);
} else {
imagettftext($im, 9, 0, 5, 16, $pink, $font, $text);
}

// Add the text (Depreciated due to the text being applied in the above if statement)
//imagettftext($im, 9, 0, 5, 17, $pink, $font, $text);

// Using imagepng() results in clearer text compared with imagejpeg()
imagepng($im);
imagedestroy($im);
?>