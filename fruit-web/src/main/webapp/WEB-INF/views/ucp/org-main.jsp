<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/common/baseTitle.jsp"%>
<html>

<head>
	<title>机构管理</title>
	<%@ include file="/WEB-INF/views/common/baseJsCss.jsp"%>
	<script type="text/javascript" src="${ctx }/js/ucp/org.js"></script>
</head>
<body>
	<div id="p" class="easyui-panel" title="机构管理">
	<div id="tt" class="easyui-toolbar" >
       <!-- <span>机构名称：</span>
       <input id="orgName" type="text" value="" style="margin-left: 2px; margin-right: 2px; padding-left: 2px; padding-right: 3px;" />
        <a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-search'" onclick="queryOrgList()">查询</a> -->
        <a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-plus'" onclick="orgAdd()">新增</a>
        <a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-eye2'" onclick="orgView()">查看</a>
        <a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-console'" onclick="orgUpdate()">编辑</a>
        <a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-wrench'">配置</a>
        <a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-close'" onclick="orgDel()">删除</a>
    </div>
	<table id="orgList"></table>
	</div>
	<div id="addOrgWindow"></div>  
</body>
<script type="text/javascript">
    $(function () {
        queryOrgList();
    });
    
</script>
