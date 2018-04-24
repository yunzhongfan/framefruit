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
    
	if("${post.postStatus}" == "1")
	 { 
	 	$("#Radio1").attr("checked",true);
	 }
	 else if("${post.postStatus}" == "2")
	 {
	 	$("#Radio2").attr("checked",true);
	 }
	
	 $("#postDesc").val("${post.postDesc}");
	   
	 $("#postId").attr("disabled", "disabled");	
	
	});
	
</script>
</head>
<body>
<fieldset style="height: 230px">
    <legend>请填写表单</legend>
    <form id="postForm" class="easyui-form">
    <span>岗位ID:&nbsp;&nbsp;&nbsp;</span>
    <input name="postId" value="${post.postId}" type="text" class="easyui-validatebox" data-options="autoFocus: true" /><hr />
    <span>岗位名称：</span>
    <input name="postName" value="${post.postName}" type="text" class="easyui-validatebox" data-options="prompt: ''" /><hr />    
    <span>状态：&nbsp;&nbsp;&nbsp;&nbsp;</span>
    <input id="Radio1" name="postStatus"  type="radio" checked="checked" value="1"/><label for="Radio1">正常</label>
    <input id="Radio2" name="postStatus" type="radio" value="2"/><label for="Radio1">停用</label>
    <hr/>    
     <span>归属：</span>
    <select id="orgTree" class="easyui-combotree" style="width:200px;"  name="orgId"
        data-options="url:'${ctx}/org/loadOrgTree',required:true"></select>
     </hr>   
    <span style="margin-top: 10px">岗位描述：</span>
    <textarea id="postDesc" name="postDesc" cols="20" value="${post.postDesc}" rows="4" class="easyui-validatebox"></textarea>
    </form>
</fieldset>

</body>
</html>
<script>
	function update()
	{
		 var validate = $("#postForm").form("validate");
         if (validate) 
         {
            $('#postForm').form('submit',{  
   			url:"${ctx}/post/saveUpdate",
    		success:function(data){  
    			var data = eval('(' + data + ')');
        		if(data.msg=="success")
        		{
        			parent.$("#postList").datagrid('reload');
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