<?php
/**
 * Created by PhpStorm.
 * User: victor
 * Date: 2017/10/28
 * Time: 下午10:16
 */
namespace Score\Model;
use Curl\Curl;
use Think\Model;
class RemoteServersModel extends Model{
    public function getAllActiveServers(){
        return $this->where(array("status"=>"ACTIVE"))->select();
    }

    public function getServerDetailById($server_id){
        $q = $this->where(array("id"=>$server_id))->select();
        return $q[0];
    }

    /**
     * 从远程服务器拉取未完成考试
     * @param $server_id
     * @return mixed
     */
    public function SVR_PullActiveExams($server_id, $server_type = 'APMS')
    {
        $server_info = $this->getServerDetailById($server_id);
        $server_addr = $server_info['address'];
        $Curl = new Curl();
        switch ($server_type) {
            case 'APMS':
                $sql = "SELECT [prjSN],[prjName],[updateDate] FROM [tbl_exa_project] WHERE prjFinish = 0 ORDER BY prjSN DESC";
                break;
            case 'AMEQP':
                $sql = "SELECT [exaSN] AS [prjSN],[exaName] AS [prjName],[updateDate] FROM [tbl_exa_exam] WHERE isFinish = 0 ORDER BY exaSN DESC";
                break;
        }
        $curl_res = $Curl->get($server_addr,array(
            "auth" => "ChangJun",
            "action" => "db",
            "inputFormat" => "base64",
            "sql" => base64_encode($sql),
        ));
        return json_decode(iconv('gb2312','utf-8',$curl_res->response),true);
    }

    public function SVR_PullAllExams($server_id, $server_type)
    {

        switch ($server_type) {
            case 'APMS':
                $SQL = "SELECT [prjSN],[prjName],[updateDate] FROM [tbl_exa_project] ORDER BY prjSN DESC";
                break;
            case 'AMEQP':
                $SQL = "SELECT [exaSN] AS [prjSN],[exaName] AS [prjName],[updateDate] FROM [tbl_exa_exam] ORDER BY exaSN DESC";
                break;
        }
        return $this->SVR_ExecuteSQL($server_id, $SQL, $server_type);
    }

    /**
     * 通过考试SN获取考试名称，用于拉取成绩xls
     * @param $server_id
     * @param $exaSN
     * @return mixed
     */
    public function SVR_GetExamNameByExaSN($server_id,$exaSN)
    {
        $sql = 'SELECT [prjName] FROM [tbl_exa_project] WHERE [prjSN] = '.$exaSN;
        return $this->SVR_ExecuteSQL($server_id,$sql)[0]['prjName'];
    }

    /**
     * 标准执行SQL方法
     * @param $server_id
     * @param $sql
     * @return mixed
     */
    public function SVR_ExecuteSQL($server_id,$sql,$server_type='APMS')
    {
        $server_info = $this->getServerDetailById($server_id);
        $server_addr = $server_info['address'];
        $Curl = new Curl();
        $Curl->setHeader('Accept-Language','zh-CN,zh;q=0.9');
        switch ($server_type){
            case 'APMS':
                $sql = base64_encode(iconv('utf-8','gbk',$sql));
                break;
            default:
                $sql = base64_encode($sql);
                break;
        }
        $curl_res = $Curl->get($server_addr,array(
            "auth" => "ChangJun",
            "action" => "db",
            "inputFormat" => "base64",
            "sql" => $sql,
        ));
        if ($server_type == 'APMS') {
            return json_decode(iconv('gb2312','utf-8',$curl_res->response),true);
        } else {
            return json_decode($curl_res->response,true);
        }
    }
}