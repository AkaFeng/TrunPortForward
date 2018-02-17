<?php
/**
 * Created by PhpStorm.
 * User: victor
 * Date: 17/02/2018
 * Time: 12:32 PM
 */
namespace v1\Controller;
class PortController extends BaseController{
    public function applies_view()
    {
        $this->assign('SideBar_Selected','Port_Applies');
        $this->meta_title = '申请列表';
        $this->display();
    }

    public function apply()
    {
        $this->assign('SideBar_Selected','Port_Apply');
        $this->meta_title = '提交申请';
        $this->display();
    }
}