<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'qr.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <link rel="stylesheet" type="text/css"
	href="/jmApp/bootstrap-3.3.5-dist/css/bootstrap.min.css">
  </head>
  
  <body>
   
    <div class="modal-header">
       <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
       <c:choose>
          <c:when test="${param.payType==1 }">
              <h4 class="modal-title" id="myLargeModalLabel" style="text-align: center;">支付宝支付</h4>
          </c:when>
          <c:when test="${param.payType==2 }">
              <h4 class="modal-title" id="myLargeModalLabel" style="text-align: center;">微信支付</h4>
          </c:when>
       </c:choose>
       
    </div>
     <div class="modal-body" style="text-align: center;">
        <img src="${pageContext.request.contextPath}/servlet/PaymentServlet?projectId=${param.projectId}&goodsName=${param.goodsName }&amount=${param.amount }&payType=${param.payType}" style="height:270px;">
     </div>
  </body>
</html>
