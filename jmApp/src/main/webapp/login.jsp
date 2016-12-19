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
<link rel="stylesheet" href="/jmApp/circle_progress/css/progress.css">
<link rel="stylesheet"
	href="/jmApp/bootstrapvalidator/css/bootstrapValidator.min.css" />
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
			style="background: url(/jmApp/img/images10.png) no-repeat;height: 500px;">
			<div class=" col-md-offset-8"
				style="margin-top: 3%;background-color:black;width: 350px;height:400px;background-color: rgba(0, 0, 0, 0.3);border-radius:4px">

				<div class="container">
					<h3>
						<font color="white"> 用户登陆 
					  <c:if test="${success==0}">
			     	   (注册成功 请登陆)
			     	 </c:if>
			     	 <c:choose>
			     	    <c:when test="${success==1 }">
			     	        (该手机号码未注册)
			     	    </c:when>
			     	    <c:when test="${success==2 }">
			     	        (密码输入错误)
			     	    </c:when>
			     	 </c:choose>
						</font>
					</h3>

					 <form id="login_frm" role="form" action="/jmApp/jm/LoginAction.action">
			     	    <div class="form-group">
			     	       <input id="tel" name="tel" class="form-control" id="exampleInputEmail1" placeholder="手机号码">
			     	       <span id="tel_message"></span>
			     	    </div>
			     	 	<div class="form-group">
			     	 	     <input type="password" id="password" name="password" class="form-control" id="exampleInputEmail1" placeholder="登陆密码">
			     	 	     <span id="password_message"></span>
			     	 	</div>
			     	 	 <div class="text-right" style="margin-top: 20px">
			     	 	 	 <a href="/jmApp/password.jsp"><h5><font color="white">忘记密码?</font></h5></a>
			     	 	 </div>
			     	 	 <div style="margin-top: 80px">
			     	 	 </div>
			     	 	 <div class="row" style="margin-left: 4px;margin-right: 4px">
			     	 	    <!--
			     	 	 	 <button type="submit" class="btn btn-warning col-md-12"><font size="4px" ><b>立即登陆</b></font></button>
			     	 	 	 -->
			     	 	 	<button type="submit" class="btn btn-warning col-md-12" style="font-size: 18px;font-weight:bold">
								立即登陆
							</button>
			     	 	 </div>
			     	 	 <div class="row" style="margin-top: 20px;margin-left: 4px;margin-right: 4px">
			     	 	 	 <a class="btn btn-success col-md-12" href="/jmApp/register.jsp" role="button"><font size="4px" ><b>用户注册</b></font></a>
			     	 	 </div>
			     	 </form>
				</div>

			</div>
		</div>

		<div class="container">
			<div class="row" style="margin-top: 50px">
				<jsp:include page="tailer.jsp"></jsp:include>
	</div>
	<script src="/jmApp/bootstrap-3.3.5-dist/js/jquery.min.js"></script>
	<script src="/jmApp/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="/jmApp/circle_progress/dist/jquery-asPieProgress.min.js"></script>
	<script src="/jmApp/bootstrapvalidator/js/bootstrapValidator.js"></script>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$('#login_frm').bootstrapValidator({

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
				}
			}
		});
	});
</script>
</html>