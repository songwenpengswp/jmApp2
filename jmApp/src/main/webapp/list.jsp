<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
	 <jsp:include page="header.jsp"></jsp:include>
    <div style="background: #f5f5f5;overflow: hidden;margin-top: 60px;">
        <div style="float: left;margin: 30px 30px 10px 150px;background: white;border:solid 1px #e9e9e9;">
        	<ul class="nav nav-pills nav-stacked" role="tablist" style="margin-top: 20px;margin-bottom: 20px;text-align: center;font-size: 20px;">
                      <li role="presentation" class="active" style="margin: 20px 10px 20px 10px;"><a href="#media" aria-controls="media" role="tab" data-toggle="tab">关于九马</a></li>
                      <li role="presentation" style="margin: 20px 10px 20px 10px;"><a href="#question" aria-controls="question" role="tab" data-toggle="tab">发起人手册</a></li>
                      <li role="presentation" style="margin: 20px 10px 20px 10px;"><a href="#job" aria-controls="job" role="tab" data-toggle="tab">用户协议</a></li>
                      <li role="presentation" style="margin: 20px 10px 20px 10px;"><a href="#safe" aria-controls="safe" role="tab" data-toggle="tab">原则与机制</a></li>
                 <!--      <li role="presentation" style="margin: 20px 10px 20px 10px;"><a href="#guide" aria-controls="guide" role="tab" data-toggle="tab">投资指南</a></li>
                      <li role="presentation" style="margin: 20px 10px 20px 10px;"><a href="#about" aria-controls="about" role="tab" data-toggle="tab">关于玖马</a></li>
                      <li role="presentation" style="margin: 20px 10px 20px 10px;"><a href="#contact" aria-controls="contact" role="tab" data-toggle="tab">联系我们</a></li> 
                      <li role="presentation" style="margin: 20px 10px 20px 10px;"><a href="#word" aria-controls="word" role="tab" data-toggle="tab">创始人寄语</a></li>
                      <li role="presentation" style="margin: 20px 10px 20px 10px;"><a href="#older" aria-controls="older" role="tab" data-toggle="tab">往期项目</a></li>  
                      <li role="presentation" style="margin: 20px 10px 20px 10px;"><a href="#advantage" aria-controls="advantage" role="tab" data-toggle="tab">平台优势</a></li>
                      <li role="presentation" style="margin: 20px 10px 20px 10px;"><a href="#announce" aria-controls="announce" role="tab" data-toggle="tab">网站公告</a></li>   -->
            </ul>
        </div>
        <div  class="tab-content" style="float: left;margin: 30px 150px 10px 30px;background: white">
        	<div   role="tabpanel" class="tab-pane active" id="media" style="width: 750px;">
        	<jsp:include page="about.jsp"></jsp:include>
			 </div>
        	</div>
        	
        	<div   role="tabpanel" class="tab-pane cjwt" id="question" style="width: 750px;">
        	 <jsp:include page="originator.jsp"></jsp:include>
        	</div>
        	
        	<div   role="tabpanel" class="tab-pane aqbz" id="safe" style="width: 750px;">
        	    <jsp:include page="principle.jsp"></jsp:include>        	                             
        	</div>
        	
        	<div   role="tabpanel" class="tab-pane" id="job" style="width: 750px;">
        	   <div class="aqbz" style="margin: 30px 20px 10px 20px">
        	   	    <jsp:include page="agreement.jsp"></jsp:include>
        	   </div>
        	</div>












        	
        	<div   role="tabpanel" class="tab-pane" id="guide" style="width: 750px;">	
        	   <div style="text-align: left; font-size: 16px; line-height: 24px;margin: 30px 20px 10px 20px">
						<h2 style="text-align: left; font-size: 24px;">电影投资项目：</h2>
						<br>
						<p>电影投资项目为封闭投资项目，投资周期与电影项目整体制作、发行的运作周期同步，在6到24个月不等，规模和风险由投资方参与的不同阶段以及风险控制策略决定。</p>
						<br>
						<h2 style="text-align: left; font-size: 20px;">资金用途：</h2>
						<p>根据参与阶段的不同分为制片专项资金，宣发专项资金，以及整体投资。</p>
						<p>其中制片资金用于剧本开发、演职员片酬、制作、后期等制片投资。</p>
						<p>宣发资金用于宣传、发行投资。</p>
						<p>整体投资的资金使用则包含上述两者。</p>
						<br>
						<h2 style="text-align: left; font-size: 20px;">投资收益：</h2>
						<p>电影的投资收益主要由院线票房分成收入、植入广告收入、电视播映权收入、网络信息传播权发行收入、其他新媒体发行收入及海外发行收入构成。</p>
						<br>
						<h2 style="text-align: left; font-size: 20px;">投资风险：</h2>
						<p>投资行为存在宏观经济风险、行业风险、发行风险。</p>
						<p>不同的投资项目，存在不同的风险水平等级。聚米众筹监督项目方，根据项目的不同特点为投资建立项目封闭运作、账户监管、版权控制、优先回款、补足责任等最大限度保障投资安全的风险控制机制。（具体每个项目的风控机制，以每个项目披露的投资文件为准）</p>

						<br> <br>

						<h2 style="text-align: left; font-size: 24px;">电视投资项目：</h2>
						<br>
						<p>电视投资项目为封闭投资项目，投资周期与电视剧整体制作、发行的运作周期同步，在6到24个月不等，规模和风险由投资方参与的不同阶段以及风险控制策略决定。</p>
						<br>
						<h2 style="text-align: left; font-size: 20px;">资金用途：</h2>
						<p>根据参与阶段的不同分为制片专项资金，宣发专项资金，以及整体投资。</p>
						<p>其中制片资金用于剧本开发、演职员片酬、制作、后期等制片投资。</p>
						<p>宣发资金用于宣传、发行投资。</p>
						<p>整体投资的资金使用则包含上述两者。</p>
						<br>
						<h2 style="text-align: left; font-size: 20px;">投资收益：</h2>
						<p>电视剧的投资收益主要由电视播映收入、植入广告收入、信息网络传播权发行收入、其他新媒体发行收入及海外发行收入构成。</p>
						<br>
						<h2 style="text-align: left; font-size: 20px;">投资风险：</h2>
						<p>投资行为存在宏观经济风险、行业风险、发行风险。
						</p><p>不同的投资项目，存在不同的风险水平等级。聚米众筹监督项目方，根据项目的不同特点为投资建立项目封闭运作、账户监管、版权控制、优先回款、补足责任等最大限度保障投资安全的风险控制机制。（具体每个项目的风控机制，以每个项目披露的投资文件为准）</p>
	            </div>
            </div>
        	<div   role="tabpanel" class="tab-pane" id="about" style="width: 750px;" >
        	   <img src="img/gyjm.jpg" alt="" style="width:700px;">
        	</div>
        	<div   role="tabpanel" class="tab-pane" id="contact">
        	    <div style="width: 750px;">
        	   	  <img src="img/address.png" alt="" style="margin: 20px;"/>
        	    </div>
        	    <div style="font-size:16px;line-height:36px;margin-left: 20px;">
					<p><span class="glyphicon glyphicon-map-marker" style="font-size:24px;" aria-hidden="true"></span>：杭州市西湖区天目山路398号尚坤大厦3楼322室     </p>
					<p><i class="glyphicon glyphicon-phone" style="font-size:24px;"></i>：0571-89731677、89731678、89731679</p>
					<p><i class="glyphicon glyphicon-earphone" style="font-size:24px;"></i>：0571-89731676</p>
					<p><i class="glyphicon glyphicon-envelope" style="font-size:24px;"></i>：jiuma@jumifinance.com</p>

				</div>
        	</div>
        	<div   role="tabpanel" class="tab-pane" id="word">
        	   <img src="img/zczc.jpg" alt="" style="width:700px;">
        	</div>
        	<div   role="tabpanel" class="tab-pane" id="older">
        	   <img src="img/wqxm.jpg" alt="" style="width:700px;">
        	</div>
        	<div   role="tabpanel" class="tab-pane" id="advantage">
        	    <img src="img/ptys.png" alt="" style="width:700px;">
        	</div>
        	<div   role="tabpanel" class="tab-pane" id="announce" style="width: 750px;">
        	      <div class="list-group" style="margin: 30px 20px 10px 20px">
				  <a href="#" class="list-group-item">
				    <h4>[全金属裂痕]回款公告<small style="margin-left: 20px;">2015-11-9 12:34:56</small></h4>
				    
				  </a>
				  <a href="#" class="list-group-item">
				  	<h4>[逗比男生]回款公告<small style="margin-left: 20px;">2015-11-9 12:34:56</small></h4>
				  </a>
				  <a href="#" class="list-group-item">
				  	<h4>[惊魂夜大事件]回款公告<small style="margin-left: 20px;">2015-11-9 12:34:56</small></h4>
				  </a>
				  <a href="#" class="list-group-item">
				  	<h4>[片场风云之冤家姐妹]回款公告<small style="margin-left: 20px;">2015-11-9 12:34:56</small></h4>
				  </a>
				  <a href="#" class="list-group-item">
				  	<h4>[监灵神探]上映公告<small style="margin-left: 20px;">2015-11-9 12:34:56</small></h4>
				  </a>

				  <a href="#" class="list-group-item">
				    <h4>[儿童总裁]回款公告<small style="margin-left: 20px;">2015-11-9 12:34:56</small></h4>
				  </a>
				  <a href="#" class="list-group-item">
				  	<h4>[逗比男生]上映公告<small style="margin-left: 20px;">2015-11-9 12:34:56</small></h4>
				  </a>
				  <a href="#" class="list-group-item">
				  	<h4>[片场风云之冤家姐妹]上映公告<small style="margin-left: 20px;">2015-11-9 12:34:56</small></h4>
				  </a>
				  <a href="#" class="list-group-item">
				  	<h4>[惊魂夜大事件]上映公告<small style="margin-left: 20px;">2015-11-9 12:34:56</small></h4>
				  </a>
				  <a href="#" class="list-group-item">
				  	<h4>有关众筹项目进度的公告<small style="margin-left: 20px;">2015-11-9 12:34:56</small></h4>
				  </a>
			 </div>
        	</div>
        </div>
    </div>
</body>
</html>