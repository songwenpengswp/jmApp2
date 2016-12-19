<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   	<div role="tabpanel" class="tab-pane active" id="content">

								<form  action="/jmApp/jm/UpdatePro.action" class="form-horizontal" role="form">
									<div class="form-group">
										<label for="code" class="col-sm-2 control-label">编号</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="code" value="${pro.id}"
												placeholder="项目编号">
										</div>
									</div>
									<div class="form-group">
										<label for="title" class="col-sm-2 control-label">标题</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="title" value="${pro.title}"
												placeholder="项目标题">
										</div>
									</div>
									<div class="form-group">
										<label for="sub_title" class="col-sm-2 control-label">副标题</label> 
										<div class="col-sm-10">
											<input type="text" class="form-control" id="sub_title" value="${pro.subtitle}"
												 placeholder="副标题" >
										</div>
									</div>
									<div class="form-group">
										<label for="pic" class="col-sm-2 control-label">项目图片</label>
										<div class="col-sm-10">
											<input value="${pro.picture}" type="file" class="form-control file" id="pic" >
										</div>
									</div>
									<div class="form-group">
										<label for="target_money" class="col-sm-2 control-label">金额</label>
										<div class="col-sm-10">
											<input  value="${pro.target}" type="number" class="form-control" id="target_money"
												placeholder="目标金额">
										</div>
									</div>
									<div class="form-group">
										<label for="percent" class="col-sm-2 control-label">转化率</label>
										<div class="col-sm-10">
											<input type="number" class="form-control" id="percent" value="${pro.converted}" 
												placeholder="年转化率">
										</div>
									</div>
									<div class="form-group">
										<label for="percent" class="col-sm-2 control-label">周期</label>
										<div class="col-sm-10">
											<input type="number" class="form-control" id="cycle" value="${pro.period}"
												placeholder="回报周期">
										</div>
									</div>
									<div class="input-daterange input-group" id="datepicker">
										<div class="form-group">
											<label for="start" class="col-sm-2 control-label">起始日</label>
											<div class="col-sm-10">
												<input type="text" class="input-sm form-control" id="start" value="${pro.start}"
													name="start" />
											</div>
										</div>
										<div class="form-group">
											<label for="end" class="col-sm-2 control-label">结束日</label>
											<div class="col-sm-10">
												<input type="text" class="input-sm form-control" id="end" value="${pro.stop}"
													name="end" />
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="pic2" class="col-sm-2 control-label">轮播图片</label>
										<div class="col-sm-10">
											<input type="file" class="form-control file" id="pic2"
												data-show-upload="false">
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-offset-10 col-md-2">
											<button type="submit" class="btn btn-default">提交</button>
										</div>
									</div>
								</form>

							</div>
  </body>
</html>
