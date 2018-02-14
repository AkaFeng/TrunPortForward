<?php
// +----------------------------------------------------------------------
// | Changjunese Scrore v2.0
// +----------------------------------------------------------------------
// | Copyright (c) 2015-2017 https://www.northme.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Victor.Chen <victor.chen@northme.com>
// +----------------------------------------------------------------------
// | Create at: 2017/10/18 22:13
// +----------------------------------------------------------------------
namespace Main\Model;
use Think\Model;

class UsersModel extends Model
{
    public function getUserInfoByUid($uid){
        $_q = $this->where(array("uid"=>$uid))->select();
        if (!$_q) {
            return false;
        }
        return $_q[0];
    }

    public function userExists($uid){}
}