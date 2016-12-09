<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>项目支付</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css"
	href="/jmApp/bootstrap-3.3.5-dist/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="image-picker/image-picker.css">

    <script src="/jmApp/bootstrap-3.3.5-dist/js/jquery.min.js"></script>
    <script src="/jmApp/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
    <script src="image-picker/image-picker.min.js"></script>
  </head>
  
  <body style="background-color: #f5f5f5">
    <jsp:include page="header.jsp"></jsp:include>
	<div class="panel panel-success" style="margin: 100px 100px 0px 100px">
       <div class="panel-heading">
          <h3 class="panel-title"><b>${param.pro_title }</b></h3>
       </div>
       <div class="panel-body">
           本金加预期${param.pro_rate}%的年化收益；
       </div>
   </div>
   <div class="panel panel-default" style="margin: 30px 100px 0px 100px">
      <div class="panel-body">
        <h3 class="panel-title"><b>确认订单信息</b></h3>
        <hr/>
        <table class="table">
           <thead>
             <tr >
               <th style="text-align: center;color: #969696;font-size: 17px;">档位</th>
               <th style="text-align: center;color: #969696;font-size: 17px;">数量/份</th>
               <th style="text-align: center;color: #969696;font-size: 17px">合计/元</th>
             </tr>
           </thead>
           <tbody>
             <tr class="info" style="height: 50px;">
               <td style="text-align: center;vertical-align: middle;">${param.pro_price }元/份</td>
               <td style="text-align: center;vertical-align: middle;">${param.pro_num }</td>
               <td style="text-align: center;vertical-align: middle;">${param.pro_total }</td>
             </tr>
           </tbody>
        </table>
        <div class="container">
        	<div class="row">
        		<div class="col-md-offset-7">
        			<h4 >选择支付方式</h4>
                    <div class="picker" style="margin-left: 120px;">
                       <select class="image-picker show-labels show-html">
                          <option  data-img-src='img/zfb.jpg' value='1' ></option>
                          <option  data-img-src='img/wxzf.png' value='2' ></option>
                       </select>
                    </div>
                    <a  type="button" class="btn btn-warning" style="margin-left: 250px;" data-toggle="modal" data-target=".bs-example-modal-sm">确认支付</a>
                    <div id="payment_modal" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-sm">
                           <div class="modal-content">
                              <div class="modal-header">
                                 <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                 <h4 class="modal-title" id="myLargeModalLabel" style="text-align: center;">支付宝支付</h4>
                              </div>
                               <div class="modal-body" style="text-align: center;">
                                  
                               </div>
                           </div>
                        </div>
                    </div>
        		</div>
        	</div>
        </div>
        
      </div>
   </div>
   <script type="text/javascript">
   
      $(document).ready(function(){
          jQuery('select.image-picker.show-labels').imagepicker({
           hide_select:  true,
           show_label:   true,
          });
          
          $('a').click(function(){
              $(this).attr('href','${pageContext.request.contextPath}/qr.jsp?projectId=${param.pro_id}&goodsName=${param.pro_title }&amount=${param.pro_total }&payType='+$('select').val());
          });
          
          $("#payment_modal").on("hidden.bs.modal", function() {
             
             $(this).removeData("bs.modal");
          });
      });
   	   
   
   </script>
   <script >
      
   </script>
</body>
</html>
