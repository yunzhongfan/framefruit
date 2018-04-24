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
    
	 if("${staff.sex}" == "1")
	 { 
	 	$("#Radio1").attr("checked",true);
	 }
	 else if("${staff.sex}" == "2")
	 {
	 	$("#Radio2").attr("checked",true);
	 }
	 
	 if("${staff.staffStatus}" == "1")
	 { 
	 	$("#Radio3").attr("checked",true);
	 }
	 else if("${staff.staffStatus}" == "2")
	 {
	 	$("#Radio4").attr("checked",true);
	 }
	
	
	
	  $('#orgTree').combotree('setValue', '${staff.orgId}');
	  

	});
	
</script>
</head>
<body> 
<fieldset>
    <legend>表单详情</legend>
    <form id="staffForm" class="easyui-form">
    <span>工号：</span>
    <input id="staffId" name="staffId" value="${staff.staffId}" readonly="readonly" type="text" class="easyui-validatebox" data-options="required: true, autoFocus: true" /><hr />
    <span>姓名：</span>
    <input name="staffName" value="${staff.staffName}" type="text" class="easyui-validatebox" data-options="required: true, prompt: '请输入姓名'" /><hr />
    <span>电话：</span>
    <input name="phone" value="${staff.phone}" type="text" class="easyui-validatebox" data-options="required: false,validType: 'mobile', prompt: '请输入手机号码'" /><hr />
    <span>邮件：</span>
    <input name="email" value="${staff.email}" type="text" class="easyui-validatebox" data-options="required: false,validType: 'email', prompt: '请输入email'" /><hr />
    <span>性别：</span>
    <input id="Radio1" name="sex" type="radio" value="1" /><label for="Radio1">男</label>
    <input id="Radio2" name="sex" type="radio" value="2" /><label for="Radio2">女</label>
    <hr/>
    <span>状态：</span>
    <input id="Radio3" name="staffStatus" type="radio" value="${staff.staffStatus}"/><label for="Radio3">正常</label>
    <input id="Radio4" name="staffStatus" type="radio" value="${staff.staffStatus}"/><label for="Radio4">停用</label>
    <hr/>
    <span>归属：</span>
    <select id="orgTree" class="easyui-combotree" style="width:200px;"  name="orgId" value="${staff.orgId}"
        data-options="url:'${ctx}/org/loadOrgTree',required:true"></select>
    
    </form>
</fieldset>

</body>
</html>
<script type="text/javascript">
	function update()
	{
		 var validate = $("#staffForm").form("validate");
         if (validate) 
         {
            $('#staffForm').form('submit',{  
   			url:"${ctx}/staff/saveUpdate",
    		success:function(data){ 
    		    var data = eval('(' + data + ')'); 
        		if(data.msg=="success")
        		{
        			//$.messager.show({ icon: "info", msg: "新增成功!" ,position: "center"});
        			parent.$("#staffList").datagrid('reload');
        			parent.$('#dd').dialog('close');
        		}  
        							
    		}  
			});       	
                // $.easyui.showOption(d.form("getData"), { title: "您输入的数据为" });
          } 
          else 
          {
             return false;
          }
	}
	
</script>
