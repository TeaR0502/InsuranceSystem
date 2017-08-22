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
<script src="web-part/easy/js/jquery.upload.js"></script>
</head>
<body>
	<div>
		<div class="h10"></div>
		<div class="vbox-1 cen txt-c w250 ft-2-g shadow">@ 我 的 资 料</div>
		<div class="h20"></div>
		<div class="vbox-1 shadow" id="fm-myinfo">
			<!-- 基本资料区 -->
			<div>
				<table class="table table-very table-basic">
					<tr>
						<td>真实姓名</td>
						<td><input class="easyui-textbox w150" name="truename"
							value="${user.truename}" /></td>
						<td>手机号</td>
						<td><input class="easyui-textbox w150" name="mobile"
							value="${user.mobile}" /></td>
						<td>身份证</td>
						<td><input class="easyui-textbox w200" name="idcard"
							value="${user.idcard}" /></td>
					</tr>
					<tr>
						<td>电子邮箱</td>
						<td><input class="easyui-textbox w150" name="email"
							value="${user.email}" /></td>
						<td>密码</td>
						<td><input class="easyui-textbox w150" name="pwd"
							value="${user.pwd}" type="password" /></td>
						<td>重复密码</td>
						<td><input class="easyui-textbox w150" name="repass"
							value="${user.pwd}" type="password" /></td>
						<td></td>
						<td></td>
					</tr>
				</table>
			</div>
			<div class="h30"></div>
			<!-- 图片上传区 -->
			<div>
				<table class="table table-very table-basic">
					<tr>
						<td style="text-align:center;"><a href="javascript:"
							class="link ft-g" onclick="upload1();"><i
								class="fa fa-window-restore"></i> 上传身份证正面</a>
							<div class="h10"></div> <img id="idcard_1" alt=""
							onerror="this.src='web-part/easy/img/nopic.jpg'" width="350px"
							height="220px" /></td>
						<td style="text-align:center;"><a href="javascript:"
							class="link ft-g" onclick="upload2();"><i
								class="fa fa-window-restore"></i> 上传身份证反面</a>
							<div class="h10"></div> <img id="idcard_2" alt=""
							onerror="this.src='web-part/easy/img/nopic.jpg'" width="350px"
							height="220px" /></td>
					</tr>
				</table>
			</div>
			<!-- 隐藏文件域 -->
			<input id="myfile1" type="file" name="imagefile" accept="image/jpeg"
				style="display:none;" /><input id="myfile2" type="file"
				name="imagefile" accept="image/jpeg" style="display:none;" />
			<div class="h50"></div>
			<!-- 更新按钮 -->
			<button class="btn-1 w100p" onclick="updateInfo();">更 新 资 料</button>
		</div>
	</div>
	<script>
		//显示证件图片
		showIdCard();

		//更新我的资料
		function updateInfo() {
			var info = $.getFormVals("#fm-myinfo");
			$.post("proja/User/updateInfo", info, function(data) {
				if (data != "ok") {
					$.messager.alert("更新资料", data);
					return;
				}
				$.messager.alert("更新资料", "更新资料成功");
			});
		}

		//显示证件图片
		function showIdCard() {
			var src1 = "extra/" + $.session("name") + "/idcard_1.jpg?"
					+ Math.random();
			var src2 = "extra/" + $.session("name") + "/idcard_2.jpg?"
					+ Math.random();
			$("#idcard_1").attr("src", src1);
			$("#idcard_2").attr("src", src2);
		}

		//上传1-正面
		function upload1() {
			$("#myfile1").click();
			$("#myfile1").ajaxfileupload({
				action : "proja/Application/upload1",
				valid_extensions : [ "jpg", "jpeg" ],
				params : {},
				onComplete : function(resp) {
					if (resp != "ok") {
						$.messager.alert("上传操作", resp);
						return;
					}
					showIdCard();
					$.messager.alert("上传操作", "上传成功");
				},
				onCancel : function() {
				}
			});
		}

		//上传2-反面
		function upload2() {
			$("#myfile2").click();
			$("#myfile2").ajaxfileupload({
				action : "proja/Application/upload2",
				valid_extensions : [ "jpg", "jpeg" ],
				params : {},
				onComplete : function(resp) {
					if (resp != "ok") {
						$.messager.alert("上传操作", resp);
						return;
					}
					showIdCard();
					$.messager.alert("上传操作", "上传成功");
				},
				onCancel : function() {
				}
			});
		}
	</script>
</body>
</html>
