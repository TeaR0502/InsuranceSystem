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
<title>管理员登陆!</title>
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
<script src="jquerysession.js"></script>
</head>
<body>
	<div class="vbox-0 w350 cen">
		<!-- 管理员登录 -->
		<div id="divlogin">
			<div class="easyui-panel vbox-1" title="管 理 员 登 录">
				<form action="proja/Admin/login.do" method="POST" id="fmlogin">
					<div>管理员</div>
					<input class="easyui-textbox w300" required="true" name="name" />
					<div>密码</div>
					<input type="password" required="true" class="easyui-textbox w300"
						name="pwd" />
					<div class="h20"></div>
					<button type="submit" class="btn-1 w100p">登录</button>
					<div class="h10"></div>
				</form>
			</div>
		</div>
	</div>
	<script>
		//登录表单转为ajax表单
		$("#fmlogin").form({
			success : function(data) {
				//登录失败时
				if (data == "err") {
					$.messager.alert("登录信息", "管理员/密码 不正确");
					return;
				}
				//登录成功/保存用户session
				$.messager.alert("登录信息", "登录成功");
				//刷新
				parent.location.reload();
			}
		});
	</script>
</body>
</html>
