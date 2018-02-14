<?php
namespace v1\Controller;
class IndexController extends BaseController {
    public function index(){
        if (logon()) {
            redirect('/vms');
        } else {
            redirect('/auth/login');
        }
    }
}