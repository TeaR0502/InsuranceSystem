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
	<div class="vbox-0 w90p cen">
		<div class="vbox-1 txt-c w250 cen ft-1-g shadow">@ 新 增 产 品</div>
		<div class="h20"></div>
		<form action="proja/Product/insert" method="POST" id="fmPrdAdd">
			<div class="vbox-1">
				<table class="table table-very table-basic">
					<tr>
						<td>产品名称</td>
						<td><input class="easyui-textbox w150" name="name"
							required="true" /></td>
						<td>产品类型</td>
						<td><select class="w100" name="type"><option>个人险</option>
								<option>企业险</option></select></td>
						<td>周期(日)</td>
						<td><input class="easyui-textbox w100" name="period"
							value="360" /></td>
					</tr>
					<tr>
						<td>标准价</td>
						<td><input class="easyui-textbox w100" name="price"
							value="1000" /></td>
						<td>折扣率(%/人)</td>
						<td><input class="easyui-textbox w100" name="discount"
							value="1" /></td>
						<td>底价(%)</td>
						<td><input class="easyui-textbox w100" name="bottomprice"
							value="90" /></td>
					</tr>
					<tr>
						<td>上下架</td>
						<td><select class="w100" name="state"><option
									value="1">上架</option>
								<option value="0">下架</option></select></td>
						<td>前台排序</td>
						<td><input class="easyui-textbox w100" name="myorder"
							value="0" /></td>
						<td></td>
						<td></td>
					</tr>
				</table>
			</div>
			<div class="h20"></div>
			<div>备注</div>
			<input class="easyui-textbox" style="width:100%;height:100px;"
				multiline="true" name="memo" />
			<div class="h40"></div>
			<button class="btn-1 w100p" type="submit">提交产品</button>
		</form>
	</div>
	<script>
		//转换为ajax表单
		$("#fmPrdAdd").form({
			success : function(data) {
				if (data != "ok") {
					$.messager.alert("产品操作", "新增失败!周期/比率/价格字段应为数值");
					return;
				}
				$.messager.alert("产品操作", "新增成功");
				parent.location.reload();
			}
		});
	</script>
</body>
</html>
