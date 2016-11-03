<?php

namespace Portal\Controller;
use Common\Controller\HomeBaseController;

/**
 * 产品中心
 */
class ProductController extends HomeBaseController{
    
    /**
     * 首页 http://t.guanwang.com/index.php?m=product&a=index
     */
    public function index(){
        $id = isset($_GET['id']) ? $_GET['id']+0 : '';
        
        $field = array('cat_id','cat_name');
        $list = M('Category')->field($field)->select();
        foreach($list as $k=>$v){
            $list[$k]['child'] = M('Product')->where(array('cat_id'=>$v['cat_id']))->field(array('id','product_name'))->select();
        }
        
        //默认取出第一个类中的第一产品
        if(empty($id)){
            
            foreach ($list as $k=>$v){
                $first = array_shift($v['child']);
                break;
            }
            $id = $first['id'];
            $pro_detail = $this->detail($first['id']);
        }  else {
            $pro_detail = $this->detail($id);
        }
        
        if(empty($pro_detail)){ //数据不存在跳转到首页
            $this->error('数据不存在', U('Index/Index'));
        }
        //p($list);exit;
        
        $this->assign('id',$id);
        $this->assign('cate',$list);
        $this->assign('pro_detail',$pro_detail);
        $this->display();
    }
    
    /**
     * 产品详细信息
     */
    public function detail($id){
        return D('Common/ProductView')->where(array('id'=>$id))->find();
    }
}
