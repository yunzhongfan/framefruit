<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/common/baseTitle.jsp"%>
<html>

<head>
	<title>角色信息查看</title>
	<%@ include file="/WEB-INF/views/common/baseJsCss.jsp"%>	
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
    
	
	 
	 if("${group.groupStatus}" == "1")
	 { 
	 	$("#Radio1").attr("checked",true);
	 }
	 else if("${group.groupStatus}" == "2")
	 {
	 	$("#Radio2").attr("checked",true);
	 }
	
	 $('#orgTree').combotree('setValue', '${group.orgId}');
	 $("#groupDesc").val("${group.groupDesc}");
	
	});
	
</script>
</head>
<body>
<fieldset style="height: 230px">
    <legend>角色信息</legend>
    <span>组ID:&nbsp;&nbsp;&nbsp;</span>
    <input name="groupId" value="${group.groupId}" type="text" class="easyui-validatebox" data-options="autoFocus: true" /><hr />
    <span>组机构名称：</span>
    <input name="groupName" value="${group.groupName}" type="text" class="easyui-validatebox" data-options="prompt: ''" /><hr />    
    <span>状态：&nbsp;&nbsp;&nbsp;&nbsp;</span>
    <input id="Radio1" name="groupStatus"  type="radio" checked="checked" value="1"/><label for="Radio3">正常</label>
    <input id="Radio2" name="groupStatus" type="radio" value="2"/><label for="Radio4">停用</label>
    <hr/>  
    <span>组归属：</span>
    <select id="orgTree" class="easyui-combotree" style="width:200px;"  name="orgId" 
        data-options="url:'${ctx}/org/loadOrgTree',required:true"></select>  
   <hr/>  
    <span style="margin-top: 10px">组描述：</span>
    <textarea id="groupDesc" name="groupDesc" cols="20" value="${group.groupDesc}" rows="4"></textarea>
</fieldset>
        
</body>
</html>
