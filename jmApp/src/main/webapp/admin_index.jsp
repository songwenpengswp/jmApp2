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
<title>电影众筹项目_电影投资项目列表 - 91九马网</title>
<link rel="stylesheet" type="text/css"
	href="/jmApp/bootstrap-3.3.5-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/jmApp/circle_progress/css/progress.css">
<link rel="stylesheet" href="/jmApp/css/style.css">
<style type="text/css">
.pie_progress {
	width: 120px;
}

@media all and (max-width: 768px) {
	.pie_progress {
		width: 80%;
		max-width: 300px;
	}
}
</style>
<script src="/jmApp/bootstrap-3.3.5-dist/js/jquery.min.js"></script>
<script src="/jmApp/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="/jmApp/circle_progress/dist/jquery-asPieProgress.min.js"></script>
<body>
	<%-- <jsp:include page="header.jsp"></jsp:include> --%>
	<nav class="navbar navbar-default navbar-fixed-top"
	style="background:#FFF; color:#FFF;">
     <div class="container">
		<div class="navbar-header"
			style="margin-top: 0px;margin-bottom: 10px">
			<a class="navbar-brand" href="/jmApp/jm/AdminMainAction.action" style="padding-top: 0"> <img
				src="/jmApp/img/91_logo.png">
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
				<li><a href="/jmApp/jm/AdminProjectAction.action" style="font-size: 18px">影视众筹</a></li>
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
						style="margin-top: 10px">
						
							<form method="post" action="/jmApp/jm/outAction.action">
		                      <button type="submit" class="btn btn-danger" style="margin-right: 20px; margin-left: 20px">退出
		                      </button>
		                    </form>
								<!-- <a href="/jmApp/login.jsp" class="btn btn-danger" role="button">退出</a> -->
							

					</div>
				</li>
			</ul>
		</div>
	</div>
</nav>
	
	
	
	<div id="91-carousel" class="carousel slide" style="margin-top: 50px">
		<ol class="carousel-indicators">
			<c:forEach begin="0" end="${carList.size()-1}" var="num">
				<li data-target="#91-carousel" data-slide-to="${num}"
					class="${num==0?'active':'' }"></li>
			</c:forEach>
		</ol>
		<div class="carousel-inner">
			<c:forEach items="${carList}" var="project" varStatus="s">
				<div class="item ${s.index==0?'active':'' }">
					<a href="/jmApp/jm/DetailAction.action?proId=${project.id}">
					<img src="/jmApp/project/${project.carousel}" alt="" style="height:100%;"></a>
				</div>
			</c:forEach>
		</div>
		<a class="carousel-control left" href="#91-carousel" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span>
		</a> <a class="carousel-control right" href="#91-carousel"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right"></span>
		</a>
	</div>
	<div style="background: #f5f5f5">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<h1>九马推荐</h1>
				</div>
				<div class="col-md-3 pull-right text-right" style="margin-top: 20px">
					<a role="button" class="btn btn-large btn-warning"
						href="/jmApp/jm/ProjectAction.action">查看全部 <i
						class="glyphicon glyphicon-chevron-right"></i></a>
				</div>
			</div>
		</div>
		<div class="container" style="margin-top: 10px;">
			<ul class="media-list">
				<c:forEach items="${proInList}" var="project">
					<li class="media" style="background: #fff">
						<div class="course-list-img">
							<a class="pull-left"
								href="/jmApp/jm/DetailAction.action?proId=${project.id}"> <img
								class="media-object img_4"
								src="/jmApp/project/${project.picture}" alt="" width="500px"
								style="margin: 15px;">
							</a>
						</div>
						<div class="media-body">
							<h4 class="media-heading"
								style="margin-top: 20px;margin-left: 20px">${project.title}</h4>
							<p class="text-muted" style="margin-top: 20px;margin-left: 20px">${project.subtitle}</p>
							<div class="row" style="margin-top: 65px;margin-left: 15px">
								<div class="col-md-3">
									<div class="pie_progress" role="progressbar"
										data-goal="${project.investRate}" data-barcolor="#FF7300"
										data-barsize="20" aria-valuemin="0" aria-valuemax="100">
										<div class="pie_progress__number"
											style="font-size: 35px;color: #FF7300">${project.investRate}%</div>
									</div>
								</div>
								<div class="col-md-9">
									<div class="row">
										<div class="col-md-3">
											<p class="text-center text-muted">预期年化收益</p>
											<h3 class="text-center" style="color: #FF7300">
												<strong>${project.converted}%</strong>
											</h3>

										</div>
										<div class="col-md-1 text-right">|</div>
										<div class="col-md-4">
											<p class="text-center text-muted">回报周期</p>
											<h3 class="text-center" style="color: #FF7300">
												<strong>${project.period}个月</strong>
											</h3>
										</div>
										<div class="col-md-1">|</div>
										<div class="col-md-3">
											<p class="text-center text-muted">距众筹结束</p>
											<h3 class="text-center" style="color: #FF7300">
												<strong>${project.remainTime<0?0:project.remainTime}天</strong>
											</h3>
										</div>
									</div>
									<div class="row">
										<div class="col-md-4 pull-right text-right">
											<button type="button"
												class="btn btn-large ${project.remainTime>0?'btn-warning':'' }"
												${project.remainTime<0?'disabled':'' } style="width: 100%">参与众筹</button>
										</div>
										<div class="col-md-8 pull-right">
											<h6 class="text-muted text-right">围观（${project.onlookers}）
												| 评论（0）</h6>
										</div>

									</div>
								</div>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	  <%--
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<h1>转让项目</h1>
				</div>
				<div class="col-md-3 pull-right text-right" style="margin-top: 20px">
					<a role="button" class="btn btn-large btn-warning"
						href="invest.html">查看全部 <i
						class="glyphicon glyphicon-chevron-right"></i></a>
				</div>
			</div>
		</div>
		<div class="container" style="background: #fff">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>转让项目名称</th>
						<th>出让本金(元)</th>
						<th>出让价格(元)</th>
						<th>预期年化</th>
						<th>剩余期限</th>
						<th>状态ssssss</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${orderList}" var="order">
						<tr>
							<td>${order.project.title }</td>
							<td>${order.investment }</td>
							<td><font color="#FF7300">${order.assign }</font></td>
							<td>${order.project.converted }%</td>
							<td>${order.project.remainTime}天</td>
							<td>转让中</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	  --%>
	  
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<h1>成功项目</h1>
				</div>
				<div class="col-md-3 pull-right text-right" style="margin-top: 20px">
					<a role="button" class="btn btn-large btn-warning"
						href="/jmApp/jm/ProjectAction.action?status=2">查看全部 <i
						class="glyphicon glyphicon-chevron-right"></i></a>
				</div>
			</div>
			<div class="row">
				<c:forEach items="${proEndList}" var="project">
					<div class="col-md-4">
						<div class="thumbnail "><!-- course-list-img -->
							<a href="/jmApp/jm/DetailAction.action?proId=${project.id}"><img class="img_3"
								src="/jmApp/project/${project.picture}"></a>
							<div class="caption text-center">
								<h3>
									<b>${project.title}</b>
								</h3>
	<!-- project.investSum/10000 -->	<h4>以募资金：￥${project.investSum==null?0:project.investSum/10000}万 |
									以募支持者：${project.prorders.size()}人</h4>
							</div>
						</div>
					</div>
				</c:forEach>
				
		</div>
		<%-- <jsp:include page="tailer.jsp"></jsp:include> --%>
	</div>
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$('.pie_progress').asPieProgress({
				namespace : 'pie_progress'
			});

			// Example with grater loading time - loads longer
			$('.pie_progress--slow').asPieProgress({
				namespace : 'pie_progress',
				goal : 1000,
				min : 0,
				max : 1000,
				speed : 200,
				easing : 'linear'
			});

			// Example with grater loading time - loads longer
			$('.pie_progress--countdown').asPieProgress({
				namespace : 'pie_progress',
				easing : 'linear',
				first : 120,
				max : 120,
				goal : 0,
				speed : 1200, // 120 s * 1000 ms per s / 100
				numberCallback : function(n) {
					var minutes = Math.floor(this.now / 60);
					var seconds = this.now % 60;
					if (seconds < 10) {
						seconds = '0' + seconds;
					}
					return minutes + ': ' + seconds;
				}
			});

			$('.pie_progress').asPieProgress('start');
		});
	</script>
</body>
</html>
