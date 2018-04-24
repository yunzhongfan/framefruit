<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/common/baseTitle.jsp"%>
<html>
<head>
	<title>Title of the document</title>
	<%@ include file="/WEB-INF/views/common/baseJsCss.jsp"%>
	 <!--导入首页启动时需要的相应资源文件(首页相应功能的 js 库、css样式以及渲染首页界面的 js 文件)-->
    <script src="common/index.js" type="text/javascript"></script>
    <link href="common/index.css" rel="stylesheet" />
    <script src="common/index-startup.js"></script>
</head>

<body>

    <div id="maskContainer">
        <div class="datagrid-mask" style="display: block;"></div>
        <div class="datagrid-mask-msg" style="display: block; left: 50%; margin-left: -52.5px;">
            	正在加载...
        </div>
    </div>

    <div id="mainLayout" class="easyui-layout hidden" data-options="fit: true">


        <div id="northPanel" data-options="region: 'north', border: false" style="height: 80px; overflow: hidden;">
            <div id="topbar" class="top-bar">
                <div class="top-bar-left">
                    <h2 style="margin-left: 10px; margin-top: 10px;">MedLink Professional</h2>
                </div>
                <div class="top-bar-right">
                    <!-- <div id="timerSpan"></div> -->
                    <div id="userSpan">                    	
                    	<span>登陆用户：王星</span>
                    	<span>更换皮肤:<select id="themeSelector"></span></select>
                    	<a id="btnFullScreen" class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-standard-arrow-inout'">全屏切换</a>
                    	<a id="btnExit" class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-hamburg-sign-out'">退出系统</a>
                    	<a id="btnHideNorth" class="easyui-linkbutton" data-options="plain: true, iconCls: 'layout-button-up'"></a>
                    </div>
                    <!-- <div id="themeSpan">
                        <span>更换皮肤风格：</span>
                        <select id="themeSelector"></select>                        
                        <a id="btnFullScreen" class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-standard-arrow-inout'">全屏切换</a>
                    	<a id="btnExit" class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-hamburg-sign-out'">退出系统</a>
                    	<a id="btnHideNorth" class="easyui-linkbutton" data-options="plain: true, iconCls: 'layout-button-up'"></a>
                    </div> -->
                </div>
            </div>
            <div id="toolbar" class="panel-header panel-header-noborder top-toolbar">
                <div id="infobar">
                    <span style="padding-left: 25px; background-position: left center;">
                      <a id="btnExit" class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-32-mail2'">我的工作台</a>
                    </span>
                    <span style="padding-left: 25px;>
                    <a id="btnExit" class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-mail2'">门诊管理</a>
                    </span>
                    <span style="padding-left: 25px;>
                    	 <a id="btnExit" class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-32-mail2'">
                    	 閱片管理
                    	 </a>
                    </span>
                    <span style="padding-left: 25px;>
                    	<a id="btnExit" class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-32-mail2'">系統質控</a>
                    </span>
                    <span style="padding-left: 25px;>
                    	<a id="btnExit" class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-32-mail2'">統一配置台</a>
                    </span>
                    
                </div>
              <!--  <div id="searchbar">
                    <input id="topSearchbox" name="topSearchbox" class="easyui-searchbox" data-options="width: 350, height: 26, prompt: '请输入您要查找的内容关键词', menu: '#topSearchboxMenu'" />
                    <div id="topSearchboxMenu" style="width: 85px;">
                        <div data-options="name:'0', iconCls: 'icon-hamburg-zoom'">查询类型</div>
                        <div data-options="name:'1'">测试类型1</div>
                        <div data-options="name:'2'">测试类型2</div>
                        <div data-options="name:'3'">测试类型3</div>
                        <div data-options="name:'4'">测试类型4</div>
                    </div>
                </div> -->
                <div id="buttonbar">
                    <!-- <a id="btnContact" class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-hamburg-contact', tooltip: '前往作者关于该插件集合的博客专文；可以进行问题反馈提交或留言操作。'">博客留言</a>
                    <a id="btn2" class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-hamburg-bug'">按钮2</a>
                    <a id="btn3" class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-hamburg-archives'">按钮3</a> 
                    <a id="btnFullScreen" class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-standard-arrow-inout'">全屏切换</a>
                    <a id="btnExit" class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-hamburg-sign-out'">退出系统</a>
                    <a id="btnShowNorth" class="easyui-linkbutton" data-options="plain: true, iconCls: 'layout-button-down'" style="display: none;"></a>-->
                </div>
            </div>
        </div>

     
        <div data-options="region: 'center'" style="padding: 1px;">
            <div id="mainTabs_tools" class="tabs-tool">
                <table>
                    <tr>
                        <td><a id="mainTabs_jumpHome" class="easyui-linkbutton easyui-tooltip" title="跳转至主页选项卡" data-options="plain: true, iconCls: 'icon-hamburg-home'"></a></td>
                        <td><div class="datagrid-btn-separator"></div></td>
                        <td><a id="mainTabs_toggleAll" class="easyui-linkbutton easyui-tooltip" title="展开/折叠面板使选项卡最大化" data-options="plain: true, iconCls: 'icon-standard-arrow-inout'"></a></td>
                        <td><div class="datagrid-btn-separator"></div></td>
                        <td><a id="mainTabs_jumpTab" class="easyui-linkbutton easyui-tooltip" title="在新页面中打开该选项卡" data-options="plain: true, iconCls: 'icon-standard-shape-move-forwards'"></a></td>
                        <td><div class="datagrid-btn-separator"></div></td>
                        <td><a id="mainTabs_closeTab" class="easyui-linkbutton easyui-tooltip" title="关闭当前选中的选项卡" data-options="plain: true, iconCls: 'icon-standard-application-form-delete'"></a></td>
                        <td><a id="mainTabs_closeOther" class="easyui-linkbutton easyui-tooltip" title="关闭除当前选中外的其他所有选项卡" data-options="plain: true, iconCls: 'icon-standard-cancel'"></a></td>
                        <td><div class="datagrid-btn-separator"></div></td>
                        <td><a id="mainTabs_closeLeft" class="easyui-linkbutton easyui-tooltip" title="关闭左侧所有选项卡" data-options="plain: true, iconCls: 'icon-standard-tab-close-left'"></a></td>
                        <td><a id="mainTabs_closeRight" class="easyui-linkbutton easyui-tooltip" title="关闭右侧所有选项卡" data-options="plain: true, iconCls: 'icon-standard-tab-close-right'"></a></td>
                        <td><div class="datagrid-btn-separator"></div></td>
                        <td><a id="mainTabs_closeAll" class="easyui-linkbutton easyui-tooltip" title="关闭所有选项卡" data-options="plain: true, iconCls: 'icon-standard-cross'"></a></td>
                    </tr>
                </table>
            </div>
            <div id="mainTabs" class="easyui-tabs" data-options="fit: true, border: true, showOption: true, enableNewTabMenu: true, tools: '#mainTabs_tools', enableJumpTabMenu: true, onSelect: function (title, index) { window.mainpage.mainTabs.updateHash(index); }">
                <div id="homePanel" data-options="title: '主页', iconCls: 'icon-hamburg-home'">
                    <div class="easyui-layout" data-options="fit: true">
                      
                        <div data-options="region: 'center', border: false" style="overflow: hidden;">
                 			<table id="t1"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>

      
    </div>
</body>
</html>
<script type="text/javascript">
    $(function () {
        $("#t1").datagrid({
            title: 'test datagrid',
            width: 1200,
            height: 400,
            method: "get",
            url: "examples/datagrid/datagrid-data.json",
            idField: 'ID',
            remoteSort: false,
            frozenColumns: [[
                { field: 'ck', checkbox: true },
                { field: 'ID', title: 'ID', width: 80, sortable: true }
            ]],
            columns: [[
                { field: 'Code', title: '编号(Code)', width: 120 },
                { field: 'Name', title: '名称(Name)', width: 140 },
                { field: 'Age', title: '年龄(Age)', width: 120 },
                { field: 'Height', title: '身高(Height)', width: 140 },
                { field: 'Weight', title: '体重(Weight)', width: 140 },
                { field: 'CreateDate', title: '创建日期(CreateDate)', width: 180 },
                { field: 'undefined', title: '测试(不存在的字段)', width: 150 }
            ]],
            enableHeaderClickMenu: false,
            enableHeaderContextMenu: false,
            enableRowContextMenu: false,
            offset: { width: -250, height: -150}   //该属性属性表示当屏幕大小调整时候随屏幕大小尺寸调整而自身大小调整的偏移量，具体设置方式参见 API 文档说明
        });
    });
</script>

