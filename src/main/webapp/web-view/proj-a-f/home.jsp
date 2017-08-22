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
		<!-- 搜索区 -->
		<div region="north" class="vbox-0 bg-3" border="false">
			<!-- 标题 -->
			<div class="vbox-1 w200 cen txt-c ft-2-g shadow">
				<i class="fa fa-umbrella"></i>&nbsp;-&nbsp;O U R&nbsp;-&nbsp;S O L U
				T I O N S
			</div>
			<!-- 搜索框 -->
			<div class="txt-r">
				<input type="text" class="easyui-searchbox w250"
					prompt="-> K E Y W O R D" searcher="doSearch" menu="#smn" />
				<div id="smn">
					<div>A l l</div>
					<div>企业险</div>
					<div>个人险</div>
				</div>
			</div>
			<!-- 分页组件 -->
			<div id="mypage" class="easyui-pagination w500" pageSize="10"
				showPageList="false" data-options="onSelectPage:getmypage"></div>
		</div>
		<!-- 工作区 -->
		<div region="center" border="false">
			<div class="vbox-0">
				<!-- 产品浏览 -->
				<div id="lstprd">
					<div class="vrect-1 shadow fl"
						style="width:288px;height:260px;margin:15px;">
						<div class="bgc-2 ft-g"
							style="padding:3px;height:25px;line-height:25px;">
							<i class="fa fa-globe"></i>&nbsp;@name
						</div>
						<div class="h10"></div>
						<div class="vbox-0">
							<div class="h100">@memo&nbsp;。。。@creatorname&nbsp;@createtime</div>
							<div class="h10"></div>
							<div style="text-decoration:line-through;">原始价:￥@price/@period日
							</div>
							<div>估算价:￥@nowprice/@period日</div>
							<div class="h10"></div>
							<button class="btn-1-mini w70" onclick="prdjoin('@id','@name');">免费关注</button>
							&nbsp;@usercount&nbsp;<i class="fa fa-user-o"></i>&nbsp;&nbsp;&nbsp;<a
								href="javascript:" class="link ft-g" onclick="detail('@id');">查看详细&nbsp;<i
								class="fa fa-window-restore"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 弹层-通用 -->
	<div id="mypop"></div>
	<!-- 弹层-产品详细 -->
	<div id="mypop-detail" class="vrect-1 shadow w300 h250 hide"
		style="position:fixed;top:15%;left:30%;background-color:white;">
		<button class="btn-2 w100p" onclick="closeDetail();">关闭窗口</button>
		<div class="h10"></div>
		<div class="ft-2-g txt-c" id="prdname">产品名称</div>
		<div class="h10"></div>
		<div class="box-0 h55p ft-g" id="detail"></div>
	</div>
	<script>
		//全局
		var _type = "";
		var _name = "";

		//产品模板
		var tmpl_prd = $("#lstprd").html();
		$("#lstprd").empty();

		//获取产品列表-page-1
		getlstprd(1, 10);

		//获取产品列表
		function getlstprd(pageNumber, pageSize, type, name) {
			$.post("proja/Product/listProductF", {
				page : pageNumber,
				rows : pageSize,
				type : type,
				namelike : name
			}, function(data) {
				//获取响应
				var res = $.parseJSON(data);
				$("#lstprd").empty();
				//设置total
				$("#mypage").pagination({
					total : res.total
				});
				//显示数据
				$.each(res.rows, function(i, n) {
					var row = tmpl_prd.replaceAll("@id", n.id).replaceAll(
							"@name", n.name).replaceAll("@creatorname",
							n.creatorname).replaceAll("@createtime",
							$.msfmt.todate(n.createtime, true, 8)).replaceAll(
							"@usercount", n.usercount).replaceAll("@price",
							n.price).replaceAll("@nowprice", n.nowprice)
							.replaceAll("@period", n.period).replaceAll(
									"@memo", n.memox);
					$("#lstprd").append(row);
				});
			});
		}

		//产品列表翻页
		function getmypage(pageNumber, pageSize) {
			getlstprd(pageNumber, pageSize, _type, _name);
		}

		//搜索
		function doSearch(name, type) {
			_type = type;
			_name = name;
			if ($.trim(_type) == "A l l")
				_type = "";
			getlstprd(1, 10, _type, _name);
		}

		//加入产品组
		function prdjoin(prdid, prdname) {
			if ($.session("id") == "") {
				$.messager.alert("关注操作", "请先登录用户");
				return;
			}
			//新增用户-产品关系
			$.post("proja/UserProduct/insert", {
				userid : $.session("id"),
				username : $.session("name"),
				productid : prdid,
				productname : prdname
			}, function(data) {
				if (data != "ok") {
					$.messager.alert("关注操作", data);
					return;
				}
				$.messager.alert("关注操作", "关注成功/可在[我的关注]中查看");
				//回显
				$("#mypage").pagination("select");
			});
		}

		//查看详细
		function detail(prdid) {
			$.post("proja/Product/getProductById", {
				prdid : prdid
			}, function(data) {
				var res = $.parseJSON(data);
				$("#prdname").html(res.name);
				$("#detail").html(res.memo);
				$("#mypop-detail").slideUp(250).slideDown(250);
			});
		}

		//关闭详细
		function closeDetail() {
			$("#mypop-detail").slideUp(250);
		}

		//弹出视图 
		function popview(obj) {
			//iframe
			var frm = "<iframe scrolling='auto' frameborder='0' style='width:95%;height:95%;' src='demo/TabOrPopF/"
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
