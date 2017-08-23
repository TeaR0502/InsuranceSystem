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
	<div class="vbox-0 w90p bg-3">
		<div id="oprmsg" class="vbox-1 w250 shadow cen ft-1-g txt-c">@ 我
			的 关 注</div>
		<div class="h20"></div>
		<!-- 意向产品浏览 -->
		<div id="lstitt">
			<div class="vbox-0">
				<div class="ft-g">
					<i class="fa fa-telegram"></i>&nbsp;@name&nbsp;&nbsp;@creatorname&nbsp;&nbsp;@createtime
				</div>
				<div class="vbox-0">@memo</div>
				&nbsp;
				<button class="btn-1 w100" onclick="sendapply('@id');">发起申请</button>
				<button class="btn-2 w100" onclick="cancel('@id');">取消关注</button>
			</div>
			<div class="h10"></div>
		</div>
	</div>
	<script>
		//获取我加入的产品组
		listMyIntent();

		//意向产品模板
		var tmpl_intent = $("#lstitt").html();
		$("#lstitt").empty();

		//获取我加入的产品组
		function listMyIntent() {
			//用户验证
			if ($.session("id") == "") {
				$("#oprmsg").html("用户未登录/无法获取关注产品");
				return;
			}
			//获取我的意向
			$.post("Product/myIntent", {
				userid : $.session("id")
			}, function(data) {
				//获取响应
				var res = $.parseJSON(data);
				$("#lstitt").empty();
				//显示数据
				$.each(res, function(i, n) {
					var row = tmpl_intent.replaceAll("@id", n.productid).replaceAll(
							"@name", n.productname).replaceAll("@creatorname",
							n.username).replaceAll("@createtime",
							$.msfmt.todate(n.createtime, true, 8)).replaceAll(
							"@memo", n.memo);
					$("#lstitt").append(row);
				});
			});
		}

		//取消意向
		function cancel(prdid) {
			$.post("UserProduct/delete", {
				userid : $.session("id"),
				productid : prdid
			}, function(data) {
				if (data == "ok") {
					$.messager.alert("关注操作", "取消关注成功");
					listMyIntent();
				}
			});
		}

		//发起申请
		function sendapply(prdid) {
			$.post("Application/insert", {
				userid : $.session("id"),
				username : $.session("name"),
				productid : prdid
			}, function(data) {
				if (data != "ok") {
					$.messager.alert("申请操作", data);
					return;
				}
				$.messager.alert("申请操作", "申请已发起/可在[我的申请]中查看受理状况");
			});
		}
	</script>
</body>
</html>
