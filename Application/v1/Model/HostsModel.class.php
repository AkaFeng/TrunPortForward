<?php
/**
 * Created by PhpStorm.
 * User: victor
 * Date: 15/02/2018
 * Time: 3:08 PM
 */
namespace v1\Model;
use Think\Model;
class HostsModel extends Model{
    public function getHostInfoById($host_id)
    {
        return $this->where(array("id"=>$host_id))->select()[0];
    }
}