<?php


function smarty_function_getportrait($params, &$smarty)
{
    if (!isset($params['characterID'])) {
        return '0';
    }

    if (!isset($params['size'])) { $params['size'] = 256; }

    global $eve;

    $path = 'cache/characters/';
    if (!file_exists($path.$params['characterID'].'_'.$params['size'].'.jpg')) {

      $distantImg = 'https://image.eveonline.com/Character/'.$params['characterID'].'_256.jpg';

        $local    = $path.$params['characterID'];
        $localimage = $path.$params['characterID'].'_256.jpg';

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

    if (isset($params['assign']) && !empty($params['assign'])) {
        $smarty->assign($params['assign'], '../cache/characters/'.$params['characterID'].'_'.$params['size'].'.jpg');
    } else {
        return '../cache/characters/'.$params['characterID'].'_'.$params['size'].'.jpg';
    }

}

?>