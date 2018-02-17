<?php
/**
 * Created by PhpStorm.
 * User: victor
 * Date: 17/02/2018
 * Time: 12:32 PM
 */
namespace v1\Controller;
use v1\Model\PortsModel;
use v1\Model\VmsModel;

class PortController extends BaseController{
    public function applies_view()
    {
        $Vms = new VmsModel();
        $user_vms = $Vms->where(array("uid"=>getUID()))->order('id desc')->select();
        $Ports = new PortsModel();
        $user_ports = [];
        $j = 0;
        for ($i=0;$i<count($user_vms);$i++)
        {
            $this_vm_ports_info = $Ports->where(array("vm_id"=>$user_vms[$i]['id']))->where('status != "RELEASED"')->select();
            for ($m=0;$m<count($this_vm_ports_info);$m++)
            {
                $user_ports[$j] = $this_vm_ports_info[$m];
                $j += 1;
            }
        }
        $this->assign('ports_info',$user_ports);
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

    public function Action_releasePort()
    {
        ApiResponseHeader();
        $Ports = new PortsModel();
        $port_id = I('post.port_id');
        $port_info = $Ports->where(array("id"=>$port_id))->select()[0];
        $Vms = new VmsModel();
        if ($Vms->where(array("id"=>$port_info['vm_id']))->select()[0]['uid'] != getUID() or $port_info['apply_status'] == 'RELEASED')
        {
            echo json_encode(array(
                "error" => true,
                "msg" => "Access Denied"
            ));exit;
        } else {
            $Ports->where(array("id"=>$port_id))->data(array("apply_status"=>"RELEASED","released_at"=>getDateTime()))->save();
            $Ports->data(array(
                "range_id" => $port_info['range_id'],
                "port" => $port_info['port'],
                "ip_id" => $port_info['ip_id'],
                "create_at" => $port_info['create_at'],
                "status" => $port_info['status'],
                "apply_status" => "UNUSED",
            ))->add();
            echo json_encode(array(
                "success" => true,
                "msg" => "成功释放端口"
            ));
        }
    }
}