<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- HTML5 shim for IE8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <![endif]-->

	<link href="/statics/simpleboot/themes/<?php echo C('SP_ADMIN_STYLE');?>/theme.min.css" rel="stylesheet">
    <link href="/statics/simpleboot/css/simplebootadmin.css" rel="stylesheet">
    <link href="/statics/js/artDialog/skins/default.css" rel="stylesheet" />
    <link href="/statics/simpleboot/font-awesome/4.2.0/css/font-awesome.min.css"  rel="stylesheet" type="text/css">
    <style>
		.length_3{width: 180px;}
	</style>
	<!--[if IE 7]>
	<link rel="stylesheet" href="/statics/simpleboot/font-awesome/4.2.0/css/font-awesome-ie7.min.css">
	<![endif]-->
<script type="text/javascript">
//全局变量
var GV = {
    DIMAUB: "/",
    JS_ROOT: "statics/js/",
    TOKEN: ""
};
</script>
<!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="/statics/js/jquery.js"></script>
    <script src="/statics/js/wind.js"></script>
    <script src="/statics/simpleboot/bootstrap/js/bootstrap.min.js"></script>
<?php if(APP_DEBUG): ?><style>
		#think_page_trace_open{
			z-index:9999;
		}
	</style><?php endif; ?>
<body class="J_scroll_fixed">
<div class="wrap J_check_wrap">
  <ul class="nav nav-tabs">
     <li class="active"><a href="javascript:;">所有产品</a></li>
     <li><a href="<?php echo U('Product/add',array('term'=>empty($term['term_id'])?'':$term['term_id']));?>"  target="_self">添加产品</a></li>
  </ul>
<!--  <form class="well form-search" method="post" action="<?php echo u('Product/index');?>">
    <div class="search_type cc mb10">
      <div class="mb10"> 
        <span class="mr20">分类：
        <select class="select_2" name="cat_id">
          	<option value='0' >全部</option>
          	<?php echo ($taxonomys); ?>
        </select>
        &nbsp;&nbsp;时间：
        <input type="text" name="start_time" class="input length_2 J_date" value="<?php echo ((isset($formget["start_time"]) && ($formget["start_time"] !== ""))?($formget["start_time"]):''); ?>" style="width:80px;" autocomplete="off">-<input type="text" class="input length_2 J_date" name="end_time" value="<?php echo ($formget["end_time"]); ?>" style="width:80px;" autocomplete="off">
        
         
        <select class="select_2" name="searchtype" style="width:70px;">
          <option value='0' >标题</option>
        </select>
         
               &nbsp; &nbsp;关键字：
        <input type="text" class="input length_2" name="keyword" style="width:200px;" value="<?php echo ($formget["keyword"]); ?>" placeholder="请输入关键字...">
        <input type="submit" class="btn" value="搜索"/>
        </span>
      </div>
    </div>
  </form>-->
  <form class="J_ajaxForm" action="" method="post">
    <div class="table_list">
      <table width="100%" class="table table-hover">
        <thead>
            <tr>
              <th width="16"><label><input type="checkbox" class="J_check_all" data-direction="x" data-checklist="J_check_x"></label></th>
              <th>ID</th>
              <th>产品名称</th>
              <th width="45">缩略图</th>
              <th width="100"><span>发布时间</span></th>
              <th width="120">操作</th>
            </tr>
        </thead>
        	
        <?php if(is_array($posts)): foreach($posts as $key=>$vo): ?><tr>
                <td><input type="checkbox" class="J_check" data-yid="J_check_y" data-xid="J_check_x" name="ids[]" value="<?php echo ($vo["id"]); ?>" ></td>
                <td><a><?php echo ($vo["id"]); ?></a></td>
                <td>
                    <span><?php echo ($vo["product_name"]); ?></span> 	
                </td>
                <td>
                    <img src="<?php echo ($vo["product_thumb"]); ?>" alt="" />
                </td>         
                <td><?php echo (date('Y-m-d',$vo["add_time"])); ?></td>
                <td>
                    <a href="<?php echo U('Product/edit',array('id'=>$vo['id'],'term'=>$vo['cat_id']));?>">修改</a>|
                    <a href="<?php echo U('Product/delete',array('id'=>$vo['id']));?>" class="J_ajax_del" >删除</a>
                </td>
            </tr><?php endforeach; endif; ?>
          </table>
          <div class="pagination"><?php echo ($Page); ?></div>
     
    </div>
    <div class="form-actions">
        <label class="checkbox inline" for="check_all"><input type="checkbox" class="J_check_all" data-direction="y" data-checklist="J_check_y" id="check_all">全选</label>                    
        <button class="btn btn-primary J_ajax_submit_btn" type="submit" data-action="<?php echo U('Product/delete');?>" data-subcheck="true" data-msg="你确定删除吗？">删除</button>
      </div>
  </form>
</div>
<script src="/statics/js/common.js"></script>
<script>

function refersh_window() {
    var refersh_time = getCookie('refersh_time');
    if (refersh_time == 1) {
        window.location="<?php echo U('AdminPost/index',$formget);?>";
    }
}
setInterval(function(){
	refersh_window();
}, 2000);
$(function () {
	setCookie("refersh_time",0);
    Wind.use('ajaxForm','artDialog','iframeTools', function () {
        //批量移动
        $('#J_Content_remove').click(function (e) {
            var str = 0;
            var id = tag = '';
            $("input[name='ids[]']").each(function () {
                if ($(this).attr('checked')) {
                    str = 1;
                    id += tag + $(this).val();
                    tag = ',';
                }
            });
            if (str == 0) {
				art.dialog.through({
					id:'error',
					icon: 'error',
					content: '您没有勾选信息，无法进行操作！',
					cancelVal: '关闭',
					cancel: true
				});
                return false;
            }
            var $this = $(this);
            art.dialog.open("/index.php?g=admin&m=Product&a=delete&ids=" + id, {
                title: "批量移动",
                width:"80%"
            });
        });
    });
});


</script>
</body>
</html>