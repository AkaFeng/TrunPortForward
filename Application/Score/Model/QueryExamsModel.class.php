<?php
// +----------------------------------------------------------------------
// | Changjunese Scrore v2.0
// +----------------------------------------------------------------------
// | Copyright (c) 2015-2017 https://www.northme.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Victor.Chen <victor.chen@northme.com>
// +----------------------------------------------------------------------
// | Create at: 2017/10/22 22:19
// +----------------------------------------------------------------------
namespace Score\Model;
use Think\Model;
class QueryExamsModel extends Model{
    public function getAvaliableExamsDetail()
    {
        return $this
            ->where("`query_status` != \"DELETED\"")
            ->order("id desc")
            ->select();
    }

    public function getInfoByExamId($id){
        $q = $this->where(array("id"=>$id))->select();
        return $q[0];
    }

    /**
     * 创建考试
     * @param string $exam_name 考试名称
     * @param string $exam_end_at 考试结束时间
     * @return bool
     */
    public function initNewExam($exam_name,$exam_end_at){
        $Operators = new OperatorsModel();
        $exam_id = $this->data(array(
            "exam_name" => $exam_name,
            "exam_end_at" => $exam_end_at,
            "create_at" => getDateTime(),
            "operator_id" => $Operators->getOperatorIdByUid(getUID()),
            "mark_status" => "MARKING",
            "query_status" => "UNOPENED",
        ))->add();

        //创建项目数据表
        $this->execute('CREATE TABLE `'.C('DB_PREFIX').'query_'.$exam_id.'_logs'.'`(
        `id` INT(10) NOT NULL AUTO_INCREMENT , 
        `detail` TEXT NULL , 
        `uid` INT(10) NULL , 
        `create_at` datetime NULL ,
        PRIMARY KEY (`id`)
        ) ENGINE = InnoDB DEFAULT CHARSET=utf8');//日志数据表
        $this->execute('CREATE TABLE `'.C('DB_PREFIX').'query_'.$exam_id.'_result'.'`(
        `id` INT(10) NOT NULL AUTO_INCREMENT ,
        `姓名` TEXT NULL ,
        `考号` TEXT NULL ,
        `result` TEXT NULL ,
        `stu_sn` TEXT NULL ,
        PRIMARY KEY (`id`)
        ) ENGINE = InnoDB DEFAULT CHARSET=utf8');//成绩数据表
        $this->execute('CREATE TABLE `'.C('DB_PREFIX').'query_'.$exam_id.'_students'.'`(
        `id` INT(10) NOT NULL AUTO_INCREMENT , 
        `姓名` TEXT NULL ,
        `考号` TEXT NULL ,
        `stu_cla_sn` VARCHAR(20) NULL,
        `stu_cn` VARCHAR(20) NULL,
        `status` VARCHAR(20) NULL ,
        PRIMARY KEY (`id`)
        ) ENGINE = InnoDB DEFAULT CHARSET=utf8');//学生信息数据表
        $this->execute('CREATE TABLE `'.C('DB_PREFIX').'query_'.$exam_id.'_student_class'.'`(
        `id` INT(10) NOT NULL AUTO_INCREMENT , 
        `class_name` TEXT NULL ,
        `school_name` TEXT NULL ,
        `stu_cla_sn` VARCHAR(20) NULL ,
        PRIMARY KEY (`id`)
        ) ENGINE = InnoDB DEFAULT CHARSET=utf8');//学生信息数据表
        return true;
    }

    /**
     * 获取已经导入的数量
     */
    public function getImportedAmount($exam_id)
    {
        $imported_students = M('query_'.$exam_id.'_students')->count();
        $imported_student_class = M('query_'.$exam_id.'_student_class')->count();
        return array("students"=>$imported_students,"school_class"=>$imported_student_class);
    }

    /**
     * 清空已导入信息
     * @param $exam_id
     * @return bool
     */
    public function clearImportedData($exam_id)
    {
        $this->execute('TRUNCATE `'.C('DB_PREFIX').'query_'.$exam_id.'_students'.'`');
        $this->execute('TRUNCATE `'.C('DB_PREFIX').'query_'.$exam_id.'_student_class'.'`');
        return true;
    }

    public function clearImportedResult($exam_id)
    {
        $this->execute('TRUNCATE `'.C('DB_PREFIX').'query_'.$exam_id.'_result'.'`');
        return true;
    }

    /**
     * 导入学校班级信息
     * @param $exam_id
     * @param $data
     * @return int 导入的数量
     */
    public function importSchoolClass($exam_id,$data)
    {
        M('query_'.$exam_id.'_student_class')->addAll($data);
        return count($data);
    }

    /**
     * 导入学生信息
     * @param $exam_id
     * @param $data
     * @return int 导入的数量
     */
    public function importStudents($exam_id,$data)
    {
        M('query_'.$exam_id.'_students')->addAll($data);
        return count($data);
    }

    /**
     * 获取已经导入成绩的数量
     * @param $exam_id
     * @return mixed
     */
    public function getImportedResultAmount($exam_id)
    {
        $imported_result = M('query_'.$exam_id.'_result')->count();
        $imported_result_required = M('query_'.$exam_id.'_students')->count();
        return $imported_result.'/'.$imported_result_required;
    }

    /**
     * 导入成绩-按数组
     * @param int $exam_id 考试在查分系统ID
     * @param array $data 数据数组
     * @return int 导入的数量
     */
    public function importResult($exam_id,$data)
    {
        M('query_'.$exam_id.'_result')->addAll($data);
        return count($data);
    }

    public function getResultByStu($exam_id,$stuno,$stuname)
    {
        $q = M('query_'.$exam_id.'_result')->where(array("姓名"=>$stuname,"考号"=>$stuno))->select();
        if ($q) {
            return $q[0]['result'];
        } else {
            return false;
        }
    }
}