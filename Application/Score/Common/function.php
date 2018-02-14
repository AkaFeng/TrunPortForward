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
function getMarkStatusFromCode($code)
{
    $rel = array(
        "MARKING" => "阅卷中",
        "END" => "阅卷已结束",
    );
    return $rel[$code];
}

/**
 * 通过查询状态代码获取查询状态
 * @param $code
 * @return mixed
 */
function getQueryStatusFromCode($code)
{
    $rel = array(
        "UNOPENED" => "查询未开放",
        "PROCESSING" => "数据处理中",
        "SENDING"=> "正在向已订阅用户发送成绩",
        "OPENED" => "查询已开放",
        "CLOSED" => "查询暂时关闭",
        "END" => "查询已结束"
    );
    return $rel[$code];
}

/**
 * 输入考试结束时间，返回状态
 */
function checkExamEnded($time)
{
    if ($time<=getDateTime())
    {
        return true;
    } else {
        return false;
    }
}

/**
 * 根据考试是否结束返回状态文字
 * @param $bool
 * @return string
 */
function getExamStatusFromStatus($bool)
{
    switch ($bool)
    {
        case true:
            return "已结束";
            break;
        case false:
            return "进行中";
            break;
    }
}