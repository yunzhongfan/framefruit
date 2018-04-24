<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/common/baseTitle.jsp"%>
<html>

<head>
	<title>人员编辑</title>
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
	 
	 if("${dict.dictStatus}" == "1")
	 { 
	 	$("#Radio3").attr("checked",true);
	 }
	 else if("${dict.dictStatus}" == "2")
	 {
	 	$("#Radio4").attr("checked",true);
	 }
	
	
	
	  $('#cc').combotree('setValue', '${dict.prarentId}');
	  

	});
	
</script>
</head>
<body> 
<fieldset>
    <legend>表单详情</legend>
    <form id="dictForm" class="easyui-form">
    <span>参数编号：</span>
    <input id="dictId" name="dictId" value="${dict.dictId}" readonly="readonly" type="text" class="easyui-validatebox" data-options="required: true, autoFocus: true" /><hr />
    <span>参数名称：</span>
    <input name="dictName" value="${dict.dictName}" type="text" class="easyui-validatebox" data-options="required: true, prompt: '请输入姓名'" /><hr />
    <span>参数状态：</span>
    <input id="Radio3" name="dictStatus"  type="radio" value="1"/><label for="Radio3">正常</label>
    <input id="Radio4" name="dictStatus"  type="radio" value="2"/><label for="Radio4">停用</label>
    <hr/>
    <span>参数类型：</span>
    <select name="dictType" style="width:33%" class="easyui-validatebox" >     
    <option value="1" <c:if test="${'1' eq dict.dictType}">selected</c:if> >系统参数</option>  
    <option value="2" <c:if test="${'2' eq dict.dictType}">selected</c:if> >基础参数</option>
    <option value="3" <c:if test="${'3' eq dict.dictType}">selected</c:if> >业务参数</option>
    </select>
    <hr/>
    <span>父级参数：</span>
    <select id="cc" class="easyui-combotree" style="width:33%"  name="prarentId" value="${dict.prarentId}"
        data-options="url:'${ctx}/dict/loadDictTree',required:true"></select>
    </form>
</fieldset>

</body>
</html>
<script type="text/javascript">
	function update()
	{
		 var validate = $("#dictForm").form("validate");
         if (validate) 
         {
            $('#dictForm').form('submit',{  
   			url:"${ctx}/dict/saveUpdate",
    		success:function(data){ 
    		    var data = eval('(' + data + ')'); 
        		if(data.msg=="success")
        		{   
        			parent.$("#dictTree").tree('reload');
        			parent.$("#dictList").datagrid('reload');
        			parent.$('#addOrgWindow').dialog('close');
        		}  
        							
    		}  
			});       	
               
          } 
          else 
          {
             return false;
          }
	}
	
</script>
