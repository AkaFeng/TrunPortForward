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

    public function t0()
    {
        $Solus = new \Solus('http://168.235.75.234/api/admin','YKkKWwSgPla2YeBuViYcxAnhYcC8ycImNTXygGFV','RGNFKf1voOyMfMU4Om1cpyp3hdqnJV0prNV2TLn8');
        $res = $Solus->listServers(5);
        var_dump($res);
    }
}