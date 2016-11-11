<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" type="text/css" href="bootstrap-3.3.5-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="bootstrap-3.3.5-dist/css/buttons.css">
	<link rel="stylesheet" href="circle_progress/css/progress.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="datepicker/css/bootstrap-datepicker3.css">
	<script src="bootstrap-3.3.5-dist/js/jquery.min.js"></script>
    <script src="bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
    <style type="text/css">
	.cjwt{line-height:24px;}
	.cjwt .cjwt-group{border-bottom:1px dashed #ccc;padding:10px 0;font-size:14px;margin-left: 30px;margin-top: 30px;}
	.cjwt .cjwt-title{font-size:18px;font-weight:bold;cursor:pointer;}
	.cjwt .cjwt-subtitle{font-size:14px;color:#F25904;}
	.cjwt .cjwt-group dd{padding:10px 0;}
	</style>
	<style type="text/css">
		.aqbz{text-align: left; font-size: 16px; line-height: 24px;}
		.aqbz h2{font-size: 18px;line-height:2;}
	</style>
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top"
	style="background:#FFF; color:#FFF;">
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

		<div class="collapse navbar-collapse"
			id="example-navbar-collapse text-center" style="margin-top: 10px">
			<ul class="nav navbar-nav navbar-left ">
				<li><a href="/jmApp/jm/MainAction.action"
					style="font-size: 18px">首页</a></li>
				<li><a href="/jmApp/jm/ProjectAction.action" style="font-size: 18px">影视投资</a></li>
				<li><a href="/jmApp/projectdelivery.jsp"
					style="font-size: 18px">项目投递</a></li>
				<!-- <li><a href="projectissue.html" style="font-size: 18px">发行</a></li> -->
				<li><a href="/jmApp/shangcheng.jsp" style="font-size: 18px">九马商城</a></li>
				<li><a href="/jmApp/travel.jsp" style="font-size: 18px">九马旅游</a></li>
				<li><a href="/jmApp/list.jsp" style="font-size: 18px">关于</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right ">
				<li>
					<div class="btn-group" role="group" aria-label="..."
						style="margin-top: 10px;margin-right: 20px">
						<c:choose>
							<c:when test="${user==null}">
								<a href="/jmApp/login.jsp" class="btn btn-warning" role="button">登陆</a>
							</c:when>
							<c:otherwise>
								<a href="/jmApp/jm/UserAction.action" class="btn btn-warning" role="button">你好,${user.tel}</a>
							</c:otherwise>
						</c:choose>
					</div>
				</li>

				<li>
					<div class="btn-group" role="group" aria-label="..."
						style="margin-top: 10px">
						<c:choose>
							<c:when test="${user==null}">
								<a href="/jmApp/register.jsp" class="btn btn-default"
									role="button">注册</a>
							</c:when>
							<c:otherwise>
								<a href="/jmApp/login.jsp" class="btn btn-danger" role="button">退出</a>
							</c:otherwise>
						</c:choose>

					</div>
				</li>
			</ul>
		</div>
	</div>
</nav>
   <div style="margin-top:100px;margin-left:200px; margin-right:200px">
             <div align=center> <h2>发起人手册</h2></div><br><br>
<h3>欢迎你们</h3>
<h4>欢迎来到我们的服务平台，这是一个基于共同的创作态度和做事风格而形成的影人社区。<br>
无论是网络大电影、微电影、电影电视剧、只要你的想法足够打动人，这里大多数人都会愿意倾听，并且帮你完成这个想法。
用户的每一次支持，都是我们最珍视的，所以除了创意，你们还需要拿出诚意，除了用心，还要愿意付出真心。
希望你们在这里开启一段不一样的旅程。<br><br>
这里能为你做什么<br>
也许拍电影一直是你的梦想，我们可以为你提供资金、场地、设备，但是一部优秀作品的开始永远是一个好的剧本和拥有凝聚力的团队，这里你所想要的一切，都需要真诚付出。<br>
91九马在这个过程中，提供的服务不止这些，比如项目评估，这是市场验证的一部分，当然还有各种风险控制的方式，来确保资金的安全透明。
虽然我们不能保证每一个项目都入选，每一个项目都成功，但这是一个互相付出的过程，所以平台给你的服务，与你给支持者的承诺，我们都要确保以最大的力度去完成。<br><br>
你需要做什么<br><br>
上传你的信息<br>
注册成为会员，并通过实名认证，这样你就有了发起项目的资格，填上必要的项目信息，方便我们第一时间联系你们。<br>
为了让我们对你的项目有更深入的了解，我们会提供统一的项目文档。
完成之后，我们将对你的项目进行全面的评估，预估风险，请相信这是一个非常必要的过程，并且会让后续的进程更加简单愉快。<br>
接下来，还有几件非常重要的事情，直接关乎众筹的成败。<br><br>
设置支持金额与回报<br>
你可以设置3-5个用于支持的选项，金额不等，从几十、几百到几万，这样来吸引更多的用户来支持。<br>
设置回报的原因，是为了让支持者更有意愿参与到你的项目中来，有些回报可能微不足道，可是它们体现了你的用心，并且可以积聚一群有共同兴趣爱好的人，没有什么比这更有趣而充实的了。
你需要公布回报发放的时间，这是对支持者的一个承诺，你有责任尽全力完成它。
你应该选择一个更有信心完成的兑现时间，减少自己的压力。
如果你遇到问题或有可能拖延，一定要让你的支持者知道。告诉他们发生了什么，给他们一个新的时间。他们很少会因此指责你。<br><br>
提交项目<br>
现在你对众筹过程已经有了清晰的了解，可以提交项目资料了。<br><br>
如何提交<br>
•注册并登录91九马众筹账号<br>
•点击官网首页右上角的“发起项目”<br>
•填写完整信息后“存为草稿”<br>
•点击页面顶端“提交审核”<br><br>
审核须知<br>
初审一般会在7个工作日内完成，如果未通过，你将收到站内信或者邮件通知；如果通过，我们会与你联系。<br>
不同种类的项目有不同的审核标准，在筛选项目的时候，我们会选择素材相对丰富、更符合平台调性的项目，一定程度上可以参照已上线的同类项目。<br><br>
宣传尤为重要<br>
让越多的人知道你的众筹项目，并且找到感兴趣的对的人，对于众筹的成功至关重要，所以你现在要做的就是，尽一切可能地宣传自己的项目。<br>
首先告诉你最好的朋友和家人，你启动了一个项目，然后在社交媒体里共享项目。你的朋友和家人是你最初的支持者和最初的消息传播人，在整个众筹过程中，你都需要你的社交圈的帮助。 <br>
你可以把你的朋友加入更小的微信群中，保证众筹消息会传给每个人。给他们一个简洁的介绍以及突出你的一些奖励。记住，简洁的同时，千万不能忘记链接到你的项目页面。<br><br>
单独和人沟通<br>
一个吸引人的个性化的消息，是让别人知道你的项目最有效的方式。当你在社交媒体发布你的消息后，你可以单独跟人交流。试着强调项目里非常具体的细节，你认为别人可能会喜欢的。<br><br>
接触媒体<br>
记者们也在寻找新的故事和想法。虽然没有魔法能让媒体关注你和你的项目，但你可以聚焦在你是谁以及你正在努力创造什么。如何让你的项目让更多人知道？首先，是你的想法，而不是你在众筹。<br><br>
找到更多群体<br>
如果你要制作一部电影，你一个人的努力可能不够，你要确保所有演员和工作人员参与。<br><br>
保持沟通<br>
和你的支持者保持沟通，遵循共同的合伙人机制，发布最新的项目进展，保持公开透明的原则，不仅众筹前提供真实的资料给用户，众筹完成后也要及时公布项目进展和财务状况，以保障项目投资人合法的权益。<br><br>
费用收取<br>
众筹会产生这些费用<br>
在众筹项目完成后，91九马众筹将依据《众筹项目推荐协议》代扣第三方支付平台手续费，获取相应的佣金。<br>
权益类回报（分红权、加盟权、代理权、代销）<br>

91九马众筹平台代扣第三方支付平台手续费1.5%后，再扣5%作为佣金，合计扣除该回报实际众筹款项的6.425%。<br>
<br>
文化创意类回报（拍摄制作或宣传推广影视作品、举办活动或展览）<br>

91九马众筹代扣第三方支付平台手续费1.5%后，再扣5%作为佣金，合计扣除该回报实际众筹款项的6.425%。<br><br>
消费类回报（产品、服务）<br>
91九马众筹代扣第三方支付平台手续费1.5%后，再扣10%作为佣金，合计扣除该回报实际众筹款项的11.35%<br>
众筹成功后，支持者要求退款或存在其他纠纷的，由发起人负责，此种情况下不影响91九马众筹收取佣金，已代扣的手续费亦不予返还。此处若存在与《众筹项目服务协议》具体条款中冲突的条款，以《众筹项目服务协议》为准。<br>
众筹未成功，且发起人未在《众筹项目服务协议》约定范围内触发违约事由，不收取佣金，手续费由平台承担。<br>
</h4>
</div>
</body>
</html>
 