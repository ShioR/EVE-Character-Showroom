<?php
/***********************************************************/
/*           EVE Character Showroom - Version 4            */
/*       'Improved' and maintained by Shionoya Risa        */
/*          Originally created by DeTox MinRohim           */
/***********************************************************/
/*   This thing is free for you to take. You take all      */
/* responsabilities for using it. Whatever you do with it, */
/*  I don't care (although I would appreciate you send me  */
/*   any enhancement - ISK donations are also accepted).   */
/*                                                         */
/*   Lots of code snippets have been found in my travels   */
/*    if you think one of those snippets is yours, tell    */
/*         me. I will give all appropriate credits.        */
/***********************************************************/
/*   ISK donations to Shionoya Risa are also accepted ;)   */
/***********************************************************/

function smarty_function_getalliancelogo($params, &$smarty)
{
    if (!isset($params['allianceID'])) {
        return '0';
    }

    if (!isset($params['size'])) { $params['size'] = 128; }

    global $eve;

    $path = 'cache/alliances/';
    if (!file_exists($path.$params['allianceID'].'_'.$params['size'].'.png')) {

      $distantImg = 'https://image.eveonline.com/Alliance/'.$params['allianceID'].'_128.png';

        $local    = $path.$params['allianceID'];
        $localimage = $path.$params['allianceID'].'_128.png';

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
        }
    }

    if (isset($params['assign']) && !empty($params['assign'])) {
        $smarty->assign($params['assign'], '../cache/alliances/'.$params['allianceID'].'_'.$params['size'].'.png');
    } else {
        return '../cache/alliances/'.$params['allianceID'].'_'.$params['size'].'.png';
    }

}

?>