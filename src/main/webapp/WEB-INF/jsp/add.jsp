<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">

<title>秒杀商品添加</title>

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
	<div id="addform">
		<form name="addProduct" action="/doAddProduct.html" method="post">
			商品名称:<input type="text" name="title" /><br /> 
			秒杀价格:<input type="text" name="killprice" /><br /> 
		        市场价格:<input type="text" name="normalprice" /><br /> 
			秒杀数量:<input type="text" name="num" /><br />
			商品图片:<input type="text" name="image" /><br /> 
			秒杀日期:<input type="text" name="killdate" value="格式yyyy/MM/dd HH:mm:ss"/><br /> 
			 <input type="submit" value="提交">
		</form>
	</div>
</body>
</html>
