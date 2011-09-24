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
$piwikTracker->doTrackPageView('Signatures / Blue');
?>
<?
// Set the content-type
header('Content-type: image/png');

// Create the image
$im = imagecreatetruecolor(630, 25);

// Create some colors
$white = imagecolorallocatealpha($im, 255, 255, 255, 0);
$grey = imagecolorallocatealpha($im, 80, 80, 80, 0);
$blue = imagecolorallocatealpha($im, 0, 191, 255, 0);
imagefilledrectangle($im, 0, 0, 630, 25, $blue);

// The text to draw
$text = file_get_contents ($domain.$_GET["n"].'/sig');
// Replace path by your own font path
$font = 'arial.ttf';

// Add some shadow to the text if desired.
if (isset($_GET["s"]) == "y") {
imagettftext($im, 9, 0, 6, 17, $grey, $font, $text);
imagefilter($im, IMG_FILTER_GAUSSIAN_BLUR);
imagettftext($im, 9, 0, 5, 16, $white, $font, $text);
} else {
imagettftext($im, 9, 0, 5, 16, $white, $font, $text);
}

// Add the text (Depreciated due to the text being applied in the above if statement)
//imagettftext($im, 9, 0, 5, 17, $white, $font, $text);

// Using imagepng() results in clearer text compared with imagejpeg()
imagepng($im);
imagedestroy($im);
?>