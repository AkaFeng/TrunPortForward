<?php
/**
 * Created by PhpStorm.
 * User: victor
 * Date: 14/02/2018
 * Time: 11:36 PM
 */
namespace v1\Controller;
class VmController extends BaseController{
    public function vmList()
    {
        $this->assign('SideBar_Selected','VM_vmList');
        $this->meta_title = '虚拟机';
        $this->display();
    }

    public function addVm(){}
}