<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
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
<link rel="stylesheet" href="/jmApp/css/style.css">
<link rel="stylesheet" href="/jmApp/css/spinner.css">
<link rel="stylesheet"
	href="/jmApp/font-awesome-4.5.0/css/font-awesome.min.css">
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
<script src="/jmApp/jquery-uploader/ajaxfileupload.js"></script>
<script src="/jmApp/bootstrap-3.3.5-dist/js/jquery.min.js"></script>
<script src="/jmApp/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
<script src="/jmApp/bootstrap-3.3.5-dist/js/jquery.backstretch.min.js"></script>
<script src="/jmApp/bootstrap-3.3.5-dist/js/jquery.countdown.js"></script>
<script src="/jmApp/circle_progress/dist/jquery-asPieProgress.min.js"></script>
<script src="/jmApp/js/spinner.js"></script>
<script src="/jmApp/bootstrap-3.3.5-dist/js/scripts.js"></script>
<script type="text/javascript" language="javascript">
	function iFrameHeight() {
		var ifm = document.getElementById("iframepage");
		var subWeb = document.frames ? document.frames["iframepage"].document
				: ifm.contentDocument;
		if (ifm != null && subWeb != null) {
			ifm.height = subWeb.body.scrollHeight;
			ifm.width = subWeb.body.scrollWidth;
		}
	}

	function iFrameHeight2() {
		var ifm = document.getElementById("iframepage2");
		var subWeb = document.frames ? document.frames["iframepage2"].document
				: ifm.contentDocument;
		if (ifm != null && subWeb != null) {
			ifm.height = subWeb.body.scrollHeight;
			ifm.width = subWeb.body.scrollWidth;
		}
	}
</script>
<script type="text/javascript">
	$(document).ready(function() {
		var now = new Date();
		var jnow = ${project.stop.getTime()};
		var countTo = jnow;
		$('.timer').countdown(countTo, function(event) {
			var $this = $(this);
			switch (event.type) {
			case "seconds":
			case "minutes":
			case "hours":
			case "days":
			case "weeks":
			case "daysLeft":
				$this.find('span.' + event.type).html(event.value);
				break;
			case "finished":
				$this.hide();
				break;
			}
		});
	});
</script>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div style="background: #f5f5f5">
		<div style="background: #f5f5f5;overflow: hidden;">
			<div class="container"
				style="background: #fff;width: 80%;margin-top: 100px;margin-bottom: 20px">
				<h4 style="font-weight:bold;">${project.title}</h4>
				<p class="text-muted"="font-size: 15px">${project.formatStart}-${project.formatStop}</p>
				<div class="media"
					style="borde r:solid 1px #e9e9e9;margin-bottom: 30px">
					<div class="media-left">
						<img class="media-object" src="/jmApp/project/${project.picture}"
							style="height: 493px;width: 600px">
					</div>
					<div class="media-body">
						<div class="investDetailBadge">
							<span>火热筹集中</span>
						</div>
						<div class="investDetailInfo">
							<ul>
								<li>目标金额：<em>￥${project.target/10000}万元</em></li>
								<li>预计年化：<span>${project.converted}%</span></li>
								<li>成功金额：<em>￥${project.target/10000}万元</em></li>
								<li>回报周期：<span>${project.period}月</span></li>
							</ul>
							<div class="description">（众筹达到成功金额，项目视为成功）</div>
						</div>

						<div class="investDetailInfo">
							<span style="font-size:20px;font-weight:normal;color:#666;">已募集:</span>
							<p style="font-size:36px;color:#FF7300;line-height:60px;">￥${project2.investSum==null?0:project2.investSum}元</p>
						</div>
						<div class="progress"
							style="margin-top: 10px;width: 96%;height: 15px">
							<div
								class="progress-bar progress-bar-warning progress-bar-striped"
								role="progressbar" aria-valuenow="${project.investRate}"
								aria-valuemin="0" aria-valuemax="100"
								style="width: ${project.investRate}%">
								<span class="sr-only">${project.investRate}% Complete
									(warning)</span> <br /> <span>${project.investRate}%</span>
							</div>
						</div>
						<div class="timer">
							<p class="text-muted" style="font-size:15px;">
								距离众筹结束还有: <span><em><font color="#f17a00"> <span
											id="days"></span> 天 <span id="hours"></span> 小时 <span
											id="minutes"></span> 分 <span id="seconds"></span> 秒
									</font></em></span>
							</p>
						</div>
						<div class="investDetailSupport">
							<ul>
								<li><img src="/jmApp/img/support.png" alt="支持"> (支持)
									<span>${project.prorders.size()}</span> 人</li>
								<li><img src="/jmApp/img/circle.png" alt="支持"> (围观) <span>${project.onlookers}</span>
									人</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div style="background: #f5f5f5;">
			<div class="container"
				style="background: #f5f5f5;width: 83%;margin-top: 30px;margin-bottom: 20px">
				<div class="main-left" style="background: #fff;margin-top: 20px">
					<!-- Nav tabs -->
					<ul class="nav nav-pills" role="tablist"
						style="margin-top: 10px;margin-left: 10px">
						<li role="presentation" class="active"><a href="#home"
							aria-controls="home" role="tab" data-toggle="tab"
							style="font-size: 17px">项目主页</a></li>
						<li role="presentation"><a href="#profile"
							aria-controls="profile" role="tab" data-toggle="tab"
							style="font-size: 17px" onclick="iFrameHeight2()">风险提示</a></li>
						<li role="presentation"><a href="#messages"
							aria-controls="messages" role="tab" data-toggle="tab"
							style="font-size: 17px">支持者</a></li>
						<c:forEach items="${count}" var="count">
							<li role="presentation"><a href="#settings"
								aria-controls="settings" role="tab" data-toggle="tab"
								style="font-size: 17px">评论(${count})</a></li>
						</c:forEach>
					</ul>

					<!-- Tab panes -->
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane active" id="home"
							style="margin: 20px;"></div>
						<div role="tabpanel" class="tab-pane" id="profile"
							style="margin: 20px;"></div>


						<div role="tabpanel" class="tab-pane" id="messages">
							<div class="row" style="padding-top: 20px;">
								<c:forEach items="${prorder}" var="pror">
									<div class="col-md-6" style="padding-left: 35px;">

										<div class="media" style="padding: 20px;background: #f5f5f5;">


											<div class="media-left">
												<img class="media-object img-circle"
													style="height:80px;width:80px;" src="${pror.user.picture}">
											</div>
											<div class="media-body">
												<h3 class="media-heading" style="padding-left: 20px;">
													<b>${pror.user.name}</b>
												</h3>
												<h5 style="padding-top: 10px;padding-left: 20px;">
													投资金额：<font color="#f17a00">${pror.investment}</font>
												</h5>
												<h5 style="padding-left: 20px;">投资时间：${pror.buyDate}</h5>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>

							<div class="row" style="margin-top: 30px;"></div>
						</div>
						<div role="tabpanel" class="tab-pane" id="settings">
							<form id="info_frm" action="/jmApp/jm/saveAction.action" method="post">
								<div class="container"
									style="width: 700px;padding-left: 10px;padding-top: 20px;padding-bottom: 30px;">
									<textarea id="title" name="title" class="form-control" rows="7"></textarea>
									<button id="info_btn" type="submit" class="btn btn-info pull-right"
										style="margin-top: 10px;width: 150px;">发表</button>
								</div>
							</form>
							<%-- <c:forEach items="${com}" var="comments"> --%>
							<s:iterator value="#request.com" id="comments">
								<div
									style="width:100%;height:1px;margin:0px auto;padding:0px;background-color:#D5D5D5;overflow:hidden;"></div>
								<table style="width: 100%">
									<tr>
										<td
											style="background: #f5f5f5;width: 17%;text-align: center;vertical-align: top;">
											<%-- <img src=${comments.user.picture } alt=""
											style="height: 70px;margin-top: 10px;"> --%> <c:choose>
												<c:when test="${comments.user.picture==null }">
													<img class="media-object" src="/jmApp/img/pic.png"
														style="height: 70px;width:130px;margin-top: 10px;">
												</c:when>
												<c:otherwise>
													<img class="media-object" src="${comments.user.picture}"
														style="height: 100px;width:130px;margin-top: 10px;">
												</c:otherwise>
											</c:choose>
											<h6 style="text-align: center;">
												<font color="#f17a00">${comments.user.name }</font>
											</h6>
										</td>
										<td>
											<div style="min-height: 150px;">
												<p style="margin-top: 15px;margin-left: 15px;">${comments.content}</p>
											</div>
											<div class="row">
												<div class="col-md-10" style="text-align: right;">
													<p>${comments.includeDate}</p>
												</div>
												<div class="col-md-2">
													<div
														style="background: #f5f5f5;min-height: 10px;margin-right: 10px;text-align: center;">
														<a data-toggle="collapse" href="#${comments.id}"
															aria-expanded="false" aria-controls="collapseExample"><p>回复</p></a>
													</div>
												</div>
											</div>
											<div class="collapse" id="${comments.id}">

												<div class="well"
													style="margin-left: 15px;margin-right: 10px;">
													<s:iterator value="#comments.replies" id="reply">
														<div class="media">

															<div class="media-left">
																<!-- <a href="#"> <img class="media-object"
																	src="img\default.jpg" style="height: 50px;">
																</a> -->
																<c:choose>
																	<c:when test="${reply.user.picture==null}">
																		<img class="media-object" src="/jmApp/img/pic.png"
																			style="height:50px;width:50px">
																	</c:when>
																	<c:otherwise>
																		<img class="media-object" src="${reply.user.picture}"
																			style="height:50px;width:50px">
																	</c:otherwise>
																</c:choose>
															</div>
															<div class="media-body">
																<h5 class="media-heading">
																	<font color="#389BEA"> <s:property
																			value="#reply.user.name" /></font>回复<font color="#389BEA">${comments.user.name }</font>:
																	<s:property value="#reply.content" />
																</h5>
																<h5 class="text-muted pull-right">
																	<s:property value="#reply.includeDate" />
																	回复
																</h5>
															</div>
														</div>

														<div
															style="width:100%;height:1px;margin:0px auto;padding:0px;background-color:#D5D5D5;overflow:hidden;"></div>
													</s:iterator>
												</div>
												<div
													style="width:100%;height:1px;margin:0px auto;padding:0px;background-color:#D5D5D5;overflow:hidden;"></div>
												<div class="media">
													<div class="media-body">
														<a class="btn btn-default pull-right" role="button"
															data-toggle="collapse" href="#${comments.id}1"
															aria-expanded="false" aria-controls="collapseExample2">我也说一句</a>
													</div>
												</div>
												<form action="/jmApp/jm/replyAction.action">
													<div class="collapse" id="${comments.id}1"
														style="margin-top: 10px;">
														<textarea id="title" name="title" class="form-control"
															rows="5"></textarea>
														<input id="commentsId" name="commentsId" type="hidden"
															value="${comments.id}">
														<div class="media">
															<div class="media-body">
																<button id="commentsId=${comments.id}" type="submit"
																	class="btn btn-info pull-right">发表</button>
															</div>
														</div>
													</div>
												</form>

											</div>
										</td>
									</tr>
								</table>
								<%-- </c:forEach> --%>
							</s:iterator>
						</div>
					</div>
				</div>
				<div class="main-right">
					<div
						style="background: #fff;margin-top: 20px;border-style:solid; border-width:1px; border-color:#D5D5D5">
						<h4 style="margin-left: 10px;margin-top: 30px;">项目发起方</h4>
						<div class="line-blue"></div>
						<div class="media" style="margin: 10px;margin-top: 20px;">
							<div class="media-left">
								<a href="//www.jzmys.net"> <img
									class="media-object img-circle"
									src="/jmApp/project/${project.deliver.logo}"
									style="height: 60px;width: 60px;">
								</a>
							</div>
							<div class="media-body">
								<a href="//www.jzmys.net">
									<h4 class="media-heading"
										style="font-weight:bold;color:#FF7300;">${project.deliver.name}</h4>
								</a>
							</div>
							<p class="pull-right" style="margin-right: 10px;">已发起${project.deliver.projects.size()}个项目</p>
						</div>
					</div>
					<c:forEach items="${project.projectSupports}" var="support">
						<div id="support"
							style="background: #fff;margin-top: 20px;border-style:solid; border-width:1px; border-color:#D5D5D5">
							<p style="margin-top: 20px;margin-left: 10px;">
								<span id="price" style="font-size: 20px;">￥${support.price}</span><span>/份</span>
								<%-- <span
									class="pull-right" style="margin-right: 10px;">已支持3份</span> --%>
							</p>
							<div class="line-blue"></div>
							<div style="margin-left: 15px;margin-top: 15px;">
								<span class="label label-info" style="font-size: 14px;">
									<c:choose>
										<c:when test="${support.limited==null }">
								                      无限制
								       </c:when>
										<c:otherwise>
								                      限额${support.limited}元
								       </c:otherwise>
									</c:choose>
								</span>
							</div>
							<p class="text-muted" style="margin-left: 15px;margin-top: 15px;">
								${support.description}</p>

							<div class="row">
								<div class="col-md-4 col-md-offset-2"
									style="text-align: left;vertical-align: middle;">
									<p style="font-size: 16px;">份数:</p>
								</div>
								<div
									class="input-group input-group-sm number-spinner col-md-5 col-md-offset-6">
									<span class="input-group-btn data-dwn">
										<button class="btn btn-default " data-dir="dwn">
											<span class="glyphicon glyphicon-minus"></span>
										</button>
									</span> <input id="inputEmail3" class="form-control text-center"
										value="1" min="-10" max="40" type="text"
										style="font-size: 16px;"> <span
										class="input-group-btn data-up">
										<button class="btn btn-default " data-dir="up">
											<span class="glyphicon glyphicon-plus"></span>
										</button>
									</span>
								</div>
							</div>
							<div class="row" style="margin-top: 10px;">
								<div class="col-md-4 col-md-offset-2"
									style="vertical-align: middle;">
									<p style="font-size: 16px;">总金额:</p>
								</div>
								<div class="col-md-5 col-md-offset-1"
									style="vertical-align: middle;">
									<p id="total"
										style="font-size: 19px;color:#FF7300;font-style:italic;">
										￥${support.price}</p>
								</div>
							</div>
							<div style="text-align: center;margin-bottom: 20px;">
								<c:choose>
									<c:when test="${user==null}">
										<button id="suport_btn_unload" type="button"
											class="btn btn-warning" style="width: 150px;"
											data-toggle="modal" data-target=".modal">去支持</button>
									</c:when>
									<c:when test="${user!=null}">
										<form action="../redirectpay.jsp" method="post">
											<input type="hidden" name="pro_id" value="${project.id}">
											<input type="hidden" name="pro_title"
												value="${project.title}"> <input type="hidden"
												name="pro_rate" value="${project.converted}"> <input
												type="hidden" name="pro_price" value="${support.price}">
											<input id="pro_total" type="hidden" name="pro_total"
												value="${support.price}"> <input id="pro_num"
												type="hidden" name="pro_num" value="1">
											<button id="suport_btn_loaded" type="submit"
												class="btn btn-warning" style="width: 150px;">去支持</button>
										</form>
									</c:when>
								</c:choose>
							</div>
						</div>
					</c:forEach>

					<div class="modal fade" tabindex="-1" role="dialog"
						aria-labelledby="mySmallModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-sm">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">
										<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
									</button>
									<h4 class="modal-title" id="myLargeModalLabel">登陆</h4>
								</div>
								<form class="form-horizontal" role="form"
									action="/jmApp/jm/LoginAction.action">
									<div class="modal-body"
										style="text-align: center;width: 250px;margin: 0 auto">

										<div class="form-group">
											<input id="tel" name="tel" class="form-control"
												id="exampleInputEmail1" placeholder="手机号码">
										</div>
										<div class="form-group">
											<input id="password" name="password" class="form-control"
												id="exampleInputEmail1" placeholder="登陆密码">
										</div>

									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">返回</button>
										<button id="loading" type="button" class="btn btn-primary">登陆</button>
									</div>
								</form>
							</div>
						</div>
					</div>

					<div
						style="background: #fff;margin-top: 20px;border-style:solid; border-width:1px; border-color:#D5D5D5">
						<h5 style="margin-left: 15px;font-weight:bold;">
							<font color="#000">关于支持与退款</font>
						</h5>
						<p style="margin: 10px;font-size: 17px;">
							本项目在<em>2016-06-04 23:59</em>前募集达到<em>￥100,000</em>的金额视为众筹成功，否则您投资的金额将自动退至【聚米账户】，请您留意聚米众筹短信提醒及您的账户余额变动情况。退还的金额您可选择支持其他项目，或【申请提现】将资金提现至您绑定的银行卡中。
						</p>
					</div>
					<div
						style="background: #fff;margin-top: 20px;border-style:solid; border-width:1px; border-color:#D5D5D5;text-align: center;">
						<span style="font-size:25px;">扫描进入项目讨论群</span>
						<div class="line-blue"></div>
						<div style="margin: 30px;">
							<img src="/jmApp/project/${project.grCode}" />
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="tailer.jsp"></jsp:include>
	</div>
	<script type="text/javascript">
		$(function() {
			var action;
			$(".number-spinner button")
					.mousedown(
							function() {
								btn = $(this);
								p = btn.closest('.row').next().find('#total');
								price = btn.closest('#support').find('#price');
								input = btn.closest('.number-spinner').find(
										'input');
								btn.closest('.number-spinner').find('button')
										.prop("disabled", false);
								if (btn.attr('data-dir') == 'up') {
									action = setInterval(
											function() {
												if (input.attr('max') == undefined
														|| parseInt(input.val()) < parseInt(input
																.attr('max'))) {
													input.val(parseInt(input
															.val()) + 1);
													var priceStr = price.text();
													var total = input.val()
															* priceStr
																	.substring(1);
													p.text('￥' + total);
													$('form #pro_total').val(
															total);
													$('form #pro_num').val(
															input.val());
												} else {
													btn.prop("disabled", true);
													clearInterval(action);
												}
											}, 50);
								} else {
									action = setInterval(
											function() {
												if (input.attr('min') == undefined
														|| parseInt(input.val()) > parseInt(input
																.attr('min'))) {
													input.val(parseInt(input
															.val()) - 1);
													var priceStr = price.text();
													var total = input.val()
															* priceStr
																	.substring(1);
													p.text('￥' + total);
													$('form #pro_total').val(
															total);
													$('form #pro_num').val(
															input.val());
												} else {
													btn.prop("disabled", true);
													clearInterval(action);
												}
											}, 50);
								}
							}).mouseup(function() {
						clearInterval(action);
					});
		});
	</script>

	<script type="text/javascript">
		$("#home").load("/jmApp/project/${project.homepage}",
				function(response, status, xhr) {
					$('#home').html(response);
				});

		$("#profile").load("/jmApp/project/${project.safepage}",
				function(response, status, xhr) {
					$('#profile').html(response);
				});
	</script>
	<script type="text/javascript">
		$('#info_btn').click(function(e) {

			$.ajax({
				url : '/jmApp/jm/SaveInfo.action',
				type : 'post',
				dataType : 'json',
				data : $("#info_frm").serialize(),
				beforeSend : function(e) {
					$('#info_btn').attr('disabled', 'disabled');
				},
				success : function(e) {
					$('#info_btn').removeAttr('disabled');
				}
			});
		});
	</script>
</body>

</html>