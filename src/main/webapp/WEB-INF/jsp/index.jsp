<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>秒杀首页</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<style>
* {
	margin: 0;
	padding: 0;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}

fieldset,img {
	border: 0;
}

img {
	border: none;
	margin-top: 5px;
}

address,caption,cite,code,dfn,em,strong,th,var {
	font-style: normal;
	font-weight: normal;
}

ol,ul {
	list-style: none;
}

a {
	color: #333333;
	text-decoration: none;
	font-family: 微软雅黑, 黑体, 宋体;
	font-size: 12px;
}

a:hover {
	text-decoration: none;
}

.clear {
	clear: both;
}

.hd_left {
	float: left;
}

body {
	font-family: 微软雅黑, 黑体, 宋体;
}

.content {
	width: 1000px;
	margin: 0 auto;
}

.bg {
	background:
		url(http://smzdqiang.com/data/attachment/forum/201609/19/131333mtqtuud1yqt9ujur.jpg)
		no-repeat;
	background-color: #ff0066;
	height: 850px;
	background-position: top center;
}

.top {
	background:
		url(http://smzdqiang.com/data/attachment/forum/201609/19/131251f58t8ktzjkidpqai.jpg)
		no-repeat;
	height: 254px;
	position: relative;
}

.more {
	width: 1000px;
	height: 254px;
	position: absolute;
}
/**********************秒杀***********************/
.top_tab {
	width: 960px;
	height: 490px;
	position: relative;
	overflow: hidden;
	margin-left: 20px;
}

.top_tab .on {
	background-color: #ff0;
}

.top_times1,.top_times2,.top_times3 {
	height: 65px;
	width: 320px;
	background-color: #fff;
	cursor: pointer;
	float: left;
}

.top_tab p {
	font-size: 30px;
	text-align: center;
	font-weight: bold;
	line-height: 65px;
	color: #333333;
}

.top_cont {
	width: 960px;
	height: 490px;
	display: block;
	text-align: center;
	background-color: #ffff00;
}

.top_cont .ul1 {
	position: absolute;
	top: 81px;
}

.top_cont ul li {
	height: 381px;
	width: 310px;
	margin: 0px 0px 0px 8px;
	float: left;
	background-color: #fff;
	padding-top: 8px;
	position: relative;
}

.top_cont .cp_mc {
	color: #000;
	width: 308px;
	height: 25px;
	font-size: 14px;
	line-height: 25px;
	padding-top: 15px;
}

.top_cont .cp_jg {
	height: 45px;
	width: 254px;
	font-size: 12px;
	line-height: 45px;
	background: none;
	color: #999;
}

.top_cont .cp_jg b {
	color: #ff0099;
	font-size: 28px;
}

.top_cont .cp_jg span {
	text-decoration: line-through;
}

.top_cont .cp_btn_dd,.cp_btn_ks,.cp_btn_js {
	background:
		url(http://smzdqiang.com/data/attachment/forum/201609/19/131408dpq8sfsjq3xqy3x3.png)
		no-repeat;
	height: 35px;
	width: 290px;
	margin-left: 13px;
	top: 335px;
	position: absolute;
}

.top_cont .cp_btn_dd a,.cp_btn_ks a,.cp_btn_dd span,.cp_btn_ks span,.cp_btn_js a,.cp_btn_js span
	{
	height: 35px;
	width: 290px;
	line-height: 35px;
	font-family: 黑体;
	color: #fff;
	text-align: center;
	font-size: 18px;
	text-decoration: none;
	display: block;
}

.top_cont .cp_btn_dd {
	background-position: 0px 0px;
}

.top_cont .cp_btn_ks {
	background-position: 0px -35px;
}

.top_cont .cp_btn_ks:hover {
	background-position: 0px -70px;
}

.top_cont .cp_btn_js {
	background-position: 0px -105px;
}

.top_cont .cp_btn_js:hover {
	background-position: 0px -140px;
}

.top_cont .cp_shade1,.top_cont .cp_shade2,.top_cont .cp_shade3,.top_cont .cp_shade4,.top_cont .cp_shade5,.top_cont .cp_shade6,.top_cont .cp_shade7,.top_cont .cp_shade8
	{
	width: 310px;
	height: 250px;
	background:
		url(http://smzdqiang.com/data/attachment/forum/201609/19/131507w11gcwwv3cyouz2y.png)
		no-repeat;
	position: absolute;
	top: 0px;
}

.top_cont .cp_shade2,.top_cont .cp_shade5,.top_cont .cp_shade8 {
	left: 0px;
}

.top_cont .cp_shade3,.top_cont .cp_shade6 {
	left: 0px;
}
/**********************秒杀***********************/
</style>
</head>

<body>

	<div class="bg">
		<div class="content">
			<div class="top">
				<a target="_blank" href="http://smzdqiang.com/dataoke/" class="more"></a>
			</div>
			<div class="bg_1_pp">
				<div class="top_tab">
					<div class="top_times1 on" id="top_times1">
						<p><fmt:formatDate value="${products1.killdate }" pattern="HH:mm:ss"/></p>
					</div>
					<div class="top_times2" id="top_times2">
						<p><fmt:formatDate value="${products2.killdate }" pattern="HH:mm:ss"/></p>
					</div>
					<div class="top_times3" id="top_times3">
						<p><fmt:formatDate value="${products3.killdate }" pattern="HH:mm:ss"/></p>
					</div>

					<div style="display: block;" class="top_cont" id="top_cont1">
						<ul class="ul1">
						<%-- <c:forEach items="${products }" var="product">
							<li><a href="http://www.smzdqiang.com " target="_blank"><img
									src="${product.image}" width="290" height="230"
									alt="${product.title}"> </a>
								<div class="cp_mc">${product.title}</div>
								<div class="cp_jg">
									秒杀价：￥<b>${product.killprice/100 }</b> 市场价：<span>${product.normalprice/100}</span>
								</div> <!--秒杀剩余时间-->
								<div class="cp_btn_dd" id="btn1">
									<span id="times">0小时35分14秒</span>
								</div> <!--秒杀结束时间--> <abbr style=" display: none">${product.killdate }</abbr>
								<div class="" id="shande_1"></div>
							</li>
						</c:forEach> --%>
							<li><a href="http://www.smzdqiang.com " target="_blank"><img
									src="${products1.image }" width="290" height="230"
									alt="${products1.title }"> </a>
								<div class="cp_mc">${products1.title }</div>
								<div class="cp_jg">
									秒杀价：￥<b>${products1.killprice/100 }</b> 市场价：<span>${products1.normalprice/100 }</span>
								</div> <!--秒杀结束时间--> 
								<div class="cp_btn_dd" id="btn1">
									<span id="times">0小时35分14秒</span>
								</div> <!--秒杀结束时间-->  <abbr style=" display: none"><fmt:formatDate value="${products1.killdate }" pattern="yyyy/MM/dd HH:mm:ss"/></abbr>
								<div class="" id="shande_1"></div>
							</li>
							<li><a href="http://smzdqiang.com/quan/" target="_blank"><img
									src="${products2.image }" width="290" height="230"
									alt="${products2.title }"> </a>
								<div class="cp_mc">${products2.title }</div>
								<div class="cp_jg">
									秒杀价：￥<b>${products2.killprice/100 }</b> 市场价：<span>${products2.normalprice/100 }</span>
								</div>
								<div class="cp_btn_dd" id="btn2">
									<span id="times1">0小时35分14秒</span>
								</div> <abbr style="display: none"><fmt:formatDate value="${products2.killdate }" pattern="yyyy/MM/dd HH:mm:ss"/></abbr>
								<div class="" id="shande_2"></div>
							</li>
							<li><a href="http://smzdqiang.com/dataoke/" target="_blank"><img
									src="${products3.image }" width="290" height="230"
									alt="${products3.title }"> </a>
								<div class="cp_mc">${products3.title }</div>
								<div class="cp_jg">
									秒杀价：￥<b>${products3.killprice/100 }</b> 市场价：<span>${products3.normalprice/100 }</span>
								</div>
								<div class="cp_btn_dd" id="btn3">
									<span id="times2">0小时35分14秒</span><span id="image3" style="display: none">/createOrder.html?id=${products3.id }</span>
								</div> <abbr style="display: none"><fmt:formatDate value="${products3.killdate }" pattern="yyyy/MM/dd HH:mm:ss"/></abbr>
								<div class="" id="shande_3"></div>
							</li>

						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--Tab 切换-->
	<script type="text/javascript">

        function tab(id) {
            if (id == 1) {
                $("#top_times1").siblings().removeClass("on");
                $("#top_times1").addClass("on");
            }
            if (id == 2) {
                $("#top_times2").siblings().removeClass("on");
                $("#top_times2").addClass("on");
            }
            if (id == 3) {
                $("#top_times3").siblings().removeClass("on");
                $("#top_times3").addClass("on");
            }
        }
    </script>
	<!--Tab过去遮罩-->
	<script type="text/javascript">
        function shade() {
            var date_time = new Date();
			<!-- 超过这个时间就无法购买了-->
			var time1 = document.getElementsByTagName('abbr')[0].innerHTML;
			var date1 = new Date(time1);
			var time2 = document.getElementsByTagName('abbr')[1].innerHTML;
			var date2 = new Date(time2);
			var time3 = document.getElementsByTagName('abbr')[2].innerHTML;
			var date3 = new Date(time3);
			//一个小时后过期
            if (date_time > new Date(date1.getTime()+1000*60*50)) {
				<!--图片遮住，购买按钮改变-->
                document.getElementById("shande_1").className = "cp_shade1";
                document.getElementById("btn1").className = "cp_btn_js";
                document.getElementById("btn1").innerHTML = "<a href='http://smzdqiang.com/dataoke/' target='_blank'>&nbsp;<span id='times' style='display:none;'>1</span></a>";
            }
            if (date_time > new Date(date2.getTime()+1000*60*50)) {
                document.getElementById("shande_2").className = "cp_shade2";
                document.getElementById("btn2").className = "cp_btn_js";
                document.getElementById("btn2").innerHTML = "<a href='http://smzdqiang.com/dataoke/' target='_blank'>&nbsp;<span id='times1' style='display:none;'>1</span></a>";

            }
            if (date_time > new Date(date3.getTime()+1000*60*50)) {
                document.getElementById("shande_3").className = "cp_shade3";
                document.getElementById("btn3").className = "cp_btn_js";
                document.getElementById("btn3").innerHTML = "<a href='http://smzdqiang.com/dataoke/' target='_blank'>&nbsp;<span id='times2' style='display:none;'>1</span></a>";
            }
        }
    </script>
	<!--倒计时-->
	<script type="text/javascript">
        function fresh() {
            var endtime = new Date();
            var endcount = document.getElementsByTagName('abbr').length;
            for (var s = 0; s < endcount; s++) {
				//获得每个商品秒杀结束的时间
                endtime[s] = new Date(document.getElementsByTagName('abbr')[s].innerHTML);
            }
            var nowtime = new Date();
            var leftsecond = new Date();
            for (var i = 0; i < endcount; i++) {
                leftsecond[i] = parseInt((endtime[i].getTime() - nowtime.getTime()) / 1000);
            }
            var d = new Array();
            var h = new Array();
            var m = new Array();
            var s = new Array();
            for (var j = 0; j < endcount; j++) {
                d[j] = parseInt(leftsecond[j] / 3600 / 24);
                h[j] = parseInt((leftsecond[j] / 3600) % 24);
                m[j] = parseInt((leftsecond[j] / 60) % 60);
                s[j] = parseInt(leftsecond[j] % 60);
            }
            //document.getElementById("times").innerHTML=__h+"小时"+__m+"分"+__s+"秒";
            for (var k = 0; k < endcount; k++) {
                if (d[k] == 0) {
					//是今天秒杀
                    if (k == 0) {
                        document.getElementById("times").innerHTML = h[k] + "小时" + m[k] + "分" + s[k] + "秒";
                    }
                    else {
                        document.getElementById("times" + k).innerHTML = h[k] + "小时" + m[k] + "分" + s[k] + "秒";
                    }
                }
                else {
                    if (k == 0) {
                        document.getElementById("times").innerHTML = d[k] + "天" + h[k] + "小时" + m[k] + "分" + s[k] + "秒";
                    }
                    else {
                        document.getElementById("times" + k).innerHTML = d[k] + "天" + h[k] + "小时" + m[k] + "分" + s[k] + "秒";
                    }
                }
            }
            var image3 = document.getElementById("image3").innerHTML;
            for (var l = 0; l < endcount; l++) {
                if (leftsecond[l] <= 0) {
					//各个商品秒杀开始
                    if (l == 0) {
                        document.getElementById("btn1").className = "cp_btn_ks";
                        document.getElementById("btn1").innerHTML = "<a href='http://www.smzdqiang.com/' target='_blank'>&nbsp;<span id='times' style='display:none;'>1</span></a>";
                    }
                    else if (l == 1) {
                        document.getElementById("btn2").className = "cp_btn_ks";
                        document.getElementById("btn2").innerHTML = "<a href='http://www.smzdqiang.com/' target='_blank'>&nbsp;<span id='times1' style='display:none;'>1</span></a>";
                    }
                    else if (l == 2) {
                        document.getElementById("btn3").className = "cp_btn_ks";
                        document.getElementById("btn3").innerHTML = "<a href='"+image3+"' target='_blank'>&nbsp;<span id='times2' style='display:none;'>1</span></a>";
                    }
                }
            }
            shade();
        }
        fresh();
        var sh;
		//每秒刷新一次
        sh = setInterval(fresh, 1000);
    </script>
</body>
</html>
