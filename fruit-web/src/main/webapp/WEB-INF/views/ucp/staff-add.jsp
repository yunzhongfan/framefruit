<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/common/baseTitle.jsp"%>
<html>

<head>
	<title>人员新增</title>
	<%@ include file="/WEB-INF/views/common/baseJsCss.jsp"%>
<style type="text/css">
    fieldset{
        margin: 10px;
        /* min-width: 450px;*/
        vertical-align: middle;
        font-size: 12px;
        border:1px solid gray;
    }

    span{
		border:0;
		font-size: 12px;
	}
	
	input{
		height:28px;
	
	}
</style>
</head>
<body>
<fieldset>
    <legend>请填写表单</legend>
    <form id="staffForm" class="easyui-form">
    <span>工号：</span>
    <input type="text" class="easyui-textbox" />	
    <input name="staffId" type="text" class="easyui-validatebox" data-options="required: true, autoFocus: true"  style="height:28px; " /><hr />
    <span>姓名：</span>
    <input name="staffName" type="text" class="easyui-validatebox" data-options="required: true, prompt: '请输入姓名'" /><hr />
    <span>电话：</span>
    <input name="phone" type="text" class="easyui-validatebox" data-options="required: false,validType: 'mobile', prompt: '请输入手机号码'" /><hr />
    <span>邮件：</span>
    <input name="email" type="text" class="easyui-validatebox" data-options="required: false,validType: 'email', prompt: '请输入email'" /><hr />
    <span>性别：</span>
    <input id="Radio1" name="sex" type="radio" checked="checked" value="1" /><label for="Radio1">男</label>
    <input id="Radio2" name="sex" type="radio" value="2" /><label for="Radio2">女</label>
    <hr/>
    <span>状态：</span>
    <input id="Radio3" name="staffStatus"  type="radio" checked="checked" value="1"/><label for="Radio3">正常</label>
    <input id="Radio4" name="staffStatus" type="radio" value="2"/><label for="Radio4">停用</label>
    <hr/>
    <span>归属：</span>
    <select id="cc" class="easyui-combotree" style="width:150px;"  name="orgId" 
        data-options="url:'${ctx}/org/loadOrgTree',required:true"></select>
     
    </form>
</fieldset>
</body>
</html>
<script>
	function save()
	{
		 var validate = $("#staffForm").form("validate");
		 
         if (validate) 
         {
            $('#staffForm').form('submit',{  
   			url:"${ctx}/staff/saveAdd",
    		success:function(data){  
    			var data = eval('(' + data + ')');
    			if(data.msg=="sucess")
        		{
        			parent.$("#staffList").datagrid('reload');
        			
        		}  
        		parent.$('#msgDialog').dialog('close');					
    		}  
			});       	
          } 
          else 
          {
             return false;
          } 
	}
	
</script>