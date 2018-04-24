<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/common/baseTitle.jsp"%>
<html>

<head>
	<title>组编辑</title>
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
    <legend>请填写表单</legend>
    <form id="groupUpdateForm" class="easyui-form">
  <!--   <span>组织ID:&nbsp;&nbsp;&nbsp;</span> -->
    <input name="groupId" type="hidden" value="${group.groupId}" type="text" class="easyui-validatebox" data-options="required: true, autoFocus: true" /><hr />
    <span>组织名称：</span>
    <input name="groupName" value="${group.groupName}" type="text" class="easyui-validatebox" data-options="required: true, prompt: ''" /><hr />    
    <span>状态：&nbsp;&nbsp;&nbsp;&nbsp;</span>
    <input id="Radio1" name="groupStatus"  type="radio" checked="checked" value="1"/><label for="Radio3">正常</label>
    <input id="Radio2" name="groupStatus" type="radio" value="2"/><label for="Radio4">停用</label>
    <hr/> 
    <span>组归属：</span>
    <select id="orgTree" class="easyui-combotree" style="width:200px;"  name="orgId" 
        data-options="url:'${ctx}/org/loadOrgTree',required:true"></select>  
   <hr/>   
    <span style="margin-top: 10px">组描述：</span>
    <textarea id="groupDesc" value="${group.groupDesc}" name="groupDesc" cols="20" rows="4" class="easyui-validatebox"></textarea>
    </form>
</fieldset>

</body>
</html>
<script>
	function update()
	{
		 var validate = $("#groupUpdateForm").form("validate");
		 debugger
         if (validate) 
         {
            $('#groupUpdateForm').form('submit',{  
   			url:"${ctx}//group/saveAdd",
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