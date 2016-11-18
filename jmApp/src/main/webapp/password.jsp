<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html  lang="en"></html>
<head>
<meta charset="UTF-8">
 <title>忘记密码--填写账户信息</title>
   js
    <link type="text/css" rel="stylesheet" href="/jmApp/css/bootstrapValidator.css" />
    <link type="text/css" rel="stylesheet" href="/jmApp/css/myzhaopin.css" />
    <link type="text/css" rel="stylesheet" href="/jmApp/css/login.css" />
    <link type="text/css" rel="stylesheet" href="/jmApp/css/codetarget.css" />
    <link type="text/css" rel="stylesheet" href="/jmApp/css/custom.css" />
    <link rel="stylesheet" type="text/css" href="/jmApp/bootstrap-3.3.5-dist/css/bootstrap.min.css">
    
    
    <!--[if lt IE 10]>
    <script type="text/javascript" src="/js/jquery.placeholder.min.js"></script>
    <![endif]-->
   
 <!--    <script language="javascript" type="text/javascript">
       /*  lastChannelURL_cookie(); */
    </script>     -->
<style type="text/css">
     
	 body {
	      background-image: url('/jmApp/img/regnewbodybg.png');
          }
    .tabs {
    height: 30px;
    line-height: 30px;
    padding-top: 1px;
}
/* #veryCode:hover{
		cursor:pointer;
	} */
</style>

<script type="text/javascript">
	var code = "";
	function changeMe(){
		var img = document.getElementById('veryCode');
		img.setAttribute("src", "servlet/VerifyCodeServlet?abc="+new Date().getTime());
		img.onload = function(){
			showCheckCode();
		}
	}
	
	function showCheckCode(){
		var xmlHttp;
		if(window.ActiveXObject){
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		}else if(window.XMLHttpRequest){
			xmlHttp = new XMLHttpRequest();
		}
		
		xmlHttp.onreadystatechange = function(){
			if(xmlHttp.readyState == 4){     
	            if(xmlHttp.status == 200){
	           		code = xmlHttp.responseText;
	           	//	alert(code);
	            }
	        }
		};
		
		//设置请求参数
		xmlHttp.open("post", "servlet/GetCodeServlet", true);
		d
		//发送请求(数据)
		xmlHttp.send(null);
	}
</script>
</head>
<body onLoad="changeMe()">
     <nav class="navbar navbar-default navbar-fixed-top"
		style="background:#FFF; color:#FFF">
		<div class="container">
			<div class="navbar-header"
				style="margin-top: 10px;margin-bottom: 10px">
				<a class="navbar-brand" href="/jmApp/jm/MainAction.action" style="padding-top: 0"> <img
					src="/jmApp/img/91_logo.png">
				</a>
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#example-navbar-collapse">
					<span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
			</div>
	</nav>
    <div id="page">
<div class="welcomelogin" style="margin-top: 80px">
    找回密码
</div>
<div class="login">
    <div class="msgparent">
        <div class="msgcontainer">
        <div class="tabs">
           <ul class="tab">
                        <li class="curr">手机找回</li>                           
                </ul>
                </div>
            <dl style="border-top: 1px solid #cccccc; padding: 20px 0;">
                <dt class="msgtitle">
                    <img src="/jmApp/img/step01.jpg">
                </dt>
                <dd style="width:100%;">
                    <div style="margin:0 auto;overflow: hidden;width:416px;">
                   <input id="bkurl" name="bkurl" type="hidden" value="" />
                    <div class="container">
                  <form id="register_frm" role="form" action="/jmApp/jm/Validat.action" method="post"> 
                            <div style="padding:10px;margin-left: 10px">
                                <input class="form-control" data-val="true" data-val-required="请输入您的手机号" id="tel" name="tel" placeholder="请输入手机号" type="text" value="" style="width: 250px;height: 40px"/>
                                <%-- <s:fielderror fieldName="tel" cssStyle="color:red" /> --%>
                                <span id="tel_message"></span>
                            </div>
                            <div style="padding:10px;float:Left;margin-left: 13px ">
                                <input type="text" class="form-control" id="code" name="code" placeholder="短信验证码" style="width: 110px;height: 40px"> 
                                <span id="code_message"></span>
                            </div>
                            <div>
                                <span class="input-group-btn">
                                <button id="code_btn" type="button" class="btn btn-warning " style="margin-top: 10px">获取校验码</button>
								</span>
							</div>
							<div>
							<button type="submit" class="btn btn-primary" style="margin:27px;margin-top: -30px">下一步</button>
                            </div>
                         </form>
                    </div>
                </dd>
            </dl>
        </div>
    </div>
</div>

   <%-- <jsp:include page="tailer.jsp"></jsp:include> --%>
    <div id="loginfooter">
        <a target="_blank" href="http://www.91jiuma.com/jmApp/jm/MainAction.action">九马首页</a>
        <a target="_blank" href="http://www.91jiuma.com/jmApp/jm/ProjectAction.action">影视投资</a> |
        <a target="_blank" href="http://www.91jiuma.com/jmApp/projectdelivery.jsp">项目投递</a> |
        <a target="_blank" href="http://www.91jiuma.com/jmApp/shangcheng.jsp">九马商城</a> |
        <a target="_blank" href="http://www.91jiuma.com/jmApp/travel.jsp">九马旅游</a> |
        <a target="_blank" href="http://www.91jiuma.com/jmApp/list.jsp">关于</a>
    </div>
    
</body>
<script type="text/javascript" src="/jmApp/js/jquery.validate.custom.js"></script>
 <script type="text/javascript" src="/jmApp/js/jquery.validate.js"></script>
 <script type="text/javascript" src="/jmApp/js/jquery.validate.ui.login.js"></script>
 <script type="text/javascript" src="/jmApp/js/jquery.passwordstrength.js"></script>
<script src="/jmApp/bootstrap-3.3.5-dist/js/jquery.min.js"></script>
	<script src="/jmApp/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/jmApp/js/index_ads.js"></script>
    <script type="text/javascript" src="/jmApp/js/global.js"></script>
    <script type="text/javascript" src="/jmApp/circle_progress/dist/jquery-asPieProgress.min.js"></script>
    <script src="/jmApp/bootstrapvalidator/js/bootstrapValidator.js"></script>
    <script src="/jmApp/jquery-countdown/jquery.countdown-2.2.0.js"></script>
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
						}/* ,
						threshold : 11, //有11字符以上才发送ajax请求，（input中输入一个字符，插件会向服务器发送一次，设置限制，6字符以上才开始）
						remote : {//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}  
							url : '/jmApp/jm/TelValidate.action',//验证地址
							message : '手机号码已注册',//提示消息
							delay : 1000,//每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
							type : 'POST'//请求方式
						}  */
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
           var fiveSeconds = new Date().getTime() + 1*60*1000;
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