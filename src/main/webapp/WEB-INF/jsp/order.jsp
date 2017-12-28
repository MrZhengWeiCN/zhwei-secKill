<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>订单填写</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <div id="orderForm">
   		<div id="ProductPic">
   			<img style="margin:auto" alt="${product.title}" src="${product.image}" width="350" height="350">
   		</div>
		<form name="createOrder" action="/doCreateOrder.html" method="post">
			<input type="hidden" name="productId" value="${product.id}">
			<input type="hidden" name="payment" value="${product.killprice}">
			买家昵称:<input type="text" name="buyerNick" /><br /> 
			买家备注:<input type="text" name="buyerMessage" /><br /> 
		        商品价格:<strong>${product.killprice}</strong><br /> 
			秒杀数量:<strong>1<br />
			商品邮费:<strong>免邮费<br /><br /> 
			<input type="submit" value="提交">
		</form>
	</div>
  </body>
</html>
