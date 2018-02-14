<?php
/**
 * Created by PhpStorm.
 * User: victor
 * Date: 2017/10/26
 * Time: 下午9:50
 */
namespace Score\Model;
use Think\Model;
class OperatorsModel extends  Model{
    /**
     * 通过Uid获取特派员ID
     * @param $uid
     * @return bool
     */
    public function getOperatorIdByUid($uid){
        $q = $this->where(array("uid"=>$uid))->select();
        if ($q) {
            return $q[0]['id'];
        } else {
            return false;
        }
    }

    /**
     * 通过Uid获取特派员类型
     * @param $uid
     * @return bool
     * 若查询的用户不是特派员，则返回false
     */
    public function getOperatorType($uid){
        $q = $this->where(array("uid"=>$uid))->select();
        if ($q) {
            return $q[0]['type'];
        } else {
            return false;
        }
    }
}