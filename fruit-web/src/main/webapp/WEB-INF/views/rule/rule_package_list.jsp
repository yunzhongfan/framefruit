<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/baseTitle.jsp"%>
<html>
<head>
	<%@ include file="/WEB-INF/views/common/baseJsCss.jsp"%>
	<title>规则包管理</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">				
	<script type="text/javascript" src="${ctx }/js/rule/rule_package_list.js"></script>
</head>

<body>
	<div class="n_path">
    	<span class="searchbox-text">当前位置：统一配置台&nbsp;&gt;&nbsp;参数配置&nbsp;&gt;&nbsp;<font color="#B80106"><strong>规则包管理</strong></font></span>
	</div>
	<div id="cc" class="easyui-layout" style="width:100%;height:530px;" >  
		<div data-options="region:'west',title:'',split:false,border:false" style="padding:2px;width:20%;">
			<div class="easyui-panel" title="规则包管理" style="height:100%">				
			  <ul id="orgtree" class="easyui-tree"></ul>						
			</div>			
		</div>
		
	 	<div data-options="region:'center',title:'',border:false" style="background:#eee;">
	 		<table id="rule_list" width="98%" ></table>
	 		<br />
			<table id="menu_list" width="98%" ></table> 
		</div> 
	</div>
	<!-- 右键功能功能 -->
	<div id="rightMenu" class="easyui-menu" style="width:180px;">
		<div data-options="iconCls:'icon-metro-eye2'" onclick="show_current()">查看</div>		
		<div data-options="iconCls:'icon-metro-plus'" onclick="new_add()">新增</div>
		<div data-options="iconCls:'icon-metro-console'" onclick="update()">修改</div>
		<div data-options="iconCls:'icon-metro-close'" onclick="deleteOne()">删除</div>         
	</div>
</html>
<script>
$(function () {
	reloadLeft();
    
});
	</script>