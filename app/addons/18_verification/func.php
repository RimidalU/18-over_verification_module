<?php

/***************************************************************************
 *                                                                          *
 *   (c) 2023 Uladzimir Stankevich                                          *
 *                                                                          *
 * This  is  commercial  software,  only  users  who have purchased a valid *
 * license  and  accept  to the terms of the  License Agreement can install *
 * and use this program.                                                    *
 *                                                                          *
 ****************************************************************************
 * PLEASE READ THE FULL TEXT  OF THE SOFTWARE  LICENSE   AGREEMENT  IN  THE *
 * "copyright.txt" FILE PROVIDED WITH THIS DISTRIBUTION PACKAGE.            *
 ****************************************************************************/


use Tygh\Enum\YesNo;
use Tygh\Tygh;

if (!defined('BOOTSTRAP')) { die('Access denied'); }

/**
 * Administers access based on the date of birth entered.
 *
 * @param string $birthday Date of birth from input HTML element.
 *
 */
function fn_check_age($birthday)
    {
        $auth = & Tygh::$app['session']['auth'];
        $age = date_diff(date_create($birthday), date_create('now'))->y;

        $auth['check_age'] = $age > 18 ? YesNo::YES : YesNo::NO;
    }
