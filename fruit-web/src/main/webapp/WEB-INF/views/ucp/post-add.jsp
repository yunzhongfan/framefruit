<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/common/baseTitle.jsp"%>
<html>

<head>
	<title>岗位新增</title>
	<%@ include file="/WEB-INF/views/common/baseJsCss.jsp"%>
<style type="text/css"> 
body,table{ 
font-size:12px; 
} 
table{ 
table-layout:fixed; 
empty-cells:show; 
border-collapse: collapse; 
margin:0 auto; 
} 
td{ 
height:30px; 
} 
h1,h2,h3{ 
font-size:12px; 
margin:0; 
padding:0; 
} 
.table{ 
border:1px solid #cad9ea; 
color:#666; 
} 
.table th { 
background-repeat:repeat-x; 
height:30px; 
} 
.table td,.table th{ 
border:1px solid #cad9ea; 
padding:0 1em 0; 
} 
.table tr.alter{ 
background-color:#f5fafe; 
} 
</style> 
</head>
<body>

   <form id="postForm" class="easyui-form">
    	<table>
			<tr>
				<td>岗位ID:</td>
				<td><input name="postId" type="text" class="easyui-validatebox" data-options="required: true, autoFocus: true" /></td>
			</tr>
			<tr>
				<td>岗位名称：</td>
				<td><input name="postName" type="text" class="easyui-validatebox" data-options="required: true, prompt: ''" /></td>
			</tr>
			<tr>
				<td>状态：</td>
				<td>
					 <input id="Radio3" name="postStatus"  type="radio" checked="checked" value="1"/><label for="Radio3">正常</label>
    				 <input id="Radio4" name="postStatus" type="radio" value="2"/><label for="Radio4">停用</label>
				</td>
			</tr>
			<tr>
				<td>归属：</td>
				<td>
					<select id="orgTree" class="easyui-combotree" style="width:180px;"  name="orgId"  data-options="url:'${ctx}/org/loadOrgTree',required:true"> </select>      
   
				</td>
			</tr>
			<tr>
				<td>岗位描述：</td>
				<td>
					<textarea id="postDesc" name="postDesc" cols="20" rows="4" class="easyui-validatebox"></textarea>
				</td>
			</tr>
		</table>
    </form>

		
		
		
</body>
</html>
<script>
	function save()
	{
		 var validate = $("#postForm").form("validate");
         if (validate) 
         {
            $('#postForm').form('submit',{  
   			url:"${ctx}/post/saveAdd",
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