<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<title>My JSP 'view.jsp' starting page</title>
<link rel="stylesheet" href="web-part/easy/css/base.css" />
</head>
<body>
	<div class="vbox-1 shadow w300 cen txt-c ft-2-b">M Y S S M @ 2 0
		1 6</div>
	<!-- js -->
	<script src="web-part/easy/js/jquery.js"></script>
	<script>
		//
	</script>
</body>
</html>
