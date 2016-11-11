<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>关于玖马</title>
<link rel="stylesheet" type="text/css"
	href="bootstrap-3.3.5-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap-3.3.5-dist/css/buttons.css">
<link rel="stylesheet" href="circle_progress/css/progress.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="datepicker/css/bootstrap-datepicker3.css">
<script src="bootstrap-3.3.5-dist/js/jquery.min.js"></script>
<script src="bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
<style type="text/css">
.cjwt {
	line-height: 24px;
}

.cjwt .cjwt-group {
	border-bottom: 1px dashed #ccc;
	padding: 10px 0;
	font-size: 14px;
	margin-left: 30px;
	margin-top: 30px;
}

.cjwt .cjwt-title {
	font-size: 18px;
	font-weight: bold;
	cursor: pointer;
}

.cjwt .cjwt-subtitle {
	font-size: 14px;
	color: #F25904;
}

.cjwt .cjwt-group dd {
	padding: 10px 0;
}
</style>
<style type="text/css">
.aqbz {
	text-align: left;
	font-size: 16px;
	line-height: 24px;
}

.aqbz h2 {
	font-size: 18px;
	line-height: 2;
}
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
	<div style="margin-top:100px;margin-left:200px; margin-right:200px;">
		<div align=center>
			<h3>关于玖马</h3>
		</div>
		<div align=center>
			<h4>
				关于众筹你早已听过了很多道理<br>
				<br> 所以抱歉，我们打算引用一段耳熟能详的话，来表达我们的三观<br> <br> 
			
				<hr>
				<br> <br> 
				<font face="方正舒体">向那些疯狂的家伙们致敬<br>
				<br></font>
				<font face="Viner Hand ITC">Here’s to the Crazy
					Ones.<br></font>
				<font face="方正舒体"><br> 他们我行我素，桀骜不逊，惹事生非，与世人格格不入<br></font>
				<font face="Viner Hand ITC"><br> The misfits.Therebels.Thetroublemakers.The round pegs in
					the square holes.<br></font>
				<font face="方正舒体"><br> 他们用不同的角度看待事物<br></font>
				<font face="Viner Hand ITC"><br> The ones who see things differently.<br></font>
				<font face="方正舒体"><br> 他们从不墨守成规，他们也从不安于现状<br></font>
				<font face="Viner Hand ITC"><br> They’re not fond of rules.And they have no respect for the
					status quo.<br></font>
				<font face="方正舒体"><br> 你可以引用他们，也可以否决他们，质疑他们，颂扬抑或是诋毁他们<br></font>
				<font face="Viner Hand ITC"><br> You can quote them, disagree with them,disbelieve them,
					glorify or vilify them.<br></font>
				<font face="方正舒体"><br> 但唯独不能漠视他们<br></font>
				<font face="Viner Hand ITC"><br> About the only thing that you can’t do, is ignore them.<br></font>
				<font face="方正舒体"><br> 因为他们改变了事物<br></font>
				<font face="Viner Hand ITC"><br> Because they change things.<br></font>
				<font face="方正舒体"><br> 他们发明、想象、治愈<br></font>
				<font face="Viner Hand ITC"><br> They invent. They imagine. They heal.<br></font>
				<font face="方正舒体"><br> 他们探索、创造、引领<br></font>
				<font face="Viner Hand ITC"><br> They explore. They create. They inspire.<br></font>
				<font face="方正舒体"><br> 他们让人类向前跨了一大步<br></font>
				<font face="Viner Hand ITC"><br> They push the human race forward.<br></font>
				<font face="方正舒体"><br> 也许他们是被迫成疯<br></font>
				<font face="Viner Hand ITC"><br> Maybe they have to be crazy.<br></font>
				<font face="方正舒体"><br> 一张白纸你能看到还没画出来的图画？<br></font>
				<font face="Viner Hand ITC"><br> How else can you stare at an empty canvas and see a work
					of art?<br></font>
				<font face="方正舒体"><br> 四周寂静你能听到还没写出来的歌曲？<br></font>
				<font face="Viner Hand ITC"><br> Or, sit in silence and hear a song that hasn’t been
					written?<br></font>
			<font face="方正舒体">	<br> 抑或仰望星空你能看出天竟物演？<br></font>
				<font face="Viner Hand ITC"><br> Or, gaze at a red planet and see a laboratory on wheels?<br></font>
				<font face="方正舒体"><br> 这样的人是有用之才<br></font>
				<font face="Viner Hand ITC"><br> We make tools for these kinds of people.<br></font>
				<font face="方正舒体"><br> 别人眼里的疯子，我们眼中的天才<br></font>
				<font face="Viner Hand ITC"><br> While some may see them as the crazy ones, we see genius.<br></font>
				<font face="方正舒体"><br> 只有疯狂到以为自己能够改变世界的人才能真正地改变世界<br></font>
				<font face="Viner Hand ITC"><br>
				 Because the ones who are crazy enough to think that they can change
				the world, are the ones who do.<br> <br>
				<br>
				</font> 每一段故事都有开头与结尾，我们注重的是从零到,一，从一而终的过程<br>
				<br> 如果你也正好是一个不安于现状，特立独行的人，想要改变些什么<br>
				<br> 联系我们，用你认识世界的独特方法，坦然地去推动周遭的改变<br>
				<br> <br>
			</h4>
		</div>
		<div>
			<h4>
				地址：杭州市余杭区迎宾路355号永安大厦16F<br>
				<br> 电 话：0571-86483665/88662566<br>
				<br> 邮 箱：543613995@qq.com<br>
				<br>
			</h4>
		</div>
</body>
</html>