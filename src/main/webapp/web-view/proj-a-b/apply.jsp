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
	<div class="easyui-layout" fit="true">
		<!-- 标题栏 -->
		<div region="north" class="vbox-0" border="false">
			<div class="h10"></div>
			<div class="vbox-2">
				起始日期 <input id="date1" class="w150" /> => 截止日期 <input id="date2"
					class="w150" />
			</div>
			<div class="h10"></div>
		</div>
		<!-- 工作区 -->
		<div region="center" class="box-0" border="false">
			<table class="easyui-datagrid" id="gridapply" border="false"
				url="Application/allapply" singleSelect="true" toolbar="#tool"
				pagination="true">
				<thead>
					<tr>
						<th field="id">单号</th>
						<th field="username">用户名</th>
						<th field="userTruename">真实姓名</th>
						<th field="productId">保险编号</th>
						<th field="productName">保险名</th>
						<th field="productPeriod">周期</th>
						<th field="createtime" formatter="tofulltime">申请时间</th>
						<th field="state" formatter="showstate">申请状态</th>
						<th field="esign">用户签名</th>
						<th field="esigntime" formatter="tofulltime">签名时间</th>
					</tr>
				</thead>
			</table>
			<!-- 工具条 -->
			<div id="tool">
				<a href="javascript:" class="easyui-linkbutton" iconCls="icon-save"
					plain="true" view="reply" onclick="popview(this);">受理</a><a
					href="javascript:" class="easyui-linkbutton" iconCls="icon-cut"
					plain="true" onclick="prddel();">删除</a>
			</div>
		</div>
	</div>
	<!-- 弹层 -->
	<div id="mypop"></div>
	<script>
		//date1/date2
		var date1 = $.dtfmt.cur(false, 8);
		var date2 = $.dtfmt.cur(false, 8);

		$("#date1").datebox({
			onSelect : function(date) {
				date1 = $("#date1").datebox("getValue");
				loadgrid();
			}
		});
		$("#date2").datebox({
			onSelect : function(date) {
				date2 = $("#date2").datebox("getValue");
				loadgrid();
			}
		});

		//loadgrid
		function loadgrid() {
			$("#gridapply").datagrid("load", {
				date1 : date1,
				date2 : date2
			});
		}

		//格式化状态
		function showstate(val, row) {
			if (val == "0")
				return "审核未通过";
			if (val == "1")
				return "审核通过";
			if (val == "2")
				return "保单送达";
		}

		//格式化时间
		function tofulltime(val, row) {
			return $.msfmt.todate(val, true, 8);
		}
		
		//申请删除
		function prddel() {
			//选中及验证
			var row = $("#gridapply").datagrid("getSelected");
			if (!row) {
				$.messager.alert("申请操作", "请选中1条申请");
				return;
			}
			//删除
			$.messager.confirm("操作确认", "是否确认删除?", function(r) {
				if (r) {
					
					if (row.state != 0) {
						$.messager.alert("用户申请操作", "审核已通过或保单已送达,无法删除");
						return;
					}
					if (row.esign != "") {
						$.messager.alert("用户申请操作", "已签字订单,无法删除");
						return;
					}
					//alert(${row.id});
					$.post("Application/cancel", {
						appid : row.id
					}, function(data) {
						//alert(data)
						if (data != "ok")
							return;
						//回显
						$.messager.alert("用户申请操作", "删除成功");
						$("#gridapply").datagrid("reload");
					});
				}
			});
		}

		//弹出视图 
		function popview(obj) {
			//获取选中行
			var row = $("#gridapply").datagrid("getSelected");
			if (!row) {
				$.messager.alert("受理操作", "请选中1条申请单");
				return;
			}
			//iframe
			var frm = "<iframe scrolling='auto' frameborder='0' style='width:95%;height:95%;' src='Application/toReply?id="
					+ row.id + "'></iframe>";
			//弹出
			$("#mypop").window({
				title : $(obj).text(),
				width : "95%",
				height : "95%",
				content : frm
			});
		}
	</script>
</body>
</html>
