<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/common/baseTitle.jsp"%>
<html>

<head>
	<title>菜单新增</title>
	<%@ include file="/WEB-INF/views/common/baseJsCss.jsp"%>
	<script type="text/javascript" src="${ctx }/js/ucp/menu-operating.js"></script>
<style type="text/css">
    fieldset{
        margin: 10px;
        min-width: 450px;
        vertical-align: middle;
        font-size: 12px;
        border:1px solid gray;
    }

    span{
		border:0;
		font-size: 12px;
	}
</style>
</head>
<body>
<fieldset>
    <legend>请填写表单</legend>
    <form id="menuForm" class="easyui-form" method="post">
   <!--  <span>编号：</span>
    <input name="menuId" type="text" class="easyui-validatebox" data-options="required: true, autoFocus: true" /><hr /> -->
    <span>名&nbsp;&nbsp;称：</span>
    <input name="menuName" type="text" class="easyui-validatebox" data-options="required: true, prompt: '请输入菜单名称'" /><hr />
    <span>类&nbsp;&nbsp;型：</span>
    <input id="Radio1" name="type"  type="radio" checked="checked" value="1"/><label for="Radio1">菜单</label>
    <input id="Radio2" name="type" type="radio" value="2"/><label for="Radio2">按钮</label>
    <hr/>
    <span>状&nbsp;&nbsp;态：</span>
    <input id="Radio3" name="status"  type="radio" checked="checked" value="1"/><label for="Radio3">正常</label>
    <input id="Radio4" name="status" type="radio" value="2"/><label for="Radio4">停用</label>
    <hr/>
    <span>路&nbsp;&nbsp;径：</span>
    <input name="url" type="text" class="easyui-validatebox" data-options="required: true, prompt: '请输入菜单路径'" /><hr />
    <span>所属上级：</span>
    <select id="parentId" class="easyui-combotree" style="width:200px;"  name="parentId"
        data-options="url:'${ctx}/menu/loadMenuTree',required:true"></select>
    <!-- <hr />
    <span>备注：</span>
    <textarea id="TextArea1" cols="20" rows="2" class="easyui-validatebox" data-options="required: true"></textarea> -->
    <hr/>
    
     <select id="Select1" class="easyui-comboicons" data-options="width: 280, autoShowPanel: false, multiple: false, size: '16', value: 'icon-standard-application-form-edit'"></select>
    </form>
</fieldset>
</body>
</html>
<script>

</script>