<?php


function smarty_function_getcorplogo($params, &$smarty)
{
    if (!isset($params['corporationID'])) {
        return '0';
    }

    if (!isset($params['size'])) { $params['size'] = 256; }

    global $eve;

    $path = 'cache/corps/';
    if (!file_exists($path.$params['corporationID'].'_'.$params['size'].'.png')) {

      $distantImg = 'https://image.eveonline.com/Corporation/'.$params['corporationID'].'_256.png';

        $local    = $path.$params['corporationID'];
        $localimage = $path.$params['corporationID'].'_256.png';

        $fp=fopen($distantImg,'rb');

        while (!feof($fp)) {
            $file = $file . fread($fp, 1024*8);
        }
        fclose($fp);
        $fp=fopen($localimage,'w');
        fwrite($fp,$file);
        fclose($fp);

        $img = imagecreatefrompng($localimage);
        if ($img) {
            $newimg = imagecreatetruecolor(32, 32);
            imagecopyresampled($newimg, $img, 0, 0, 0, 0, 32, 32, 256, 256);
            imagejpeg($newimg, $local.'_32.png');
            $newimg = imagecreatetruecolor(64, 64);
            imagecopyresampled($newimg, $img, 0, 0, 0, 0, 64, 64, 256, 256);
            imagejpeg($newimg, $local.'_64.png');
            $newimg = imagecreatetruecolor(128, 128);
            imagecopyresampled($newimg, $img, 0, 0, 0, 0, 128, 128, 256, 256);
            imagejpeg($newimg, $local.'_128.png');
        }
    }

    if (isset($params['assign']) && !empty($params['assign'])) {
        $smarty->assign($params['assign'], '../cache/corps/'.$params['corporationID'].'_'.$params['size'].'.png');
    } else {
        return '../cache/corps/'.$params['corporationID'].'_'.$params['size'].'.png';
    }

}

?>