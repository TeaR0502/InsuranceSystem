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
<title>保险经纪网上约单平台</title>
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
		<div region="north" class="h60 bgc-1" border="false">
			<div class="vbox-0 ft-0">
				<i class="fa fa-sticky-note-o"></i>&nbsp;&nbsp;保 险 经 纪 网 上 约 单 平
				台&nbsp;&nbsp;/&nbsp;<a class="link ft-g" href="javascript:"
					view="permit" onclick="popview(this);">许可证</a>
			</div>
		</div>
		<!-- 导航栏 -->
		<div region="west" title="&nbsp;" class="theme-left-layout w250"
			border="false">
			<!-- 常规导航 -->
			<div class="theme-left-normal">
				<div class="easyui-layout" fit="true">
					<!-- 信息面板 -->
					<div region="north" class="theme-left-user-panel h150">
						<dl>
							<dt style="width:70px;font-size:42px;text-align:center;">
								<i class="fa fa-laptop"></i>
							</dt>
							<dd>
								<b>当前用户</b><span id="username">未登录</span>
							</dd>
						</dl>
					</div>
					<!-- 导航菜单 -->
					<div region="center">
						<div class="easyui-accordion" fit="true" border="false">
							<div title="个人中心">
								<ul class="easyui-datalist" fit="true" border="false">
									<li><span view="login" onclick="totab(this);">注册登录</span></li>
									<li><span view="myinfo" onclick="toMyInfo(this);">我的资料</span></li>
									<li><span view="intent" onclick="totab(this);">我的关注</span></li>
									<li><span view="apply" onclick="totab(this);">我的申请</span></li>
								</ul>
							</div>
							<div title="留言板">
								<ul class="easyui-datalist" fit="true" border="false">
									<li>我的留言</li>
								</ul>
							</div>
							<div title="个性保险">
								<ul class="easyui-datalist" fit="true" border="false">
									<li><span view="require" onclick="totab(this);">我的需求</span></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 最小化导航 -->
			<div></div>
		</div>
		<!-- 工作区 -->
		<div region="center" border="false">
			<!-- 标签页 -->
			<div id="mytab"
				class="easyui-tabs theme-tab-black-block theme-tab-unborder vbox-0"
				fit="true">
				<!-- 欢迎 -->
				<div title="欢迎访问">
					<!-- <iframe scrolling="auto" frameborder="0"
						style="width:95%;height:95%;" src="demo/TabOrPopF/home"></iframe> -->
					<iframe scrolling="auto" frameborder="0"
						style="width:95%;height:95%;" src="web-view/proj-a-f/home.jsp"></iframe>
				</div>
			</div>
		</div>
	</div>
	<!-- 弹层-通用 -->
	<div id="mypop"></div>
	<script>
		//载入用户名
		var username = $.session("name");
		if (username != "") {
			$("#username").text(username);
		}

		//打开标签页
		function totab(obj) {
			//iframe
			var frm = "<iframe scrolling='auto' frameborder='0' style='width:95%;height:95%;' src='demo/"
					+ $(obj).attr("view") + "'></iframe>";
			//当tab已存在
			if ($("#mytab").tabs("exists", $(obj).text())) {
				$("#mytab").tabs("select", $(obj).text());
				return;
			}
			//新增tab
			$("#mytab").tabs("add", {
				title : $(obj).text(),
				content : frm,
				closable : true
			});
		}

		//弹出视图 
		function popview(obj) {
			//iframe
			var frm = "<iframe scrolling='auto' frameborder='0' style='width:95%;height:95%;' src='web-view/proj-a-f/"
					+ $(obj).attr("view") + ".jsp'></iframe>";
			//弹出
			$("#mypop").window({
				title : $(obj).text(),
				width : "95%",
				height : "95%",
				content : frm
			});
		}

		//打开个人资料
		function toMyInfo(obj) {
			//验证是否登录用户
			if (!$.session("id")) {
				$.messager.alert("我的资料", "请先登录");
				return;
			}
			//iframe
			var frm = "<iframe scrolling='auto' frameborder='0' style='width:95%;height:95%;' src='demo/myinfo'></iframe>";
			//当tab已存在
			if ($("#mytab").tabs("exists", $(obj).text())) {
				$("#mytab").tabs("select", $(obj).text());
				return;
			}
			//新增tab
			$("#mytab").tabs("add", {
				title : $(obj).text(),
				content : frm,
				closable : true
			});
		}
	</script>
</body>
</html>
