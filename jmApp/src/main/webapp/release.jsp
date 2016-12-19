<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" type="text/css"
	href="/jmApp/bootstrap-3.3.5-dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="/jmApp/datepicker/css/bootstrap-datepicker3.css">
<link rel="stylesheet" type="text/css"
	href="/jmApp/bootstrap-fileinput-master/css/fileinput.min.css"
	charset="utf-8">
<script src="/jmApp/bootstrap-3.3.5-dist/js/jquery.min.js"
	charset="utf-8" type="text/javascript"></script>
<script src="/jmApp/bootstrap-3.3.5-dist/js/bootstrap.min.js"
	charset="utf-8" type="text/javascript"></script>
<script src="/jmApp/datepicker/js/bootstrap-datepicker.js"
	charset="utf-8" type="text/javascript"></script>
<script
	src="/jmApp/datepicker/locales/bootstrap-datepicker.zh-CN.min.js"
	charset="utf-8" type="text/javascript"></script>
<script src="/jmApp/bootstrap-fileinput-master/js/fileinput.min.js"
	charset="utf-8" type="text/javascript"></script>
<script src="/jmApp/bootstrap-fileinput-master/js/locales/zh.js"
	charset="utf-8" type="text/javascript"></script>

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
						<a href="#" class="btn btn-warning" role="button">添加新项目</a>
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
		<div class="tab-content" style="margin-top: 10px;">
							<div role="tabpanel" class="tab-pane active" id="content">

								<form  action="/jmApp/jm/ReleaseAction.action" class="form-horizontal" role="form">
									
									<div class="form-group">
										<label for="title" class="col-sm-2 control-label">标题</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="title" name="title" value=""
												placeholder="消息标题">
										</div>
									</div>
									<div class="form-group">
										<label for="title" class="col-sm-2 control-label">内容</label>
										<div class="col-sm-10">
											<input style="height:300px;" type="text" class="form-control" id="content" name="content" value=""
												placeholder="消息内容">
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-offset-10 col-md-2">
											<button type="submit" class="btn btn-default">发送</button>
										</div>
									</div>
								</form>

							</div>
		</div>
</body>

</html>