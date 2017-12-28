<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>订单详情</title>
    
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
  <h3>恭喜你成功秒杀到了${product.title }！手速很快哦</h3>
    订单详情如下： <br>
    <div id="productPic">
    	<img alt="${product.title }" src="${product.image }">
    </div>
    <div id="orderInfo">
    	<strong>商品名称：${product.title }</strong><br>
    	<strong>商品价格：${product.killprice/100 }元</strong><br>
    	<strong>商品数量：1</strong><br>
    	<strong>订单号：${order.orderid }</strong><br>
    	<strong>邮费：${order.postFee==0?"包邮":"order.postFee" }</strong><br>
    	<strong>预计送达时间：<fmt:formatDate value="${order.consigntime }" pattern="yyyy/MM/dd"/></strong><br>
    </div>
    <a href="/">继续秒杀！</a>
  </body>
</html>
