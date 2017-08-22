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
<!-- 百度UE -->
<script src="web-part/editor/ueditor.config.js"></script>
<script src="web-part/editor/ueditor.all.min.js"></script>
</head>
<body>
	<div class="easyui-layout" fit="true">
		<div region="north" class="vbox-0">
			<div class="h10"></div>
			<div class="vbox-2" id="oprmsg">
				起始日期 <input id="date1" class="w150" /> => 截止日期 <input id="date2"
					class="w150" />
			</div>
			<div class="h20"></div>
		</div>
		<div region="center" class="box-0">
			<div id="lstapply">
				<div>
					<div>
						&nbsp;
						<button class="btn-1 w100"
							onclick="signReply('@id','@usertruename');">用户签字</button>
						<button class="btn-2 w100" onclick="cancelApply('@id');">撤销申请</button>
						&nbsp;<a href="javascript:" class="link ft-g"
							onclick="extraInfo('@id');">附加资料</a>
					</div>
					<table class="table table-celled">
						<thead>
							<tr>
								<th class="w50">单号</th>
								<th>保险号</th>
								<th>保险名</th>
								<th>周期(日)</th>
								<th>用户名</th>
								<th>真实姓名</th>
								<th>手机号</th>
								<th>身份证号</th>
								<th>申请时间</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>@id</td>
								<td>@productid</td>
								<td>@productname</td>
								<td>@productperiod</td>
								<td>@username</td>
								<td>@usertruename</td>
								<td>@usermobile</td>
								<td>@useridcard</td>
								<td>@createtime</td>
							</tr>
							<tr>
								<td>受理<br />状况
								</td>
								<td>@state</td>
								<td colspan="7">@reply</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="h30"></div>
				<!-- 电子签章 -->
				<div class="w150 h70 fr txt-c ft-2-g rotate-l radius hide" id="@id"
					style="border:2px solid #F08080;margin-top:-100px;margin-right:100px;">
					<div class="h20"></div>
					<div>@esign</div>
					<div>@esigntime</div>
				</div>
			</div>
			<!-- 弹层-附加资料 -->
			<div id="mypop-extra" class="vbox-1 shadow w300 h250 hide"
				style="position:fixed;top:20%;left:25%;background-color:white;">
				<button class="btn-1 w100p" onclick="closeExtra();">保存/关闭</button>
				<span>单号</span>&nbsp;<span id="applyid"></span>
				<div id="ue-extra" class="h150"></div>
			</div>
		</div>
	</div>
	<script>
		//date1/date2
		var date1 = $.dtfmt.cur(false, 8);
		var date2 = $.dtfmt.cur(false, 8);

		$("#date1").datebox({
			onSelect : function(date) {
				date1 = $("#date1").datebox("getValue");
				showMyApply();
			}
		});
		$("#date2").datebox({
			onSelect : function(date) {
				date2 = $("#date2").datebox("getValue");
				showMyApply();
			}
		});

		//ue
		var ue = UE.getEditor("ue-extra", {
			toolbars : [ [ "attachment", "link", "simpleupload", "emotion" ] ]
		});

		//申请单模板
		var tmpl_apply = $("#lstapply").html();
		$("#lstapply").empty();

		//获取我的申请单
		showMyApply();

		//获取我的申请单
		function showMyApply() {
			//用户验证
			if ($.session("id") == "") {
				var msg = "<div class='txt-c ft-1-g'>用户未登录/无法获取申请单</div>";
				$("#oprmsg").html(msg);
				return;
			}
			//获取数据
			$.post("proja/Application/myapply", {
				userid : $.session("id"),
				date1 : date1,
				date2 : date2
			}, function(data) {
				var res = $.parseJSON(data);
				$("#lstapply").empty();
				$.each(res, function(i, n) {
					var row = tmpl_apply.replaceAll("@id", n.id).replaceAll(
							"@productid", n.productid).replaceAll(
							"@productname", n.productname).replaceAll(
							"@productperiod", n.productperiod).replaceAll(
							"@username", n.username).replaceAll(
							"@usertruename", n.usertruename).replaceAll(
							"@usermobile", n.usermobile).replaceAll(
							"@useridcard", n.useridcard).replaceAll(
							"@createtime",
							$.msfmt.todate(n.createtime, true, 8)).replaceAll(
							"@reply", n.reply).replaceAll("@state",
							showstate(n.state)).replaceAll("@esigntime",
							$.msfmt.todate(n.esigntime, true, 8)).replaceAll(
							"@esign", n.esign);
					$("#lstapply").append(row);
					//签名显示逻辑
					if (n.esign != "")
						$("#" + n.id).show();
				});
			});
		};

		//格式化受理状态
		function showstate(val) {
			if (val == "0")
				return "审核未通过";
			if (val == "1")
				return "审核通过";
			if (val == "2")
				return "保单送达";
		}

		//用户签字
		function signReply(appid, truename) {
			//签字前确认
			$.messager.confirm("签字确认", "签字后即生效/需履行付费等事项<br/>不可撤销 是否继续签字？",
					function(flag) {
						if (!flag)
							return;
						//签字
						$.post("proja/Application/esign", {
							appid : appid,
							truename : truename
						}, function(data) {
							if (data != "ok") {
								$.messager.alert("签字操作", data);
								return;
							}
							$.messager.alert("签字操作", "签字生效");
							showMyApply();
						});
					});
		}

		//撤销申请
		function cancelApply(appid) {
			$.post("proja/Application/cancel", {
				appid : appid,
			}, function(data) {
				if (data != "ok") {
					$.messager.alert("撤销操作", data);
					return;
				}
				$.messager.alert("撤销操作", "申请已撤销");
				showMyApply();
			});
		}

		//附加资料
		function extraInfo(appid) {
			showInfoByAppid(appid);
		}

		//根据申请id获取信息
		function showInfoByAppid(appid) {
			$.post("proja/Application/showApplyById", {
				id : appid
			}, function(data) {
				var res = $.parseJSON(data);
				setTimeout(function() {
					$("#applyid").html(appid);
					ue.setContent(res.addition);
					$("#mypop-extra").slideUp(250).slideDown(250);
				}, 500);
			});
		}

		//保存/关闭
		function closeExtra() {
			$.post("proja/Application/upApplyById", {
				id : $("#applyid").html(),
				addition : $.trim(ue.getContent())
			}, function(data) {
				if (data != "ok")
					return;
				$("#mypop-extra").slideUp(250);
			});
		}
	</script>
</body>
</html>
