<?php
return array(
    'LOAD_EXT_CONFIG'         => 'dbc',
    'URL_ROUTER_ON'   => true,
    'URL_MAP_RULES' => array(

        //Authorization认证部分
        'auth/login' => 'Auth/login',
        'auth/register' => 'Auth/register',
        'logout' => 'Auth/logout',

        //Dashboard
        'overview' => 'Index/overview',

        //Query查询部分路由
        'query/routine' => 'Query/routine',
        'query/subscribe' => 'Query/subscribe',
        'query/api' => 'Query/api',
        'query/qrobot' => 'Query/qrobot',

        //Account用户路由
        'account/profile' => 'Account/profile',
        'account/verification' => 'Account/verification',


        //Operator特派员路由
        'operator/my' => 'Operator/pub_my',
        'operator/exams' => 'Operator/dataop_exams',
        'operator/import' => 'Operator/dataop_import'
    ),
    'URL_ROUTE_RULES' => array(
        //Operator
        'operator/exams/edit/:exam_id' => 'Operator/Action_dataop_exams_edit',
    ),
);