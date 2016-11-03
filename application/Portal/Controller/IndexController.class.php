<?php

namespace Portal\Controller;

use Common\Controller\HomeBaseController;

/**
 * 首页
 */
class IndexController extends HomeBaseController {

    //首页
    public function index() {
        
        $this->home_slides =sp_getslide("index"); //banner
        
//        p($home_slides);exit;
        $this->display(":index");
    }

}
