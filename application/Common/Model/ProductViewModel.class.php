<?php

/**
 * 产品模型
 */
namespace Common\Model;
use Think\Model\ViewModel;

class ProductViewModel extends ViewModel{
    
    public $viewFields = array(
        'category'  => array('cat_id','cat_name','cat_desc','parent_id','sort_order'),
        'product'   => array('id','cat_id','product_name','keywords','product_function','product_feature','product_thumb','font_function','admin_function',
                            'user_function','add_time','_on'=>'category.cat_id = product.cat_id'),
    );
        
}