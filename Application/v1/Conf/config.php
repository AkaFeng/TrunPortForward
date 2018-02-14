<?php
return array(
    'LOAD_EXT_CONFIG'         => 'dbc',
    'URL_ROUTER_ON'   => true,
    'URL_MAP_RULES' => array(
        'auth/login' => 'Auth/login',
        'vms' => 'Vm/vmList',
    ),
    'URL_ROUTE_RULES' => array(
    ),
);