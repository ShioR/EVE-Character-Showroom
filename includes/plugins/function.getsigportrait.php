<?php
function getportrait()
{
    global $id, $domain;
    $path = '../cache/characters/';
    if (!file_exists($path.$id.'_256.jpg')) {

      $distantImg = 'https://image.eveonline.com/Character/'.$id.'_256.jpg';

        $local    = $path.$id;
        $localimage = $path.$id.'_256.jpg';

        $fp=fopen($distantImg,'rb');

        while (!feof($fp)) {
            $file = $file . fread($fp, 1024*8);
        }
        fclose($fp);
        $fp=fopen($localimage,'w');
        fwrite($fp,$file);
        fclose($fp);

        $img = imagecreatefromjpeg($localimage);
        if ($img) {
            $newimg = imagecreatetruecolor(32, 32);
            imagecopyresampled($newimg, $img, 0, 0, 0, 0, 32, 32, 256, 256);
            imagejpeg($newimg, $local.'_32.jpg', 90);
            $newimg = imagecreatetruecolor(64, 64);
            imagecopyresampled($newimg, $img, 0, 0, 0, 0, 64, 64, 256, 256);
            imagejpeg($newimg, $local.'_64.jpg', 95);
            $newimg = imagecreatetruecolor(128, 128);
            imagecopyresampled($newimg, $img, 0, 0, 0, 0, 128, 128, 256, 256);
            imagejpeg($newimg, $local.'_128.jpg', 100);
        }
    }

        return $domain.'cache/characters/'.$id.'_64.jpg';
     
    }
?>