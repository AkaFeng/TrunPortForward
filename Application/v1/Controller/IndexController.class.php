<?php
namespace v1\Controller;

use Curl\Curl;

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

    public function t1()
    {
        $Curl = new Curl();
        $res = $Curl->post('https://my.lightvm.com/includes/api.php',array(
            "identifier" => "mBoXSW7mhbvhS1d5uCDhJnToJdOWLOnU",
            "secret" => "nxjmwj2RXBiJGDqmLR1CqhaybtxGES7v",
            "responsetype" => "json",
            "action" => "ValidateLogin",
            "email" => "cytvictor@yeah.net",
            "password2" => "cytvictor",
        ));
        var_dump(json_decode($res->response,true));

    }
}