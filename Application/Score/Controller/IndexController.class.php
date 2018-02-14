<?php
namespace Score\Controller;
class IndexController extends BaseController {
    public function index()
    {
        if (logon()) {redirect('/overview');exit;}
        $this->meta_title = "首页";
        $this->display('overview');
    }

    public function overview()
    {
        $this->assign('SideBar_Selected','overview');
        $this->meta_title = "概览";
        $this->display();
    }
}