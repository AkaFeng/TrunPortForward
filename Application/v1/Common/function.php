<?php
/**
 * Created by PhpStorm.
 * User: victor
 * Date: 2017/10/22
 * Time: 下午11:36
 */

/**
 * 通过阅卷状态代码获取阅卷状态
 * @param $code
 * @return mixed
 */
function getVmStatusFromStatus($code)
{
    $rel = array(
        "online" => "在线",
        "offline" => "不在线",
        "disabled" => "不可用",
    );
    return $rel[$code];
}

/**
 * 和上面那个函数一块用的 返回html里label的颜色
 * @param $code
 * @return string
 */
function getVmStatusLabel($code)
{
    $rel = array(
        "online" => "success",
        "offline" => "danger",
        "disabled" => "warning",
    );
    return $rel[$code];
}