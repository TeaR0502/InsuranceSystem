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
	<div class="vbox-0 w350 cen">
		<!-- 用户登录 -->
		<div id="divlogin">
			<div class="easyui-panel vbox-1" title="用 户 登 录">
				<form action="user/login" method="POST" id="fmlogin">
					<div>用户名</div>
					<input class="easyui-textbox w300" required="true" name="name" />
					<div>密码</div>
					<input type="password" required="true" class="easyui-textbox w300"
						name="pwd" />
					<div class="h20"></div>
					<button type="submit" class="btn-1 w100p">登录</button>
					<div></div>
					<a href="javascript:" class="link" onclick="toreg();">注册新用户</a>
					<div class="h10"></div>
				</form>
			</div>
		</div>
		<div class="h10"></div>
		<!-- 用户注册 -->
		<div id="divreg">
			<div class="easyui-panel vbox-1" title="用 户 注 册">
				<form action="user/register" method="POST" id="fmreg">
					<div>用户名</div>
					<input class="easyui-textbox w300" required="true" name="name" />
					<div>密码</div>
					<input type="password" class="easyui-textbox w300" required="true"
						name="pwd" />
					<div>重输密码</div>
					<input type="password" class="easyui-textbox w300" required="true"
						name="repass" />
					<div>手机号</div>
					<input class="easyui-textbox w300" required="true" name="mobile" />
					<div>
						电子邮箱&nbsp;&nbsp;<a href="javascript:" class="link ft-g"
							onclick="sendVerifyCode();"><i class="fa fa-telegram"></i>发送验证码</a>
					</div>
					<input class="easyui-textbox w300" required="true" name="email"
						id="email" />
					<div>邮箱验证码</div>
					<input class="easyui-textbox w300" required="true"
						name="verifycode" />
					<div class="h20"></div>
					<button type="submit" class="btn-1 w100p">注册</button>
					<div></div>
					<a href="javascript:" class="link" onclick="tologin();">已有用户名/登录</a>
					<div class="h10"></div>
				</form>
			</div>
		</div>
	</div>
	<script>
		//隐藏注册
		$("#divreg").slideUp();
		//转到注册
		function toreg() {
			$("#divlogin").slideUp(500);
			$("#divreg").slideDown(500);
		}
		//转到登录
		function tologin() {
			$("#divreg").slideUp(500);
			$("#divlogin").slideDown(500);
		}

		//登录表单转为ajax表单
		$("#fmlogin").form({
			success : function(data) {
				//登录失败时
				if (data == "err") {
					$.messager.alert("登录信息", "用户名/密码 不正确");
					return;
				}
				//登录成功/保存用户session
				$.messager.alert("登录信息", "登录成功");
				var res = $.parseJSON(data);
				$.session("id", res.userId);
				$.session("name", res.name);
				//刷新
				parent.location.reload();
			}
		});

		//注册表单转为ajax表单
		$("#fmreg").form({
			success : function(data) {
				//注册失败时
				if (data != "ok") {
					$.messager.alert("注册操作", data);
					return;
				}
				//注册成功/清空登录session
				$.messager.alert("注册操作", "用户注册成功/请重新登录");
				$.session("id", "");
				$.session("name", "");
				parent.location.reload();
			}
		});

		//发送邮箱验证码
		function sendVerifyCode() {
			$.post("user/sendVerifyCode", {
				targetmail : $.trim($("#email").val())
			}, function(data) {
				if (data != "ok")
					return;
				$.messager.alert("验证码", "验证码已经发送到指定邮箱");
			});
		}
	</script>
</body>
</html>
