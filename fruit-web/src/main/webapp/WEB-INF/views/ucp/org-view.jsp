<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/common/baseTitle.jsp"%>
<html>

<head>
	<title>机构信息查看</title>
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
<script>
	 $(function () {
	 
	 if("${org.orgStatus}" == "1")
	 { 
	 	$("#Radio3").attr("checked",true);
	 }
	 else if("${org.orgStatus}" == "2")
	 {
	 	$("#Radio4").attr("checked",true);
	 }
	
	
	  $('#orgTree').combotree({ disabled: true }); 
	  
	  $('#orgTree').combotree('setValue', '${org.parentId}');
// 	  $(":input").attr("disabled", "disabled");

	});
	
</script>
</head>
<body>

<fieldset>
    <legend>表单详情</legend>
    <form id="orgForm" class="easyui-form">
    <span>编号：</span>
    <input name="orgId" value="${org.orgId}" type="text" class="easyui-validatebox" disabled="disabled" data-options="required: true, autoFocus: true" /><hr />
    <span>名称：</span>
    <input name="orgName" value="${org.orgName}" type="text" class="easyui-validatebox" disabled="disabled" data-options="required: true, prompt: '请输入名称'" /><hr />
    <span>状态：</span>
    <input id="Radio3" name="orgStatus" type="radio" value="1" disabled="disabled"/><label for="Radio3">正常</label>
    <input id="Radio4" name="orgStatus" type="radio" value="2" disabled="disabled"/><label for="Radio4">停用</label>
    <hr/>
    <span>归属：</span>
    <select id="orgTree" class="easyui-combotree" style="width:200px;"  name="orgId"
        data-options="url:'${ctx}/org/loadOrgTree',required:true"></select>
   
    </form>
</fieldset>
</body>
</html>
