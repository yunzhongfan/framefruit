<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/common/baseTitle.jsp"%>
<html>

<head>
	<title>机构新增</title>
	<%@ include file="/WEB-INF/views/common/baseJsCss.jsp"%>
	<script type="text/javascript" src="${ctx }/js/ucp/org-operating.js"></script>
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
    <form id="orgForm" class="easyui-form" method="post">
   <!--  <span>编号：</span>
    <input name="orgId" type="text" class="easyui-validatebox" data-options="required: true, autoFocus: true" /><hr /> -->
    <span>名称：</span>
    <input name="orgName" type="text" class="easyui-validatebox" data-options="required: true, prompt: '请输入机构名称'" /><hr />
    <span>状态：</span>
    <input id="Radio3" name="orgStatus"  type="radio" checked="checked" value="1"/><label for="Radio3">正常</label>
    <input id="Radio4" name="orgStatus" type="radio" value="2"/><label for="Radio4">停用</label>
    <hr/>
    <span>归属：</span>
    <select id="parentId" class="easyui-combotree" style="width:200px;"  name="parentId"
        data-options="url:'${ctx}/org/loadOrgTree',required:true"></select>
    <!-- <hr />
    <span>备注：</span>
    <textarea id="TextArea1" cols="20" rows="2" class="easyui-validatebox" data-options="required: true"></textarea> -->
    </form>
</fieldset>
</body>
</html>
<script>

</script>