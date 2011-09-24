<?php
// ----------------------------------------------------------------------
// PostNuke Content Management System
// Copyright (C) 2002 by the PostNuke Development Team.
// http://www.postnuke.com/
// ----------------------------------------------------------------------
// Based on:
// PHP-NUKE Web Portal System - http://phpnuke.org/
// Thatware - http://thatware.org/
// ----------------------------------------------------------------------
// LICENSE
// To read the license please visit http://www.gnu.org/copyleft/gpl.html
// ----------------------------------------------------------------------

function smarty_outputfilter_shorturls($source, &$smarty)
{

    global $eve;

    $base_url = $eve->GetBaseUrl();
    $prefix = '|"(?:'.$base_url.')?';

    $in = array($prefix . 'skillsheet.php"|',
                $prefix . 'skillsheet.php\?show=addnew"|',
                $prefix . 'skillsheet.php\?show=stats"|',
                $prefix . 'skillsheet.php\?name=([\w\d\.\:\_\/]+)"|',
                $prefix . 'skillsheet.php\?name=([\w\d\.\:\_\/]+)&(?:amp;)?show=([\w\d\.\:\_\/]+)"|');

    $out = array('"'.$base_url.'pilot/"',
                 '"'.$base_url.'add"',
                 '"'.$base_url.'stats"',
                 '"'.$base_url.'pilot/$1"',
                 '"'.$base_url.'pilot/$1/$2"');

    $source = preg_replace($in, $out, $source);

    return $source;

}

?>