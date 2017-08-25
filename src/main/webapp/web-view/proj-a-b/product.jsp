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
				<input type="text" class="easyui-searchbox w250"
					prompt="-> K E Y W O R D" searcher="doSearch" menu="#smn" />
				<div id="smn">
					<div>A l l</div>
					<div>企业险</div>
					<div>个人险</div>
				</div>
			</div>
			<div class="h10"></div>
		</div>
		<!-- 工作区 -->
		<div region="center" class="box-0" border="false">
			<table id="gridPrd" class="easyui-datagrid" border="false"
				url="Product/listProductAll" singleSelect="true" toolbar="#tool"
				pagination="true">
				<thead>
					<tr>
						<th field="productId">编号</th>
						<th field="name">保险名</th>
						<th field="type">类型</th>
						<th field="period">周期(日)</th>
						<th field="price">标准价</th>
						<th field="discount">折扣(%/人)</th>
						<th field="bottomprice">底价(%)</th>
						<th field="creatorname">创建人</th>
						<th field="createtime" formatter="tofulltime">创建时间</th>
						<th field="state" formatter="showstate">状态</th>
						<th field="myorder">前台排序</th>
					</tr>
				</thead>
			</table>
			<!-- 工具条 -->
			<div id="tool">
				<a href="javascript:" class="easyui-linkbutton" iconCls="icon-add"
					plain="true" view="prdadd" onclick="popview(this);">新增</a><a
					href="javascript:" class="easyui-linkbutton" iconCls="icon-save"
					plain="true" view="prdedit" onclick="popedit();">編輯</a><a
					href="javascript:" class="easyui-linkbutton" iconCls="icon-cut"
					plain="true" onclick="prddel();">删除</a>
			</div>
		</div>
	</div>
	<!-- 弹层 -->
	<div id="mypop"></div>
	<script>
		//全局
		var _type = "";
		var _name = "";

		//搜索
		function doSearch(name, type) {
			_type = type;
			_name = name;
			if ($.trim(_type) == "A l l")
				_type = "";
			$("#gridPrd").datagrid("load", {
				type : _type,
				name : _name
			});
		}

		//格式化时间
		function tofulltime(val, row) {
			return $.msfmt.todate(val, true, 8);
		}

		//格式化状态
		function showstate(val, row) {
			return val == "1" ? "上架" : "未上架";
		}

		//产品删除
		function prddel() {
			//选中及验证
			var row = $("#gridPrd").datagrid("getSelected");
			if (!row) {
				$.messager.alert("产品操作", "请选中1条产品");
				return;
			}
			//删除
			$.messager.confirm("操作确认", "是否确认删除?", function(r) {
				if (r) {
					//alert(${row.id});
					$.post("Product/delete", {
						prdid : row.productId
					}, function(data) {
						if (data != "ok")
							return;
						//回显
						$.messager.alert("产品操作", "删除成功");
						$("#gridPrd").datagrid("reload");
					});
				}
			});
		}

		//产品编辑
		function popedit() {
			//选中及验证
			var row = $("#gridPrd").datagrid("getSelected");
			if (!row) {
				$.messager.alert("产品操作", "请选中1条产品");
				return;
			}
			//iframe
			var frm = "<iframe scrolling='auto' frameborder='0' style='width:95%;height:95%;' src='Product/toUpdate?prdid="
					+ row.productId + "'></iframe>";
			//弹出
			$("#mypop").window({
				title : "产品编辑",
				width : "95%",
				height : "95%",
				content : frm
			});
		}

		//弹出视图 
		function popview(obj) {
			//iframe
			var frm = "<iframe scrolling='auto' frameborder='0' style='width:95%;height:95%;' src='demo/admin/"
					+ $(obj).attr("view") + "'></iframe>";
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
