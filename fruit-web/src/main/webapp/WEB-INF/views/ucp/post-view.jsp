<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/common/baseTitle.jsp"%>
<html>

<head>
	<title>岗位信息查看</title>
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
    
	
	 
	 if("${post.postStatus}" == "1")
	 { 
	 	$("#Radio1").attr("checked",true);
	 }
	 else if("${post.postStatus}" == "2")
	 {
	 	$("#Radio2").attr("checked",true);
	 }
	
	   $("#postDesc").val("${post.postDesc}");
	   
	$(":input").attr("disabled", "disabled");	
});
	
</script>
</head>
<body>
<fieldset style="height: 230px">
    <legend>岗位信息</legend>
    <span>岗位ID:&nbsp;&nbsp;&nbsp;</span>
    <input name="postId" value="${post.postId}" type="text" class="easyui-validatebox" data-options="autoFocus: true" /><hr />
    <span>岗位名称：</span>
    <input name="postName" value="${post.postName}" type="text" class="easyui-validatebox" data-options="prompt: ''" /><hr />    
    <span>状态：&nbsp;&nbsp;&nbsp;&nbsp;</span>
    <input id="Radio1" name="postStatus"  type="radio" checked="checked" value="1"/><label for="Radio1">正常</label>
    <input id="Radio2" name="postStatus" type="radio" value="2"/><label for="Radio1">停用</label>
    <hr/>    
    <span style="margin-top: 10px">岗位描述：</span>
    <textarea id="postDesc" name="postDesc" cols="20" value="${post.postDesc}" rows="4" class="easyui-validatebox"></textarea>
</fieldset>
        
</body>
</html>
