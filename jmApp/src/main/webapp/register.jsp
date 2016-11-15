<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>电影众筹项目_电影投资项目列表 - 91玖马网</title>
<link rel="stylesheet" type="text/css"
	href="/jmApp/bootstrap-3.3.5-dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/jmApp/bootstrapvalidator/css/bootstrapValidator.min.css" />
<link rel="stylesheet" href="/jmApp/circle_progress/css/progress.css">
<script src="/jmApp/bootstrap-3.3.5-dist/js/jquery.min.js"></script>
<script src="/jmApp/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
<script src="/jmApp/bootstrapvalidator/js/bootstrapValidator.js"></script>
<script src="/jmApp/jquery-countdown/jquery.countdown-2.2.0.js"></script>
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top"
		style="background:#FFF; color:#FFF">
		<div class="container">
			<div class="navbar-header"
				style="margin-top: 10px;margin-bottom: 10px">
				<a class="navbar-brand" href="#" style="padding-top: 0"> <img
					src="/jmApp/img/91_logo.png">
				</a>
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#example-navbar-collapse">
					<span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
			</div>
	</nav>
	<div style="background: #f5f5f5">
		<div class="jumbotron"
			style="background: url(/jmApp/img/registerBanner.jpg) no-repeat;height: 650px;">
			<div class="col-md-8 col-md-offset-4 col-center-block"
				style="margin-top: 30px">
				<form id="register_frm" class="form-horizontal"
					action="/jmApp/jm/Register.action" method="post">
					<h3 class="form-signin-heading">
						<font color="white"><b>用户注册
						<c:choose>
						   <c:when test="${error==1}">
						      <b>(手机号码错误)</b>
						   </c:when>
						   <c:when test="${error==2}">
						      <b>(验证码错误)</b>
						   </c:when>
						</c:choose>
						</b></font>
					</h3>

					<div class="form-group" style="margin-top: 20px">
						<div class="col-md-6">
							<input type="text" id="tel" name="tel" class="form-control"
								placeholder="手机号码">
						</div>
						<div class="col-md-5">
							<span id="tel_message" style="font-size: 20px;color: #000"></span>
						</div>
					</div>
					<div class="form-group" style="margin-top: 20px">
						<div class="col-md-6">
							<input type="text" id="password" name="password"
								class="form-control" placeholder="登陆密码">
						</div>
						<div class="col-md-5">
							<span id="password_message" style="font-size: 20px"></span>
						</div>
					</div>
					<div class="form-group" style="margin-top: 20px">
						<div class="col-md-6">
							<div class="input-group">
								<input type="text" class="form-control" id="code" name="code"
									placeholder="短信验证码"> <span class="input-group-btn"><button
										id="code_btn" type="button" class="btn btn-warning">获取校验码</button>
								</span>
							</div>
						</div>
						<div class="col-md-5">
							<span id="code_message" style="font-size: 20px"></span>
						</div>
					</div>
					<div class="form-group" style="margin-top: 20px">
						<div class="col-md-2">
							<div class="checkbox">
								<label><input type="checkbox" id="yes"> <font
									color="white">已阅读并同意</font></label>
							</div>
						</div>
						<script type="text/javascript">
(function(){
var cb=document.getElementById("yes");
cb.onclick=function(){
    if(cb.checked==true){
        document.getElementById("zhuce").disabled=false;
    }
    else{
        document.getElementById("zhuce").disabled=true;
    }
}
})();
</script>
						<div class="col-md-4" style="margin-top: 1%">
							<a href="/jmApp/agreement.jsp"><font color="yellow">《91玖马金融服务协议》</font></a>
						</div>
					</div>

					<div class="form-group">
						<div class="col-md-6">
							<button id="zhuce" type="submit" class="btn btn-primary col-md-12"
								style="font-size: 18px;font-weight:bold">现在注册</button>
						</div>
					</div>
					<div class="form-group" style="margin-top: 20px">
						<div class="col-md-6">
							<a href="/jmApp/login.jsp" role="button" class="btn btn-success col-md-12">
								<font size="3px"><b>已有账号，去登陆</b></font>
							</a>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="container" style="margin-top: 50px">
			<jsp:include page="tailer.jsp"></jsp:include>
			</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$('#register_frm').bootstrapValidator({

			feedbackIcons : {
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			fields : {

				tel : {
					container : '#tel_message',
					validators : {
						notEmpty : {
							message : '手机号码不能为空'
						},
						regexp : {
							regexp : /^1[3|4|5|7|8][0-9]{9}$/,
							message : '手机号码输入错误'
						},
						threshold : 11, //有11字符以上才发送ajax请求，（input中输入一个字符，插件会向服务器发送一次，设置限制，6字符以上才开始）
						remote : {//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}  
							url : '/jmApp/jm/TelValidate.action',//验证地址
							message : '手机号码已注册',//提示消息
							delay : 1000,//每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
							type : 'POST'//请求方式
						}
					}

				},
				password : {
					container : '#password_message',
					validators : {
						notEmpty : {
							message : '密码不能为空'
						},
						regexp : {
							regexp : /^(\w){6,20}$/,
							message : '只能输入6-20个字母、数字、下划线'
						}
					}
				},
				code : {
					container : '#code_message',
					validators : {
						notEmpty : {
							message : '验证码不能为空'
						},
						regexp : {
							regexp : /^[0-9]{4}$/,
							message : '验证码输入错误'
						},
						identical : {
							field : 'rcode',
							message : '验证码输入错误'
						}
					}
				}
			}
		});
		$('#code_btn').click(function(event){
           $(this).attr('disabled','true');
           var fiveSeconds = new Date().getTime() + 2*60*1000;
           $('#code_btn').countdown(fiveSeconds, function(event) {
             $(this).html(event.strftime('%M:%S'));
           }).on('finish.countdown', function(event){
              $('#code_btn').removeAttr('disabled');
              $('#code_btn').text('获取校验码');
          });
          $.ajax({
              url:'/jmApp/jm/CodeCreate.action',
              dataType:'json',
              data:{'tel':$('input#tel').val()},
              type:'post'
          });
      });
	});
</script>
</html>