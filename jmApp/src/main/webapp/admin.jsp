<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" type="text/css"  href="/jmApp/bootstrap-3.3.5-dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"  href="/jmApp/datepicker/css/bootstrap-datepicker3.css">
<link rel="stylesheet" type="text/css"  href="/jmApp/bootstrap-fileinput-master/css/fileinput.min.css"charset="utf-8">
<link rel="stylesheet" type="text/css"  href="/jmApp/sweetalert/dist/sweetalert.css">
<link rel="stylesheet" href="/jmApp/bootstrap-3.3.5-dist/css/buttons.css">
<link rel="stylesheet" href="/jmApp/circle_progress/css/progress.css">
<link rel="stylesheet" href="/jmApp/css/style.css">
<script src="/jmApp/bootstrap-3.3.5-dist/js/jquery.min.js"	charset="utf-8" type="text/javascript"></script>
<script src="/jmApp/bootstrap-3.3.5-dist/js/bootstrap.min.js"	charset="utf-8" type="text/javascript"></script>
<script src="/jmApp/datepicker/js/bootstrap-datepicker.js"charset="utf-8" type="text/javascript"></script>
<script src="/jmApp/datepicker/locales/bootstrap-datepicker.zh-CN.min.js" charset="utf-8" type="text/javascript"></script>
<script src="/jmApp/bootstrap-fileinput-master/js/fileinput.min.js" charset="utf-8" type="text/javascript"></script>
<script src="/jmApp/bootstrap-fileinput-master/js/locales/zh.js"  charset="utf-8" type="text/javascript"></script>
<script src="/jmApp/jquery-uploader/ajaxfileupload.js"></script>
<script src="/jmApp/sweetalert/dist/sweetalert.min.js"></script>
<script src="/jmApp/cityselect/jquery.cityselect.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.input-daterange').datepicker({
			language : "zh-CN",
			autoclose : true,
		    todayHighlight : true
		});
		   function upload() {
     alert("123123123123")
		         $	.ajaxFileUpload({
					url : '/jmApp/jm/PicAction.action', //url自己写   
					secureuri : false, //这个是啥没啥用  
					type : 'post',
					fileElementId : 'picture',//file标签的id    
					dataType : 'json',//返回数据的类型    
					//data:{name:'logan'},//一同上传的数据   
					success : function(data, status) {
						if (data.imageUrl) {
						    $('#pro_img').attr('src',data.imageUrl + "?tempid=" + Math.random());
							$('#picture')	.replaceWith(	'<input type="file" id="picture" name="picture" style="display:none" onChange="upload()"/>');
						
						} else {
						alert("qwewqewqewqe")
						}
					}
				});
	};
 $(document).ready(function() {
		//点击打开文件选择器    
		$('#upload_btn').on('click', function() {
			//选择文件之后执行上传    
			$("#picture").click();
		});
	});
	 	
});
</script>
<script type="text/javascript">
$(document).ready(
			function() {
				$('tbody a').click(function(e) {e.preventDefault();
					$('tbody a').removeClass('active');
					$(this).addClass('active');
				});
				
		 /* $(document).ready(function() {
		//点击打开文件选择器    
		$('#upload_btn').on('click', function() {
		        $("#picture").click();
			    $('form#xiangmu').attr("action","/jmApp/jm/Pic.action"); 
      	        $('#xiangmu').submit();
        }); 
        }); */
  
 $('#btn_add').click(
						function(e) {
							$('input#code').val("");
							$('input#title').val("");
							$('input#sub_title').val("");
							$('input#target_money').val("");
							$('input#percent').val("");
							$('input#cycle').val("");
							$('input#start').val("");
							$('input#end').val("");
							$('form#xiangmu').attr("action","/jmApp/jm/proAdd.action");
						});
});
</script>
<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="/jmApp/js/jquery-1.7.2.min.js" ></script>
	<script type="text/javascript" src="/jmApp/js/jquery-1.7.2.js" ></script>
	
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top"
		style="background:#FFF; color:#FFF;">
	<div class="container">
		<div class="navbar-header" style="margin-top: 0px;margin-bottom: 10px">
			<a class="navbar-brand" href="/jmApp/jm/AdminMainAction.action"
				style="padding-top: 0"> <img src="/jmApp/img/91_logo.png">
			</a>
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#example-navbar-collapse">
				<span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
		</div>
		<div class="collapse navbar-collapse"
			id="example-navbar-collapse text-center" style="margin-top: 10px">
			<ul class="nav navbar-nav navbar-left ">
				<li><a href="/jmApp/jm/AdminMainAction.action"
					style="font-size: 18px">首页</a></li>
				<li><a href="/jmApp/jm/AdminProjectAction.action"
					style="font-size: 18px">影视众筹</a></li>
				<li><a href="/jmApp/jm/AdminAction.action"
					style="font-size: 18px">项目管理</a></li>
				<!-- <li><a href="projectissue.html" style="font-size: 18px">发行</a></li> -->
				<li><a href="#" style="font-size: 18px">统计分析</a></li>
				<li><a href="/jmApp/release.jsp" style="font-size: 18px">发布消息</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right ">
				<li>
					<div class="btn-group" role="group" aria-label="..."
						style="margin-top: 10px;margin-right: 20px">
						<a href="#" class="btn btn-warning" role="button">你好 管理员</a>
					</div>
				</li>
				<li>
					<div class="btn-group" role="group" aria-label="..."
						style="margin-top: 10px;margin-right: 20px">
						<a  class="btn btn-warning" role="button" id="btn_add">添加新项目</a>
					</div>
				<li>
					<div class="btn-group" role="group" aria-label="..."
						style="margin-top: 10px">
						<form method="post" action="/jmApp/jm/outAction.action">
							<button type="submit" class="btn btn-danger"
								style="margin-right: 20px; margin-left: 20px">退出</button>
						</form>
						<!-- <a href="/jmApp/login.jsp" class="btn btn-danger" role="button">退出</a> --> 
					</div>
				</li>
			</ul>
		</div>
	</div>
	</nav>
	<div class="container-fluid" style="margin-top:80px">
		<div class="row">
			<div class="col-md-3">
				<div class="panel-group" id="accordion" role="tablist"
					aria-multiselectable="true">
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingOne">
							<h4 class="panel-title">
								<s:iterator value="delMap">
									<a id="list-group-item-<s:property value='key'/>"
										href="/jmApp/jm/AdminAction.action?delId=<s:property value='key'/>"
										class="list-group-item  <s:property value='key==#request.del.id?"active":"" '/> ">
										<s:property value='value' />
									</a>
								</s:iterator>
							</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in"
							role="tabpanel" aria-labelledby="headingOne">
							<div class="panel-body">
								<div class="list-group">						
									<s:iterator  value="proMap"  status="s">									
										<a id="list-group-item-<s:property value='key'/>"
											href="/jmApp/jm/AdminAction.action?delId=<s:property value='del.id'/>&proId=<s:property value='key'/>"
											class="list-group-item <s:property value='key==#request.pro.id?"active":"" '/>">
											<s:property value='value' />											
										</a>
									</s:iterator>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-9">
				<div class="panel panel-default">
					<div class="panel-body">
						<!-- Nav tabs -->
						<ul class="nav nav-tabs" role="tablist">
							<li role="presentation" class="active"><a href="#content"
								role="tab" data-toggle="tab">项目内容</a></li>
							<li role="presentation"><a href="#introduction" role="tab"
								data-toggle="tab">项目介绍</a></li>
							<li role="presentation"><a href="#invertion" role="tab"
								data-toggle="tab">项目支持</a></li>
						</ul>
						<!-- Tab panes -->
						<div class="tab-content" style="margin-top: 10px;">
							<div role="tabpanel" class="tab-pane active" id="content">
                                <!-- /jmApp/jm/UpdatePro.action -->
								<form  id="xiangmu" action="/jmApp/jm/UpdatePro.action" class="form-horizontal" method="post" >
								<input id="proId2" name="proId2" type="hidden" value="${pro.id}">
								<%-- <input id="delId2" name="delId2" type="hidden" value="${del.id}"> --%>
								<div class="form-group">
									<label for="code" class="col-sm-2 control-label">编号</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="code" name="code" value="${pro.code}"
												placeholder="项目编号">
										</div>
									</div>
									<div class="form-group">
										<label for="title" class="col-sm-2 control-label">标题</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="title" name="title" value="${pro.title}"
												placeholder="项目标题"/>
										</div>
									</div>
									<div class="form-group">
										<label for="sub_title" class="col-sm-2 control-label">副标题</label> 
										<div class="col-sm-10">
											<input type="text" class="form-control" id="sub_title" name="sub_title" value="${pro.subtitle}"
												 placeholder="副标题" >
										</div>
									</div> 
									<!-- <div class="form-group"> -->
										<label for="pic" class="col-sm-2 control-label">项目图片</label>
										<div class="col-sm-10">
										<div class="col-md-10">
										 <c:choose>
											<c:when test="${pro.picture==null }">
								               <!--  <img id="pro_img" src="/jmApp/img/pic.png"> -->
											</c:when>
											<c:otherwise>
											     <img id="pro_img" src="${pro.picture}"  style="width: 70%;height: 70%">
											</c:otherwise>
											</c:choose>
											<div style="text-align: left;">
											<input type="file" class="form-control" id="picture" name="picture" style="display:none"  onChange="upload()"></input>
										    <button id="upload_btn" class="button" onclick="return ajaxFileUpload();">上传照片</button>
										</div>
										
										</div>
                                        </div> 
								 	<div class="form-group">
										<label for="target_money" class="col-sm-2 control-label">金额</label>
										<div class="col-sm-10">
											<input  value="${pro.target}" type="number" class="form-control" id="target_money" name="target_money"
												placeholder="目标金额">
										</div>
									</div>
									<div class="form-group">
										<label for="percent" class="col-sm-2 control-label">转化率</label>
										<div class="col-sm-10">
											<input type="number" class="form-control" id="percent" name="percent" value="${pro.converted}" 
												placeholder="年转化率">
										</div>
									</div>
									<div class="form-group">
										<label for="percent" class="col-sm-2 control-label">周期</label>
										<div class="col-sm-10">
											<input type="number" class="form-control" id="cycle" name="cycle" value="${pro.period}"
												placeholder="回报周期">
										</div>
									</div>
									 <div >
										<div class="form-group">
											<label for="start" class="col-sm-2 control-label">起始日</label>
											<div class="col-sm-10">
												<input type="date" class="form-control" id="start" name="start" value="${pro.start}"
													 />
											</div>
										</div>
										<div class="form-group">
											<label for="end" class="col-sm-2 control-label">结束日</label>
											<div class="col-sm-10">
												<input type="date" class="input-sm form-control" id="end" name="end" value="${pro.stop}"
													 />
											</div>
										</div>
									</div>  
									<div class="form-group">
										<label for="pic2" class="col-sm-2 control-label">轮播图片</label>
										<div class="col-sm-10">
											<input type="file" class="form-control file" id="pic2" name="pic2"
												data-show-upload="ture">
										</div>
									</div> 
									<div class="form-group">
										<div class="col-md-offset-10 col-md-2">
											<button id="tijiao" type="submit" class="btn btn-default">提交</button>
										</div>
									</div>
								</form>
							</div>
							<div  role="tabpanel" class="tab-pane" id="introduction">
							  <!--  <form  role="form"> -->
								<form id="myform" name="myform" action="<%=path %>/upload" method="post" enctype="multipart/form-data" target="uploadIfr"  >
									<div class="form-group">
										<label for="main_page" class="col-sm-2 control-label">主页压缩文件</label>
										<div class="col-sm-10">
											<input id="main_page" class="form-control file" name="myfile" type="file" >
										</div>
									</div>
								<div class="form-group">
										<label for="safe_page" class="col-sm-2 control-label">安全页压缩文件</label>
										<div class="col-sm-10">
											<input id="safe_page" name="myfile" type="file" class="form-control file" >
										</div>
									</div>
									<div class="form-group">
										<label for="safe_page" class="col-sm-2 control-label">二维码压缩文件</label>
										<div class="col-sm-10">
											<input id="safe_page" name="myfile" type="file" class="form-control file" >
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-offset-10 col-md-2">
											<button  class="btn btn-default">上传</button>
										</div>
									</div>
									</form>
							</div>
							<div role="tabpanel" class="tab-pane" id="invertion">
								<div class="btn-group pull-right" role="group">
									<div id="btn_pro_add" class="btn-group" role="group">
										<button type="button" class="btn btn-default"
											data-toggle="modal" data-target="#studentModal">添加</button>
									</div>
									<div id="btn_pro_edit" class="btn-group" role="group">
										<button type="button" class="btn btn-default"
											data-toggle="modal" data-target="#studentModal">修改</button>
									</div>
									<div id="btn_pro_del" class="btn-group" role="group">
										<button type="button" class="btn btn-default">删除</button>
									</div>

								</div>
<table class="table">
									<thead>
										<tr>
											<th>每份单价</th>
											<th>限额</th>
											<th>描述</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${list}" var="list">
											<tr>
											    <th id="id" hidden="hidden">${list.id}</th>
												<td id="price">${list.price}</td>
												<td id="limited">${list.limited}</td>
												<td id="description">${list.description}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div><!--学生删除表单-->
		<form id="frm_std_del" action="ProjectSupportOptAction" 
			style="display:none">
			<input id="psId" name="projectSupport.id" type="hidden">
			<%-- <input id="proId" name="proId" type="hidden" value="${pro.id}"> --%>
		</form>
		<!--学生添加修改弹出框-->
		<div class="modal fade" id="studentModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="exampleModalLabel">项目信息</h4>
					</div>
					<form id="frm_std" action="AdminAction" method="post">
						<div class="modal-body">
							<input id="psId" name="projectSupport.id" type="hidden">
							<div class="form-group">
								<label for="recipient-name" class="control-label">每份单价:</label>
								<input name="projectSupport.price" type="text"
									class="form-control" id="pprice">
							</div>
							<div class="form-group">
								<label for="message-text" class="control-label">限额:</label> <input
									name="projectSupport.limited" type="text" class="form-control"
									id="plimited"></input>
							</div>
							<div class="form-group">
								<label for="birth-text" class="control-label">描述:</label> <input
									name="projectSupport.description" type="text"
									class="form-control" id="pdescription"></input>
							</div>
						</div>
						<div class="modal-footer">
							<button id="resetBtn" type="button" class="btn btn-default"
								data-dismiss="modal">取消</button>
							<button type="submit" class="btn btn-primary">确定</button>
							<%-- <input id="proId" name="proId" type="hidden" value="${project.id}"> --%>
						</div>
					</form>
				</div>
			</div>
		</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$('tbody tr').click(function(e) {
			e.preventDefault();

			$('tbody tr').removeClass('success');
			$(this).addClass('success');
		});
		$('#btn_pro_del').click(function(e) {
		   var id = $('tr.success').children("#id").text();
		   var price = $('tr.success').children("#price").text();
			swal({
				title : "删除",
				text : "你确定删除 " +id+ " ？",
				type : "warning",
				showCancelButton : true,
				confirmButtonColor : "#DD6B55",
				confirmButtonText : "是的, 删除它!",
				cancelButtonText : "取消",
				closeOnConfirm : false
			}, function() {
				$('input#psId').val(id);
				$('form#frm_std_del').attr("action", "/jmApp/jm/Del.action");
				$('form#frm_std_del').submit();
			});
		});

		$('#btn_pro_add').click(function(e) {
			$('input#psId').val("");
			$('input#pprice').val("");
			$('input#plimited').val("");
			$('input#pdescription').val("");
			$('form#frm_std').attr("action", "/jmApp/jm/Add.action");
		});

		$('#btn_pro_edit').click(function(e) {

			var price = $('tr.success').children("#price").text();
			var limited = $('tr.success').children("#limited").text();
			var description = $('tr.success').children("#description").text();
			var id = $('tr.success').children("#id").text();
			$('input#psId').val(id);
			$('input#pprice').val(price);
			$('input#plimited').val(limited);
			$('input#pdescription').val(description);
			$('form#frm_std').attr("action", "/jmApp/jm/Edit.action");
		});

	});
</script>
<script type="text/javascript">
	/* $('#pic').fileinput({
        language: 'zh',
        showUpload:false,
        allowedFileExtensions : ['jpg', 'png','gif'],
        initialPreview:[
             "<img src='/jmApp/project/${pro.picture }' width='500px' class='file-preview-image' alt='Desert' title='Desert'>"
        ]
    }); */
    $('#pic2').fileinput({
        language: 'zh',
        showUpload:false,
        allowedFileExtensions : ['jpg', 'png','gif'],
    });
    $('#main_page').fileinput({
        language: 'zh',
        showUpload:false,
        allowedFileExtensions : ['zip']
    });
    $('#safe_page').fileinput({
        language: 'zh',
        showUpload:false,
        allowedFileExtensions : ['zip']
    }); 
    $('#qr_pic').fileinput({
        language: 'zh',
        showUpload:false,
        allowedFileExtensions : ['jpg', 'png','gif'],
    });
</script>
</html>