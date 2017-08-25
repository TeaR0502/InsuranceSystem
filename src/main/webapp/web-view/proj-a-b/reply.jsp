<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>
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
	<div class="w95p cen">
		<div class="h20"></div>
		<div class="ft-2-g txt-c">@ 申 请 受 理</div>
		<div class="h20"></div>
		<div>
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
						<td>${apply.id}</td>
						<td>${apply.productId}</td>
						<td>${apply.productName}</td>
						<td>${apply.productPeriod}</td>
						<td>${apply.username}</td>
						<td>${apply.userTruename}</td>
						<td>${apply.usermobile}</td>
						<td>${apply.userIdCard}</td>
						<td><fmt:formatDate value="${apply.createtime}"
								pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
					</tr>
					<tr>
						<td>附加<br />资料
						</td>
						<td colspan="8">${apply.addition}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- 电子签章 -->
		<c:if test="${apply.esign!=''}">
			<div class="w150 h70 fr txt-c ft-2-g rotate-l radius" id="@id"
				style="border:2px solid #F08080;margin-top:-125px;margin-right:100px;">
				<div class="h20"></div>
				<div>${apply.esign}</div>
				<div>
					<fmt:formatDate value="${apply.esigntime}"
						pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
				</div>
			</div>
		</c:if>
		<div class="h20"></div>
		<!-- 图片区 -->
		<div>
			<table class="table table-striped">
				<thead>
					<tr>
						<th style="text-align:center;"><i
							class="fa fa-window-restore"></i> 身份证正面</th>
						<th style="text-align:center;"><i
							class="fa fa-window-restore"></i> 身份证反面</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="text-align:center;"><img id="idcard_1" alt=""
							onerror="this.src='web-part/easy/img/nopic.jpg'" width="350px"
							height="220px" /></td>
						<td style="text-align:center;"><img id="idcard_2" alt=""
							onerror="this.src='web-part/easy/img/nopic.jpg'" width="350px"
							height="220px" /></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="h20"></div>
		<div class="vbox-1">
			<div class="h20"></div>
			<button class="btn-1 w100p" onclick="commitReply();">提交受理</button>
			<div class="h10"></div>
			<select id="replystate" style="width:115px;">
				<option value="0">审核未通过</option>
				<option value="1">审核通过</option>
				<option value="2">保单送达</option>
			</select>
			<div class="h10"></div>
			<div id="editor" class="h150"></div>
		</div>
	</div>

	<script>
		//受理状态
		$("#replystate").val("${apply.state}");

		//百度UE
		var ue = UE.getEditor("editor", {
			toolbars : [ [ "attachment", "link", "simpleupload", "emotion" ] ]
		});

		//设置初始内容(注意此处el用单引/html内容中有双引)
		setTimeout(function() {
			ue.setContent('${apply.reply}');
		}, 1200);

		//显示证件图片
		showIdCard();

		//提交受理
		function commitReply() {
			//验证受理状况非空
			if ($.trim(ue.getContent()) == "") {
				$.messager.alert("受理操作", "请填写受理状况");
				return;
			}
			//更新状态
			$.post("Application/passOrRefuseApply", {
				id : "${apply.id}",
				reply : $.trim(ue.getContent()),
				state : $("#replystate").val()
			}, function(data) {
				if (data != "ok")
					return;
				$.messager.alert("受理操作", "受理已提交");
				parent.location.reload();
			});
		}

		//显示证件图片
		function showIdCard() {
			//alert("${apply.username}");
			var src1 = "userIdPic/" + "${apply.username}" + "/idcard1.jpg?"
					+ Math.random();
			var src2 = "userIdPic/" + "${apply.username}" + "/idcard2.jpg?"
					+ Math.random();
			$("#idcard_1").attr("src", src1);
			$("#idcard_2").attr("src", src2);
		}
	</script>
</body>
</html>
