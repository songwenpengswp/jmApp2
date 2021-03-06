<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>91九马众筹用户注册服务协议</title>
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
     <div style="margin-top:100px">

    <div align=center> <h2> 91九马众筹用户注册服务协议</h2></div><br><br>
<div style="margin-left:200px; margin-right:200px"><h4>第一条 签约主体与特别声明<br>
1.1 91九马众筹平台（以下简称“本平台”）是由杭州玖壹玖马网络科技有限公司开发、运营的网络平台，为保护支持者的合法权益，规范发起人的行为，维护本平台的秩序，特拟定《91九马众筹用户注册服务协议》（以下简称“本协议”）。<br>
1.2本协议的双方是本平台的注册用户与91九马众筹平台，在您注册成为本平台的用户之前，请仔细阅读并充分理解本协议条款。如果您同意注册并使用本平台提供的服务，视您已经认真阅读、理解并完全接受了本协议的全部内容，本协议即视您与本平台之间发生法律效力，包括但不限于本协议及所有平台已发布的或将来可能发布的各类规则、操作流程等。<br>
1.3 您应是具有完全民事权利能力和民事行为能力的自然人，或依法设立并有效存续的单位（包括企业法人及其他组织）。<br>
1.4本平台有权随时修改本协议文本中的任何条款，一旦本平台对本协议进行修改，平台会以公告的形式发布通知。任何此类修改自发布之日起生效，如果用户在此类修改发布后继续使用本平台服务，则表示该用户同意遵守本协议所作出的修改。<br>
1.5如您不能按照本协议的约定，包括但不限于不能接受修订后的协议及各类规则，则应立即停止使用本平台提供的服务。<br>
第二条遵守法律<br>
2.1 当使用本平台服务时，用户同意遵守中华人民共和国相关法律法规，包括但不限于《中华人民共和国宪法》、《中华人民共和国合同法》、《中华人民共和国电信条例》、《互联网信息服务管理办法》、《互联网电子公告服务管理规定》、《中华人民共和国保守国家秘密法》、《全国人民代表大会常务委员会关于维护互联网安全的决定》、《中华人民共和国计算机信息系统安全保护条例》、《计算机信息网络国际联网安全保护管理办法》、《中华人民共和国著作权法》及其实施条例、《互联网著作权法行政保护办法》等。用户只有在同意遵守所有相关法律法规和本协议时，才有权使用本平台服务。<br>
第三条 用户账号和使用规范<br>
3.1 用户注册时应按本平台注册页面提示填写真实、准确、有效的信息，不得侵害他人的利益，否则自行承担由此引起的全部责任及后果，平台保留终止其使用各项服务的权利。完成注册程序后，即成为注册用户，有权享有平台提供的服务。<br>
3.2 用户不应该将其账号、密码转让、出借或告知他人，供他人使用。如用户发现账号遭他人非法使用，应立即通知本平台，以避免造成可能的损失。<br>
3.3 本平台为更好地保护您的合法权益并向您提供优质、高效的服务，本平台可能将您的信息应用在以下方面：<br>
（1）在您登录本平台时进行必要的身份验证；<br>
（2）根据您的浏览记录及相关信息，向您推荐您可能感兴趣的众筹项目资料；<br>
（3）针对您通过本平台提出的任何问题及时予以答复，并提供必要的协助；<br>
（4）分析本平台的用户需求及使用情况，以为您提供更优质的服务；<br>
（5）在奖励式众筹项目完成众筹之后，将项目支持者的姓名、用户名、联系方式和联系地址发送给项目发起人，以便项目发起人兑现对项目支持者的回报；<br>
（6）本平台提供的其他相关服务，比如以短信和邮箱的形式向您发送本平台的相关通知和公告。<br>
3.4 当您使用本平台服务时，必须遵守中华人民共和国相关法律法规的规定，用户保证不会利用本平台进行任何违法或不正当的活动，包括但不限于下列行为：<br>
（1）违反本协议的规定；<br>
（2）冒用他人名义使用本服务；<br>
（3）利用本服务侵害他人的合法权益；<br>
（4）从事非法交易；<br>
（5）反对宪法及其他法律的基本原则，危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一；<br>
（6）散布谣言，扰乱社会秩序，破坏社会稳定的；<br>
（7）散步淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；<br>
（8）含有中国法律、法规、规章、条例以及任何具有法律效力的规范所限制或禁止的其他内容；<br>
3.5 用户保证不利用本平台进行如下活动：<br>
（1）未经允许，进入计算机信息网络或者使用计算机信息网络资源；<br>
（2）未经允许，对计算机信息网络功能进行删除、修改或者增加；<br>
（3）未经允许，对进入计算机信息网络中存储、处理或者传输的数据和应用程序进行删除、修改或者增加；故意制作、传播计算机病毒等破坏性存续，其他危害计算机信息网络安全的行为。<br>
如用户在使用本平台服务时违反任何上述规定，本平台有权要求用户进行改正或直接采取一切必要措施（包括但不限于更改、删除相关内容、暂停或终止相关用户使用本平台服务）以消除该用户的不正当行为。<br>
3.6本平台系统服务因下列状况暂停服务、无法正常运作，使用户无法使用各项服务时，对此造成的一切不便与损失，平台不承担损害赔偿责任，该状况包括但不限于：<br>
（1）本平台公告系统停机维护期间；<br>
（2）电信设备出现故障不能进行数据传输；<br>
（3）因台风、地震、海啸、洪水、停电、战争、恐怖袭击等不可抗力事件，导致平台系统障碍不能正常为您提供服务；<br>
（4）由于黑客攻击、电力系统问题、电信部门技术调整等其他方非因平台自身所能控制原因而造成的服务中断或者延迟；<br>
如因上述原因或其他平台无法控制的原因，使平台运营系统崩溃或无法正常使用，导致网上交易或其他服务无法完成、或丢失有关的信息、记录等，平台将本着合理止损的原则协助用户处理相关事宜。<br>
第四条知识产权<br>
4.1注册会员在本平台的上传行为代表着注册会员对上传的信息享有永久使用权和收益权，且注册会员保有上传信息的所属权。<br>
4.2注册会员有义务确保其发布的信息不侵犯任何第三方知识产权及其他权利，否则由此给第三方或本平台造成的损失将由注册会员承担。<br>
<br>
第五条 隐私权保护<br>
5.1 当您在本平台注册并参与平台互动项目时，平台服务器将记录您的信息与操作，请您予以接受并充分理解。<br>
5.2 本平台不会将您的个人信息和资料予以泄露，但是根据下列情况，平台有权全部或部分披露您的个人信息： <br>
（1）根据法律、法规、行政规章规定，或应行政机关、司法机关要求，披露或者使用您的个人信息； <br>
（2）如您为权利人并针对他人在本平台上侵犯您利益的行为提起投诉，平台为更好解决您的诉求，披露或使用您的个人信息； <br>
（3）如您为投资人或者活动参与人，应项目方要求提供您的身份信息； <br>
（4）权利人认为您在本平台上的行为侵犯其合法权利并提出投诉的，可向权利人披露； <br>
（5）您出现违反本平台网站规则，需要向第三方披露的； <br>
（6）根据本平台网站公示规则，需要披露的。<br>
第六条 发起者和支持者之间的合同关系<br>
   6.1 91九马众筹为众筹项目提供融资平台。当发起者发起众筹项目，支持者付款支持后，发起者与支持者之间就形成了合同关系：支持者接受发起者的提议，并形成合同。<br>
   6.2  91九马众筹并不是这个合同的一部分。合同只有双方，发起者和支持者。但这份合同包括以下定式条款：<br>
（1）当一个项目众筹成功后，发起者必须完成项目，并按承诺将实物回报给支持者。一旦发起者完成了这些任务，即可视为他履行了对支持者的义务。<br>
（2）项目众筹成功后，发起者对支持者承担如下责任：为完成项目的高标准努力与付出、诚实的沟通。<br>
（3）支持者必须明白，支持一个项目，是在帮助创造崭新的事物，而不是订购已经存在的东西。这个过程中会有变化、延迟、甚至可能发生一些不可预知的事情，让发起者无法完成他们的项目。<br>
    6.3如果一个发起者无法完成他的项目或是兑现他承诺的回报，他们将被视为未能履行该合同的基本条款。此时，发起者必须对支持者进行补救：<br>
（1）发布一个更新声明，解释项目已经完结，资金如何使用，以及是什么阻止他们完成这个项目；<br>
（2）尽最大的努力在指定的时间内完成项目，并和支持者进行沟通；<br>
（3）项目发起时的描述是诚实的，没有任何虚假的宣传或实物展示；<br>
（4）能够证明自己的资金使用合理，采用了每个合理的步骤去完成项目，让资金使用透明化；<br>
    发起者是履行承诺的负责人。如果他们不能完成本协议的条款，支持者可针对他们采取法律救助。<br>
第7条 免责声明<br>
（1）本平台不提供退款或类似的保证。完成项目的责任在于项目的发起者，本平台不是这些发起者的代表，它不能保证发起者的工作进度，也不能为发起者提供担保。<br>
（2）本平台不承担任何赔偿义务且不参与评判用户之间的争端，或用户和任何第三方服务之间的争端。本平台不负责监督项目是否准时或回报的性能。当你使用本平台的服务后，你就放弃了对本平台以任何方式索赔的权利。<br>
（3）本平台明确声明，本平台不提供任何资金担保，无侵权的保证或其他适用于特殊用途的保证，或众筹过程中任何行为的保证。本平台向你提供的任何建议或信息（口头或书面）均不构成保证。<br>
第8条 赔偿<br>
如果你的行为让我们被起诉，或者违反任何在本协议中你做出的承诺，你必须帮助我们进行辩护、赔偿，并让我们免于因为你使用本平台或错误使用本平台造成的任何索赔或债务。本平台保留权利，依据此条款，你会和本平台合作，帮助本平台进行辩护。<br>
其他<br>
这就是你和本平台之间的完整的协议。它是唯一处理你和本平台之间服务关系的依据。<br>
如果该协议发生修改，本平台有义务通过电子邮件或其他联系方式通知你，或在平台显著位置发布通知。<br><br><br><br><br><br>
</h4>
</div>

  </body>
</html>