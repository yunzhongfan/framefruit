<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/common/baseTitle.jsp"%>
<html>

<head>
	<title>组新增</title>
	<%@ include file="/WEB-INF/views/common/baseJsCss.jsp"%>

</head>
<body>
    <form id="groupAddForm" class="easyui-form">
    <table id="newTable" cellpadding="2" >
    	<tr>
    		<td class="formTitle">组ID:</td>
    		<td class="formValue"><input name="groupId" type="text" class="easyui-validatebox" data-options="required: true, autoFocus: true" /></td>
		</tr>
		<tr>
    		<td class="formTitle">组名称：</td>
    		<td class="formValue"><input name="groupName" type="text" class="easyui-validatebox" data-options="required: true, prompt: ''" /></td>
    	</tr>
	    <tr>
    		<td class="formTitle">组状态：</td>
    		<td class="formValue">
    			<input id="Radio3" name="groupStatus"  type="radio" checked="checked" value="1"/><label for="Radio3">正常</label>
	    		<input id="Radio4" name="groupStatus" type="radio" value="2"/><label for="Radio4">停用</label>
    		</td>
    	<tr>
    		<td class="formTitle">归属：</td>
    		<td class="formValue">
    			<select id="orgTree" style="width:200px;" class="easyui-combotree"   name="orgId" 
	        			data-options="url:'${ctx}/org/loadOrgTree',required:true"></select>  
    		</td>
    	</tr>
	    <tr>
	    	<td class="formTitle">组描述：</td>
	    	<td colspan="5" class="formValue"><textarea id="groupDesc" name="groupDesc" cols="20" rows="4" class="easyui-validatebox" style="width: 60%;" data-options="width:177"></textarea></td>
	    </tr>
    </table>
    </form>
</body>
</html>
<script>
	function save()
	{
		 var validate = $("#groupAddForm").form("validate");
         if (validate) 
         {
            $('#groupAddForm').form('submit',{  
   			url:"${ctx}/group/saveAdd",
    		success:function(data){  
    			var data = eval('(' + data + ')');
        		if(data.msg=="success")
        		{
        			parent.$("#groupList").datagrid('reload');
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