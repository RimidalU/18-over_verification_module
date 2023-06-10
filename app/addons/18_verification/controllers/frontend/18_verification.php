<?php

use Tygh\Tygh;

if ($mode === 'check_age') {
    $auth = Tygh::$app['session']['auth'];
    $params = $_REQUEST['18_verification'];
    $birthday = $params['birthday'];
    fn_check_age($birthday);
}
