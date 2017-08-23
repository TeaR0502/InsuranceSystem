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
	<div class="vbox-2 w450 cen">
		<form action="Product/addrequire" method="POST"
			onsubmit="return checklogin();" id="fm-req">
			<div class="txt-c ft-2-g" id="requiretitle">@ 我 的 需 求</div>
			<div class="h20"></div>
			<div>
				<i class="fa fa-telegram"></i> 请输入保险名称
			</div>
			<input class="easyui-textbox w450" required="true" name="name" />
			<div>
				<i class="fa fa-telegram"></i> 请输入保险描述
			</div>
			<input class="easyui-textbox w450" style="height:300px;"
				multiline="true" required="true" name="memo" />
			<div class="h20"></div>
			<button class="btn-1 w450" type="submit">提交需求</button>
		</form>
	</div>
	<script>
		//检测登录
		function checklogin() {
			if (!$.session("id")) {
				$.messager.alert("提交需求", "请先登录用户");
				$("#fm-req").form("clear");
				return false;
			}
			return true;
		}
		//提交需求
		$("#fm-req").form({
			success : function(data) {
				if (data != "ok") {
					$.messager.alert("提交需求", data);
					return;
				}
				$.messager.alert("提交需求", "提交需求成功");
				$("#fm-req").form("clear");
			}
		});
	</script>
</body>
</html>
