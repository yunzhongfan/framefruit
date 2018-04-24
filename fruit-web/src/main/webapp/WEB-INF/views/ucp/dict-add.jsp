<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/common/baseTitle.jsp"%>
<html>

<head>
	<title>参数添加</title>
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
</style>
</head>
<body>
<fieldset>
    <legend>请填写表单</legend>
    <form id="dictForm" class="easyui-form">
    <span>参数编号：</span>
    <input name="dictId" type="text" class="easyui-validatebox" data-options="required: true, autoFocus: true" /><hr />
    <span>参数名称：</span>
    <input name="dictName" type="text" class="easyui-validatebox" data-options="required: true, prompt: '请输入参数名称'" /><hr />
    <span>参数状态：</span>
    <input id="Radio3" name="dictStatus"  type="radio" checked="checked" value="1"/><label for="Radio3">正常</label>
    <input id="Radio4" name="dictStatus"  type="radio" value="2"/><label for="Radio4">停用</label>
    <hr/>
    <span>参数类型：</span>
    <!-- <input name="dictType" type="text" class="easyui-validatebox"  /><hr />   -->
    <select id="ccc"  style="width:33%"  name="dictType" >
        <option value='1'>系统参数</option>
        <option value='2'>基础参数</option>
        <option value='3'>业务参数</option>
    </select><hr />  
    <span>父级参数：</span>
   <!--  <input name="prarentId" type="text" class="easyui-validatebox" /><hr />   -->
    <select id="cc" class="easyui-combotree" style="width:33%"  name="prarentId" 
    data-options="url:'${ctx}/dict/loadDictTree',required:true"></select>
    </form>
</fieldset>
</body>
</html>
<script>
	function save()
	{
		 var validate = $("#dictForm").form("validate");
		 
         if (validate) 
         {
            $('#dictForm').form('submit',{  
   			url:"${ctx}/dict/saveAdd",
    		success:function(data){ 
    			var data = eval('(' + data + ')');
    			if(data.msg=="success")
        		{
        			parent.$("#dictList").datagrid('reload');
        			parent.$("#dictTree").tree('reload');
        			
        		}  
        		parent.$('#addOrgWindow').dialog('close');					
    		}  
			});       	
          } 
          else 
          {
             return false;
          } 
	}
	
</script>