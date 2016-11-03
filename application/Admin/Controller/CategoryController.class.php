<?php

/**
 * 产品分类控制器
 */

namespace Admin\Controller;

use Common\Controller\AdminbaseController;

class CategoryController extends AdminbaseController {

    function _initialize() {
        parent::_initialize();
    }

    /**
     * 产品中心列表
     */
    public function index() {

        $result = M('Category')->order(array("sort_order" => "DESC"))->select();

        //p($result);exit;
        $tree = new \Tree();
        $tree->icon = array('&nbsp;&nbsp;&nbsp;│ ', '&nbsp;&nbsp;&nbsp;├─ ', '&nbsp;&nbsp;&nbsp;└─ ');
        $tree->nbsp = '&nbsp;&nbsp;&nbsp;';
        foreach ($result as $r) {
            $r['str_manage'] = '<a href="' . U("Category/add", array("parent" => $r['cat_id'])) . '">添加子类</a> | <a href="' . U("Category/edit", array("id" => $r['cat_id'])) . '">修改</a> | <a class="J_ajax_del" href="' . U("Category/delete", array("id" => $r['cat_id'])) . '">删除</a> ';
//                $url=U('portal/list/index',array('id'=>$r['term_id']));
//                $r['url'] = $url;
            $r['id'] = $r['cat_id'];
            $r['parentid'] = $r['parent_id'];
            $array[] = $r;
        }

        $tree->init($array);
//        p($array);exit;
        $str = "<tr>
                <td><input name='listorders[\$sort_order]' type='text' size='3' value='\$sort_order' class='input input-order'></td>
                <td>\$id</td>
                <td>\$spacer <a href='\$url' target='_blank'>\$cat_name</a></td>
                <td>\$cat_desc</td>
                <td>\$str_manage</td>
            </tr>";
//        echo $str;exit;
        $taxonomys = $tree->get_tree(0, $str);
        //echo $taxonomys;exit;
        $this->assign("taxonomys", $taxonomys);


        $this->display();
    }

    /**
     * 添加分类
     */
    public function add() {
        $parentid = intval(I("get.parent"));
        $tree = new \PathTree();
        $tree->icon = array('&nbsp;&nbsp;&nbsp;│ ', '&nbsp;&nbsp;&nbsp;├─ ', '&nbsp;&nbsp;&nbsp;└─ ');
        $tree->nbsp = '---';
        $result = M('Category')->order(array("sort_order" => "DESC"))->select();
        $tree->init($result);
        $tree = $tree->get_tree();
        $this->assign("terms", $tree);
        $this->assign("parent", $parentid);
        $this->display();
    }

    /**
     * 处理添加分类
     */
    public function add_post() {


        if (IS_POST) {
            $data['cat_name'] = $_POST['cat_name'];
            $data['cat_desc'] = $_POST['cat_desc'];
            $data['parent_id'] = $_POST['parent_id'];
            $data['sort_order'] = empty($_POST['sort_order']) ? 50 : $_POST['sort_order'] + 0;
            $cate = M('Category');
            //print_r($cate);exit;
            if ($cate->add($data)) {

                $this->success("添加成功！", U("Category/index"));
            } else {
                $this->error("添加失败！");
            }
        }
    }

    /**
     * 修改分类
     */
    public function edit() {
        $id = intval(I("get.id"));
        $tree = new \PathTree();
        $tree->icon = array('&nbsp;&nbsp;&nbsp;│ ', '&nbsp;&nbsp;&nbsp;├─ ', '&nbsp;&nbsp;&nbsp;└─ ');
        $tree->nbsp = '---';
        $result = M('Category')->where(array("cat_id" => array("NEQ", $id)))->order(array("sort_order" => "desc"))->select();
//        p($result);exit;
        $tree->init($result);
        $tree = $tree->get_tree();

        $data = M('Category')->where(array("cat_id" => $id))->find();

        $this->assign("terms", $tree);
        $this->assign("data", $data);
        $this->display();
    }

    /**
     * 执行修改分类
     */
    public function edit_post() {
        if (IS_POST) {
            $id = $_POST['cat_id'];
            $data['cat_name'] = $_POST['cat_name'];
            $data['cat_desc'] = $_POST['cat_desc'];
            $data['parent_id'] = $_POST['parent_id'];
            $data['sort_order'] = empty($_POST['sort_order']) ? 50 : $_POST['sort_order'] + 0;
            $cate = M('Category');

            if ($cate->where("cat_id={$id}")->save($data)) {
                $this->success("修改成功！");
            } else {
                $this->error("修改失败！");
            }
        }
    }

    /**
     *  删除
     */
    public function delete() {
        $id = intval(I("get.id"));
        $count = M('Category')->where(array("parent_id" => $id))->count();
//        echo $count;exit;
        if ($count > 0) {
            $this->error("该菜单下还有子类，无法删除！");
        }
        if (M('Category')->delete($id) !== false) {
            $this->success("删除成功！");
        } else {
            $this->error("删除失败！");
        }
    }

}
