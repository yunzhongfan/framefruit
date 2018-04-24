<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/common/baseTitle.jsp"%>
<html>

<head>
	<title>角色编辑</title>
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
		width:50px;
		margin-left: 0px;
	}
</style>
 <script>
	 $(function () {
    
	
	 
	 if("${role.roleStatus}" == "1")
	 { 
	 	$("#Radio1").attr("checked",true);
	 }
	 else if("${role.roleStatus}" == "2")
	 {
	 	$("#Radio2").attr("checked",true);
	 }
	
	 $("#roleDesc").val("${role.roleDesc}");
	
	});
	
</script>
</head>
<body>
<fieldset style="height: 230px">
    <legend>请填写表单</legend>
    <form id="roleForm" class="easyui-form">
    <span>角色ID:&nbsp;&nbsp;&nbsp;</span>
    <input name="roleId" value="${role.roleId}" type="text" class="easyui-validatebox" data-options="required: true, autoFocus: true" /><hr />
    <span>角色名称：</span>
    <input name="roleName" value="${role.roleName}" type="text" class="easyui-validatebox" data-options="required: true, prompt: ''" /><hr />    
    <span>状态：&nbsp;&nbsp;&nbsp;&nbsp;</span>
    <input id="Radio1" name="roleStatus"  type="radio" checked="checked" value="1"/><label for="Radio3">正常</label>
    <input id="Radio2" name="roleStatus" type="radio" value="2"/><label for="Radio4">停用</label>
    <hr/>    
    <span style="margin-top: 10px">角色描述：</span>
    <textarea id="roleDesc" value="${role.roleDesc}" name="roleDesc" cols="20" rows="4" class="easyui-validatebox"></textarea>
    </form>
</fieldset>

</body>
</html>
<script>
	function update()
	{
		 var validate = $("#roleForm").form("validate");
         if (validate) 
         {
            $('#roleForm').form('submit',{  
   			url:"${ctx}/role/saveUpdate",
    		success:function(data){  
    			var data = eval('(' + data + ')');
        		if(data.msg=="success")
        		{
        			parent.$("#roleList").datagrid('reload');
        		}  
        		parent.$('#dd').dialog('close');					
    		}  
			});       	
          } 
          else 
          {
             return false;
          }
	}
	
</script>