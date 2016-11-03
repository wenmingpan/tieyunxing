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

      <script type="text/javascript"  src="/statics/js/ueditor/ueditor.config.js"></script>
      <script type="text/javascript"  src="/statics/js/ueditor/ueditor.all.min.js"></script>
<script type="text/javascript">
    var catid = "12";
</script>
<style type="text/css">
.col-auto {
	overflow: hidden;
	_zoom: 1;
	_float: left;
	border: 1px solid #c2d1d8;
}
.col-right {
	float: right;
	width: 210px;
	overflow: hidden;
	margin-left: 6px;
	border: 1px solid #c2d1d8;
}

body fieldset {
	border: 1px solid #D8D8D8;
	padding: 10px;
	background-color: #FFF;
}
body fieldset legend {
    background-color: #F9F9F9;
    border: 1px solid #D8D8D8;
    font-weight: 700;
    padding: 3px 8px;
}
.list-dot{ padding-bottom:10px}
.list-dot li,.list-dot-othors li{padding:5px 0; border-bottom:1px dotted #c6dde0; font-family:"宋体"; color:#bbb; position:relative;_height:22px}
.list-dot li span,.list-dot-othors li span{color:#004499}
.list-dot li a.close span,.list-dot-othors li a.close span{display:none}
.list-dot li a.close,.list-dot-othors li a.close{ background: url("/statics/images/cross.png") no-repeat left 3px; display:block; width:16px; height:16px;position: absolute;outline:none;right:5px; bottom:5px}
.list-dot li a.close:hover,.list-dot-othors li a.close:hover{background-position: left -46px}
.list-dot-othors li{float:left;width:24%;overflow:hidden;}
</style>
</head>
<body class="J_scroll_fixed">
<div class="wrap J_check_wrap">
  <ul class="nav nav-tabs">
     <li><a href="<?php echo U('Product/index');?>">所有产品</a></li>
     <li class="active"><a href="<?php echo U('Product/add',array('term'=>empty($term['term_id'])?'':$term['term_id']));?>"  target="_self">添加产品</a></li>
  </ul>
  <form name="myform" id="myform" action="<?php echo U('Product/add_post');?>" method="post" class="form-horizontal J_ajaxForms" enctype="multipart/form-data">
  <div class="col-right">
    <div class="table_full">
      <table width="100%">
         <tr>
          <td><b>缩略图</b></td>
        </tr>
        <tr>
          <td>
          	<div  style="text-align: center;"><input type='hidden' name='thumb' id='thumb' value=''>
			<a href='javascript:void(0);' onclick="flashupload('thumb_images', '附件上传','thumb',thumb_images,'1,jpg|jpeg|gif|png|bmp,1,,,1','','','');return false;">
			<img src='/statics/images/icon/upload-pic.png' id='thumb_preview' width='135' height='113' style='cursor:hand' /></a>
			<!-- <input type="button" class="btn" onclick="crop_cut_thumb($('#thumb').val());return false;" value="裁减图片">  -->
            <input type="button"  class="btn" onclick="$('#thumb_preview').attr('src','/statics/images/icon/upload-pic.png');$('#thumb').val('');return false;" value="取消图片">
            </div>
			</td>
        </tr>
        <tr>
          <td><b>发布时间</b></td>
        </tr>
        <tr>
          <td><input type="text" name="add_time" id="updatetime" value="<?php echo date('Y-m-d H:i:s',time());?>" size="21" class="input length_3 J_datetime "></td>
        </tr>
        
      </table>
    </div>
  </div>
  <div class="col-auto">
    <div class="table_full">
      <table width="100%" cellpadding="2" cellspacing="2">
            <tr>
              <th width="80">栏目</th>
              <td>
              	<select name="cat_id"  class="normal_select">
						<?php echo ($taxonomys); ?>
				</select>
              </td>
            </tr>
            <tr>
              <th width="80">产品名称 </th>
              <td>
              	<input type="text" style="width:400px;" name="product_name" id="title"  required value="" style="color:" class="input input_hd J_title_color" placeholder="请输入名称" onkeyup="strlen_verify(this, 'title_len', 160)" />
              	<span class="must_red">*</span>
              </td>
            </tr>
            <tr>
              <th width="80">关键词</th>
              <td><input type='text' name='keywords' id='keywords' value='' style='width:400px'   class='input' placeholder='请输入关键字'> 多关键词之间用逗号隔开</td>
            </tr>
<!--            <tr>
              <th width="80">摘要 </th>
              <td><textarea name='post[post_excerpt]' id='description'  required style='width:98%;height:50px;' placeholder='请填写摘要'></textarea> </td>
            </tr>-->
            <tr>
              <th width="80">产品功能</th>
              <td><span class="must_red">*</span><textarea name="product_function" id="content_tip1" ></textarea>
              <script type="text/plain" id="content1" name="product_function"></script>
                <script type="text/javascript">
                //编辑器路径定义
                //var editorURL = GV.DIMAUB;
                var ue = UE.getEditor('content_tip1',{
                    initialFrameHeight:"300"
                });
                </script>
                
				</td>
            </tr>
            <tr>
              <th width="80">产品特点</th>
              <td><span class="must_red">*</span><textarea name="product_feature" id="content_tip2" ></textarea>
              <script type="text/plain" id="content2" name="product_feature"></script>
              
                <script type="text/javascript">
                //编辑器路径定义
//                var editorURL = GV.DIMAUB;
                var ue = UE.getEditor('content_tip2',{
                    initialFrameHeight:"300"
                });
                </script>
                
				</td>
            </tr>
            <tr>
              <th width="80">前台功能介绍</th>
              <td><span class="must_red">*</span><textarea name="font_function" id="content_tip3" ></textarea>
              <script type="text/plain" id="content3" name="font_function"></script>
                <script type="text/javascript">
                //编辑器路径定义
                var ue = UE.getEditor('content_tip3',{
                    initialFrameHeight:"300"
                });
                </script>
                
				</td>
            </tr>
            <tr>
              <th width="80">后台功能介绍</th>
              <td><span class="must_red">*</span><textarea name="admin_function" id="content_tip4"></textarea>
              <script type="text/plain" id="content4" name="admin_function"></script>
                <script type="text/javascript">
                //编辑器路径定义
               var ue = UE.getEditor('content_tip4',{
                    initialFrameHeight:"300"
                });
                </script>
                
				</td>
            </tr>   
            <tr>
              <th width="80">用户功能介绍</th>
              <td><span class="must_red">*</span><textarea name="user_function" id="content_tip5"></textarea>
              <script type="text/plain" id="content5" name="user_function"></script>
                <script type="text/javascript">
                //编辑器路径定义
                var ue = UE.getEditor('content_tip5',{
                    initialFrameHeight:"300"
                });
                </script>
                
				</td>
            </tr> 
        </tbody>
      </table>
    </div>
  </div>
  <div class="form-actions">
        <button class="btn btn_submit J_ajax_submit_btn"type="submit">提交</button>
        <a class="btn" href="<?php echo U('Product/index');?>">返回</a>
  </div>
 </form>
</div>
<script type="text/javascript" src="/statics/js/common.js"></script>
<script type="text/javascript" src="/statics/js/content_addtop.js"></script>
<script type="text/javascript"> 
$(function () {
	//setInterval(function(){public_lock_renewal();}, 10000);
	$(".J_ajax_close_btn").on('click', function (e) {
	    e.preventDefault();
	    Wind.use("artDialog", function () {
	        art.dialog({
	            id: "question",
	            icon: "question",
	            fixed: true,
	            lock: true,
	            background: "#CCCCCC",
	            opacity: 0,
	            content: "您确定需要关闭当前页面嘛？",
	            ok:function(){
					setCookie("refersh_time",1);
					window.close();
					return true;
				}
	        });
	    });
	});
	/////---------------------
	 Wind.use('validate', 'ajaxForm', 'artDialog', function () {
			//javascript
	        
	            //编辑器
	            editorcontent = new baidu.editor.ui.Editor();
	            editorcontent.render( 'content' );
	            try{editorcontent.sync();}catch(err){};
	            //增加编辑器验证规则
	            jQuery.validator.addMethod('editorcontent',function(){
	                try{editorcontent.sync();}catch(err){};
	                return editorcontent.hasContents();
	            });
	            var form = $('form.J_ajaxForms');
	        //ie处理placeholder提交问题
	        if ($.browser.msie) {
	            form.find('[placeholder]').each(function () {
	                var input = $(this);
	                if (input.val() == input.attr('placeholder')) {
	                    input.val('');
	                }
	            });
	        }
	        //表单验证开始
	        form.validate({
				//是否在获取焦点时验证
				onfocusout:false,
				//是否在敲击键盘时验证
				onkeyup:false,
				//当鼠标掉级时验证
				onclick: false,
	            //验证错误
	            showErrors: function (errorMap, errorArr) {
					//errorMap {'name':'错误信息'}
					//errorArr [{'message':'错误信息',element:({})}]
					try{
						$(errorArr[0].element).focus();
						art.dialog({
							id:'error',
							icon: 'error',
							lock: true,
							fixed: true,
							background:"#CCCCCC",
							opacity:0,
							content: errorArr[0].message,
							cancelVal: '确定',
							cancel: function(){
								$(errorArr[0].element).focus();
							}
						});
					}catch(err){
					}
	            },
	            //验证规则
	            rules: {'post[post_title]':{required:1},'post[post_content]':{editorcontent:true}},
	            //验证未通过提示消息
	            messages: {'post[post_title]':{required:'请输入标题'},'post[post_content]':{editorcontent:'内容不能为空'}},
	            //给未通过验证的元素加效果,闪烁等
	            highlight: false,
	            //是否在获取焦点时验证
	            onfocusout: false,
	            //验证通过，提交表单
	            submitHandler: function (forms) {
	                $(forms).ajaxSubmit({
	                    url: form.attr('action'), //按钮上是否自定义提交地址(多按钮情况)
	                    dataType: 'json',
	                    beforeSubmit: function (arr, $form, options) {
	                        
	                    },
	                    success: function (data, statusText, xhr, $form) {
	                        if(data.status){
								setCookie("refersh_time",1);
								//添加成功
								Wind.use("artDialog", function () {
								    art.dialog({
								        id: "succeed",
								        icon: "succeed",
								        fixed: true,
								        lock: true,
								        background: "#CCCCCC",
								        opacity: 0,
								        content: data.info,
										button:[
											{
												name: '继续添加？',
												callback:function(){
													reloadPage(window);
													return true;
												},
												focus: true
											},{
												name: '返回列表页',
												callback:function(){
													location='<?php echo U('Product/index');?>';
													return true;
												}
											}
										]
								    });
								});
							}else{
								isalert(data.info);
							}
	                    }
	                });
	            }
	        });
	    });
	////-------------------------
});
</script>
</body>
</html>