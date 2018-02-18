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

    public function t1()
    {
        $Curl = new Curl();
        $res = $Curl->post('https://my.lightvm.com/includes/api.php',array(
            "identifier" => "mBoXSW7mhbvhS1d5uCDhJnToJdOWLOnU",
            "secret" => "nxjmwj2RXBiJGDqmLR1CqhaybtxGES7v",
            "responsetype" => "json",
            "action" => "GetClientsProducts",
            "clientid" => 980,
        ));
        var_dump(json_decode($res->response,true)['products']['product']);

    }
}