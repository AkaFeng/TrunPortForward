<?php
// +----------------------------------------------------------------------
// | Urox PayinOne Gateways:Handler
// +----------------------------------------------------------------------
// | Copyright (c) 2015-2017 https://www.northme.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Victor.Chen <victor.chen@northme.com>
// +----------------------------------------------------------------------

namespace Score\Controller;
use Score\Model\OperatorsModel;
use Score\Model\SessionsModel;
use Score\Model\UsersModel;
use Think\Auth;
use Think\Controller;

class BaseController extends Controller
{
    protected $Auth;

    public function _initialize()
    {
        $System = M('system')->getField('name,value');
        C($System);
        if (C('site-open')=="OFF")
        {
            $this->show(C('site-off-notice-html'),'utf8');exit;
        }
        $User = new UsersModel();
        if (logon() and getUID()!=2) {
            $Sessions = new SessionsModel();
            if (!$Sessions->checkSession(getUID())) {
                session(null);
                cookie(null);
                $this->error('你的登录已过期，请重新登录.','/',3);
            }
            $Operator = new OperatorsModel();
            $op_type = $Operator->getOperatorType(getUID());
            if ($op_type != false) {
                $this->assign('is_op',true);
                $this->assign('op_type',$op_type);
            }
            //$this->assign('messages',M('messages')->field('title,create_at')->where(array("uid"=>$_SESSION['uid']))->select());
        } else {
            session('uid',2);
        }
        $this->assign('user_info',$User->getUserInfoByUid($_SESSION['uid']));
        if (!logon() and ACTION_NAME != 'login' and ACTION_NAME != 'register' and ACTION_NAME != 'index') {
            $this->error('未登录！正在跳转至登录页...','/auth/login');
        } else {
            /*if (ACTION_NAME != 'login' and ACTION_NAME != 'register' and ACTION_NAME != 'logout' and session('uid')!=1){
                $this->Auth = new Auth();
                if (!$this->Auth->check(CONTROLLER_NAME.'/'.ACTION_NAME,getUID()))
                {
                    $this->error('无权限访问此页面！','/');
                }
            }*/
            //TODO:Auth类认证
        }
    }
}