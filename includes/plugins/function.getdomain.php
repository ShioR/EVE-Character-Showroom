<?php
function smarty_function_getdomain($params, &$smarty)
{
    global $eve;
    include(dirname(__FILE__).'/../config.php');
    $domain = _DOMAIN;
    echo $domain;
}
?>