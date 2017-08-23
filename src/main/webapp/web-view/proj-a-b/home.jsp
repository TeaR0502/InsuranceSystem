<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<title>My JSP 'zero.jsp' starting page</title>
<!-- css/js -->
<link rel="stylesheet" href="web-part/easyui/themes/insdep/easyui.css" />
<link rel="stylesheet"
	href="web-part/easyui/themes/insdep/easyui_animation.css" />
<link rel="stylesheet"
	href="web-part/easyui/themes/insdep/easyui_plus.css" />
<link rel="stylesheet"
	href="web-part/easyui/themes/insdep/insdep_theme_default.css" />
<link rel="stylesheet" href="web-part/easyui/themes/insdep/icon.css" />
<link rel="stylesheet"
	href="web-part/easyui/plugin/font-awesome-4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="web-part/easy/css/base.css" />
<script src="web-part/easyui/jquery.min.js"></script>
<script src="web-part/easyui/jquery.easyui-1.5.1.min.js"></script>
<script src="web-part/easyui/themes/insdep/jquery.insdep-extend.min.js"></script>
<script src="web-part/easy/js/base.js"></script>
<script src="web-part/easy/js/jquery.cookie.js"></script>
<script src="web-part/easy/js/jquery.time.js"></script>
</head>
<body>
	<div class="w90p cen">
		<div class="vbox-1 cen txt-c w300 ft-1-g shadow">@ 流 程 简 介</div>
		<div class="h10"></div>
		<div class="vbox-2 h200"></div>
		<div class="h10"></div>
		<div class="vbox-1 cen txt-c w300 ft-1-g shadow">@ 注 意 事 项</div>
		<div class="h10"></div>
		<div class="vbox-2 h200"></div>
	</div>
	<script>
		//
	</script>
</body>
</html>
