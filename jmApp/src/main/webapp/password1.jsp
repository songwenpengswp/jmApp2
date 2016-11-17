<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en"></html>
<head>
<meta charset="UTF-8">
    <title>忘记密码--填写验证码信息</title>
     <link type="text/css" rel="stylesheet" href="/jmApp/css/myzhaopin.css" />
    <link type="text/css" rel="stylesheet" href="/jmApp/css/login.css" />
    <link type="text/css" rel="stylesheet" href="/jmApp/css/codetarget.css" />
    <link type="text/css" rel="stylesheet" href="/jmApp/css/custom.css" />
    <link rel="stylesheet" type="text/css"
	href="/jmApp/bootstrap-3.3.5-dist/css/bootstrap.min.css">
    
    <!--[if lt IE 10]>
    <script type="text/javascript" src="/scripts/jquery.placeholder.min.js"></script>
    <![endif]-->
    <script language="javascript" type="text/javascript">
        /* lastChannelURL_cookie(); */
    </script>
    <style type="text/css">
        .lblplaceholder {
            height: 22px;
            padding: 10px;
            *padding: 14px 10px 10px 10px;
        }
         body {
	background-image: url('/jmApp/img/regnewbodybg.png');
}
    </style>
    <script type="text/javascript" src="/jmApp/js/jquery.validate.custom.js"></script>
    <script type="text/javascript" src="/jmApp/js/jquery.validate.ui.login.js"></script>
    <script type="text/javascript" src="/jmApp/js/jquery.passwordstrength.js"></script>
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
			<div class="navbar-header" style="margin-top: 10px;margin-bottom: 10px">
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
	
    <!-- <div id="loginheader">
        <div class="loginnewhead">
            <a href="http://www.zhaopin.com/">
                <img src="./å¿è®°å¯ç --å¡«åéªè¯ç _files/newlogo1407.png">
            </a>
        </div>
    </div> -->
    <div id="page">
<div class="welcomelogin" style="margin-top: 60px">
    找回密码
</div>
<div class="login">
    <div class="msgparent">
        <div class="msgcontainer">
            <div class="tabs">
                <ul class="tab">
                        <li class="curr">手机找回</li>
                </ul>
            </div>

            <dl style="border-top: 1px solid #cccccc; padding: 20px 0;">
                <dt class="msgtitle">
                    <img src="/jmApp/img/step02.jpg">
                </dt>
                <dd style="width:100%;">
                    <div style="margin:0 auto;overflow: hidden;width:416px;">
                        <form id="appform" method="post" novalidate="novalidate">
                            <input id="bkurl" name="bkurl" type="hidden" value="">
                            <input data-val="true" data-val-required="错误的参数" id="Receiver" name="Receiver" type="hidden" value="15590062451">
                                <p style="margin: 20px 0;font-size:14px;">
                                                                                                   密码重置验证码已发送到您的手机：<br>
                                                                                                   请在 10分钟 内查收，并在下方填写您收到的验证码。
                                </p>
                            <div style="padding:10px">
                                <input class="form-control" data-val="true" data-val-required="请输入短信验证码" id="SecurityCode" name="SecurityCode" placeholder="请输入短信验证码" type="text" value="" style="width: 110px;height: 35px">
                                <input data-val="true" data-val-number="The field ShowTime must be a number." data-val-required="The ShowTime field is required." id="ShowTime" name="ShowTime" type="hidden" value="23">                                    
<script type="text/javascript">
//发送验证码时添加cookie
function addCookie(name,value,expiresHours){ 
    var cookieString=name+"="+escape(value); 
    //判断是否设置过期时间,0代表关闭浏览器时失效
    if(expiresHours>0){ 
        var date=new Date(); 
        date.setTime(date.getTime()+expiresHours*1000); 
        cookieString=cookieString+";expires=" + date.toUTCString(); 
    } 
        document.cookie=cookieString; 
} 
//修改cookie的值
function editCookie(name,value,expiresHours){ 
    var cookieString=name+"="+escape(value); 
    if(expiresHours>0){ 
      var date=new Date(); 
      date.setTime(date.getTime()+expiresHours*1000); //单位是毫秒
      cookieString=cookieString+";expires=" + date.toGMTString(); 
    } 
      document.cookie=cookieString; 
} 
//根据名字获取cookie的值
function getCookieValue(name){ 
      var strCookie=document.cookie; 
      var arrCookie=strCookie.split("; "); 
      for(var i=0;i<arrCookie.length;i++){ 
        var arr=arrCookie[i].split("="); 
        if(arr[0]==name){
          return unescape(arr[1]);
          break;
        }else{
             return ""; 
             break;
         } 
      } 
       
}

$(function(){
    $("#second").click(function (){
        sendCode($("#second"));
    });
    v = getCookieValue("secondsremained");//获取cookie值
    if(v>0){
        settime($("#second"));//开始倒计时
    }
})
//发送验证码
function sendCode(obj){
    var phonenum = $("#phonenum").val();
    var result = isPhoneNum();
    if(result){
        doPostBack('${base}/login/getCode.htm',backFunc1,{"phonenum":phonenum});
        addCookie("secondsremained",60,60);//添加cookie记录,有效时间60s
        settime(obj);//开始倒计时
    }
}
//将手机利用ajax提交到后台的发短信接口
function doPostBack(url,backFunc,queryParam) {
    $.ajax({
        async : false,
        cache : false,
        type : 'POST',
        url : url,// 请求的action路径
        data:queryParam,
        error : function() {// 请求失败处理函数
        },
        success : backFunc
    });
}
function backFunc1(data){
    var d = $.parseJSON(data);
    if(!d.success){
        alert(d.msg);
    }else{//返回验证码
        alert("模拟验证码:"+d.msg);
        $("#code").val(d.msg);
    }
}
//开始倒计时
var countdown;
function settime(obj) { 
    countdown=getCookieValue("secondsremained");
    if (countdown == 0) { 
        obj.removeAttr("disabled");    
        obj.val("免费获取验证码"); 
        return;
    } else { 
        obj.attr("disabled", true); 
        obj.val("重新发送(" + countdown + ")"); 
        countdown--;
        editCookie("secondsremained",countdown,countdown+1);
    } 
    setTimeout(function() { settime(obj) },1000) //每1000毫秒执行一次
} 
//校验手机号是否合法
function isPhoneNum(){
    var phonenum = $("#phonenum").val();
    var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/; 
    if(!myreg.test(phonenum)){ 
        alert('请输入有效的手机号码！'); 
        return false; 
    }else{
        return true;
    }
}
    /* var smsvalid = false;
    var countsec = (60);
    if (countsec>1) {
       $('#sendsms').addClass("f_array").val(countsec + "秒后重发");
          
	}
	var intervaltimer = 0;

	function intervalfunc() {
		if (countsec <= 1) {
			$('#ShowTime').val(countsec);
			clearInterval(intervaltimer);
			countsec = 60;
			$('#sendsms').removeClass("f_array").val("重新发送");
			smsvalid = true;
			return;
		}
		countsec--;
		$('#sendsms').addClass("f_array").val(countsec + "秒后重发");
		$('#ShowTime').val(countsec);
	}

	$(function() {
		intervaltimer = setInterval(intervalfunc, 1000);

		window.dialogpanel = new jsModelDialog({
			Instance : document.getElementById("dialog"),
			Title : "获取短信验证码",
			Width : 482
		}); */

		$("#sendsms").click(function() {
			if (!smsvalid) {
				return;
			}

			if (window.dialogpanel) {
				dialogpanel.Show();
				$("#picVerifyCode").val("");
				$("#vimg").attr("src", "/jmApp/img/img?t=" + Math.random());
			}
		});

		$("#getCodeBtn")
				.click(
						function() {
							if (!smsvalid) {
								return;
							}

							var codeval = $.trim($("#picVerifyCode").val());
							if (codeval == "") {
								$("#pic_validate_info").html("请输入验证码").show();
								return;
							}

							$
									.ajax({
										type : "post",
										data : {
											mobile : 15590062451,
											checkcode : $("#picVerifyCode")
													.val()
										},
										dataType : "json",
										url : "/findpassword/mobile/sendMobilesecuritycode",
										success : function(data, textStatus) {
											var status = data.status;
											var message = data.msg;

											if (status == 1) {
												smsvalid = false;
												dialogpanel.Hide();
												intervaltimer = setInterval(
														intervalfunc, 1000);
												var msgdiv = $("#SecurityCode")
														.parent("div")
														.next("div.msg_error");
												if (msgdiv == null
														|| msgdiv.length == 0) {
													msgdiv = $('<div class="msg_error" style="zoom:normal;"></div>');
													$("#SecurityCode").parent(
															"div")
															.after(msgdiv);
												}

												msgdiv.css("color", "#777")
														.html("验证码已发送，请查收短信！")
														.show();
											} else {
												$("#pic_validate_info").html(
														data.msg).show();
												$("#vimg")
														.attr(
																"src",
																"/jmApp/img/img?t="
																		+ Math
																				.random());
											}
										},
										error : function() {
											alert("发送失败，请重试");
										},
										complete : function(XMLHttpRequest,
												textStatus) {
											XMLHttpRequest = null;
										}
									});
						});

</script>
                            </div>
                            
                                <div style="padding:10px">
                                    <input class="form-control" data-val="true" data-val-required="请输入验证码" id="CheckCode1" name="CheckCode1" placeholder="请输入验证码" type="text" value="" style="width: 110px;height: 35px">
                                    <img id="veryCode" src= "" onClick="changeMe()" /><span></span>
                                </div>
                                <a id="submitbtn" class="navbar-brand" href="/jmApp/password2.jsp" style="padding-top: 0">
                                <button type="button" style="margin:10px;">下一步</button>
                           </a>
                        </form>

                    </div>
                </dd>
            </dl>
        </div>
    </div>
</div>

<div id="dialog" style="display: none; position: absolute; height: auto; width: 482px; background-color: rgb(255, 255, 255);">
    <div class="container_getCaptcha_title">
        获取短信验证码
        <span id="code_close" class="dialog-close">
            <img src="/jmApp/img/code-close.jpg" alt="关闭">
        </span>
    </div>
    <div class="container_getCaptcha_con">
        <div class="code_item">
            验证码 
            <input class="input01" name="picVerifyCode" id="picVerifyCode" maxlength="4" type="text">
        </div>
        <em class="msg_error" style="display: block; margin-left:60px;" id="pic_validate_info"></em>
        <div class="code_item padT29">
            <input id="getCodeBtn" class="input02" value="提交" type="button">
        </div>
    </div>
</div>
<script type="text/javascript">
    function showcheckcode(){
        $("#checkimg").attr("src","/jmaApp/jm/img?r=" + Math.random());
    }
    $(function () {
        showcheckcode();
        var vOption = {
            onkeyup: false,
            rules: {
                SecurityCode: { required: true }
            },
            messages: {
                SecurityCode: {required: "请输入验证码"}
            }
            , errorElement: "div"
        };
        window.formvalidator = $("#appform").validate(vOption);

        $("#submitbtn").click(function () {
            if (formvalidator.form()) {
                //alert("submit");
                    ZP.analysis.init_monitor_analy(document.getElementById("submitbtn"),'rpassword','mbsubmit2','007');
                document.getElementById('appform').submit();
            }
            else {
                formvalidator.focusInvalid();
                return false;
            }
        });
    });
</script>
    </div>
    <!--
    <script src="http://images.zhaopin.com/new2011/bottom/bottom_2011_utf_8.js"></script>-->
    <div id="loginfooter">
          <a onmousedown="return AdsClick(121115223,'zhilianjieshao')" target="_blank" href="http://www.91jiuma.com/jmApp/jm/MainAction.action">九马首页</a> |
        <!-- <a target="_blank" href="http://www.zhaopin.com/sitemap.html">网站地图</a> | -->
        <a onmousedown="return AdsClick(121115223,'jiaruzhilian')" target="_blank" href="http://www.91jiuma.com/jmApp/jm/ProjectAction.action">影视投资</a> |
        <a onmousedown="return AdsClick(121115223,'falvshengming')" target="_blank" href="http://www.91jiuma.com/jmApp/projectdelivery.jsp">项目投递</a> |
        <a onmousedown="return AdsClick(121115223,'baomichengnuo')" target="_blank" href="http://www.91jiuma.com/jmApp/shangcheng.jsp">九马商城</a> |
        <a onmousedown="return AdsClick(121115223,'lianxifangshi')" target="_blank" href="http://www.91jiuma.com/jmApp/travel.jsp">九马旅游</a> |
        <a onmousedown="return AdsClick(121115223,'changjianwenti')" target="_blank" href="http://www.91jiuma.com/jmApp/list.jsp">关于</a> 
        <!-- <a onmousedown="return AdsClick(121115223,'touzizheguanxi')" target="_blank" href="http://zhaopin.investorroom.com">Investor Relations</a> -->
    </div>
       <script type="text/javascript" src="/jmApp/js/index_ads.js"></script>
    <script type="text/javascript" src="/jmApp/js/global.js"></script>
<div id="dialog-mask" style="display: none; height: 100%; width: 100%; left: 0px; position: absolute; top: 0px; opacity: 0.5; background: none 0px 0px repeat scroll rgb(204, 204, 204);">
</div>
</body>
</html>