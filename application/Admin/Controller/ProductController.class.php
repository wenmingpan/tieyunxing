<?php

/**
 * 产品中心控制器
 */

namespace Admin\Controller;

use Common\Controller\AdminbaseController;

class ProductController extends AdminbaseController {

    function _initialize() {
        parent::_initialize();
    }

    /**
     * 产品中心列表
     */
    public function index() {
//        $this->_lists();
        $this->_getTree();
        
        
        $starttime = !empty($_REQUEST ['start'])?$_REQUEST ['start']:null;
        $endtime = !empty($_REQUEST ['endtime'])?$_REQUEST ['endtime']:null;
        
        
        $model = D("Common/ProductView");
        $count = $model->where ( $map )->count ();
        $page = $this->page($count, 20);
        $list = $model->where($map)->order('id DESC')->limit($page->firstRow,$page->listRows)->select();
        
        $this->assign("Page", $page->show('Admin'));
	$this->assign("current_page",$page->GetCurrentPage());
        $this->assign("posts",$list);
        $this->display();
    }
    /**
     * 修改产品信息
     */
    public function edit(){
	$id = intval(I("get.id"));
        $this->_getTree();
        
        $model = D("Common/ProductView");
        $map['product.id'] = $id;
        
        $list = $model->where($map)->find();
        
        $this->assign("post", $list);
        $this->display();
    }
    
    public function edit_post(){
        //p($_POST);exit;
	if(IS_POST){
            $id = $_POST['id'];
            if(!empty($_POST['thumb'])){
                $data['product_thumb'] = $_POST['thumb'];
            }
            
            $data['cat_id']             = $_POST['cat_id'];
            $data['product_name']       = $_POST['product_name'];
            $data['keywords']           = $_POST['keywords'];
            $data['product_function']   = $_POST['product_function'];
            $data['product_feature']    = $_POST['product_feature'];
            $data['font_function']      = $_POST['font_function'];
            $data['admin_function']     = $_POST['admin_function'];
            $data['user_function']      = $_POST['user_function'];
            $data['add_time']           = strtotime($_POST['add_time']);
            
            if(M('Product')->where("id={$id}")->save($data)){
                $this->success("修改成功！", U("Product/index"));
            }  else {
                $this->error("修改失败！");
            }
        }
    }
    /**
     * 添加商品
     */
    public function add() {
        $this->_getTree();
        $this->display();
    }
    
    /**
     * 添加商品action
     */
    public function add_post(){
        //p($_POST);exit;
        if(IS_POST){
            $data['cat_id']             = $_POST['cat_id'];
            $data['product_thumb']      = $_POST['thumb'];
            $data['add_time']           = strtotime($_POST['add_time']);
            $data['product_name']       = $_POST['product_name'];
            $data['keywords']           = $_POST['keywords'];
            $data['product_function']   = $_POST['product_function'];
            $data['product_feature']    = $_POST['product_feature'];
            $data['font_function']      = $_POST['font_function'];
            $data['admin_function']     = $_POST['admin_function'];
            $data['user_function']      = $_POST['user_function'];
            
            if(M('Product')->add($data)){
                $this->success("添加成功！", U("Product/index"));
            }  else {
                $this->error("添加失败！");
            }
        }
    }
    /**
     * 删除产品
     */
    public function delete() {
        //p($_POST);exit;
        if (isset($_GET['id'])) {
            $id = intval(I("get.id"));
            if (M('Product')->where("id={$id}")->delete()) {
                $this->success("删除成功！");
            } else {
                $this->error("删除失败！");
            }
        }
        if (isset($_POST['ids'])) {
            $ids = join(",", $_POST['ids']);
            if (M('Product')->where("id in ($ids)")->delete()) {
                $this->success("删除成功！");
            } else {
                $this->error("删除失败！");
            }
        }
    }

    /**
     * 获取分类
     */
    private function _getTree() {
        $term_id = empty($_REQUEST['term']) ? 0 : intval($_REQUEST['term']);
        $result = M('Category')->order(array("sort_order" => "DESC"))->select();

        $tree = new \Tree();
        $tree->icon = array('&nbsp;&nbsp;&nbsp;│ ', '&nbsp;&nbsp;&nbsp;├─ ', '&nbsp;&nbsp;&nbsp;└─ ');
        $tree->nbsp = '&nbsp;&nbsp;&nbsp;';
        foreach ($result as $r) {
            //$r['str_manage'] = '<a href="' . U("AdminTerm/add", array("parent" => $r['term_id'])) . '">添加子类</a> | <a href="' . U("AdminTerm/edit", array("id" => $r['term_id'])) . '">修改</a> | <a class="J_ajax_del" href="' . U("AdminTerm/delete", array("id" => $r['term_id'])) . '">删除</a> ';
            //$r['visit'] = "<a href='#'>访问</a>";
            $r['id'] = $r['cat_id'];
            $r['parentid'] = $r['parent_id'];
            $r['selected'] = $term_id == $r['cat_id'] ? "selected" : "";
            $array[] = $r;
        }

        $tree->init($array);
        $str = "<option value='\$id' \$selected>\$spacer\$cat_name</option>";
        $taxonomys = $tree->get_tree(0, $str);
        //echo $taxonomys;exit;
        $this->assign("taxonomys", $taxonomys);
    }

}
