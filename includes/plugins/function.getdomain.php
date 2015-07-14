<?php
function smarty_function_getdomain($params, &$smarty)
{
    global $eve;
    require_once 'eveconfig/eveconfig.php';
    $domain = _DOMAIN;
    echo $domain;
}
?>