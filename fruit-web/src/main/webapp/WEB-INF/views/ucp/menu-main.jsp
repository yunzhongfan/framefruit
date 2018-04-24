<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/common/baseTitle.jsp"%>
<html>

<head>
	<title>菜单管理</title>
	<%@ include file="/WEB-INF/views/common/baseJsCss.jsp"%>
	<script type="text/javascript" src="${ctx }/js/ucp/menu.js"></script>
</head>
<body>
	<div id="p" class="easyui-panel" title="菜单管理">
	<div id="tt" class="easyui-toolbar" >
       <!-- <span>菜单名称：</span>
       <input id="orgName" type="text" value="" style="margin-left: 2px; margin-right: 2px; padding-left: 2px; padding-right: 3px;" />
        <a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-search'" onclick="queryOrgList()">查询</a> -->
        <a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-plus'" onclick="menuAdd()">新增</a>
        <a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-eye2'" onclick="menuView()">查看</a>
        <a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-console'" onclick="menuUpdate()">编辑</a>
        <a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-wrench'">配置</a>
        <a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-close'" onclick="menuDel()">删除</a>
    </div>
	<table id="menuList"></table>
	</div>
	<div id="addMenuWindow"></div>  
</body>
<script type="text/javascript">
    $(function () {
        queryMenuList();
    });
    
</script>
