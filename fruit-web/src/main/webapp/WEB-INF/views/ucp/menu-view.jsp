<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/common/baseTitle.jsp"%>
<html>

<head>
	<title>菜单信息查看</title>
	<%@ include file="/WEB-INF/views/common/baseJsCss.jsp"%>	
	<script type="text/javascript" src="${ctx }/js/ucp/menu-operating.js"></script>
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
	 
		 if("${menu.type}" == "1")
		 { 
		 	$("#Radio1").attr("checked",true);
		 }
		 else if("${org.type}" == "2")
		 {
		 	$("#Radio2").attr("checked",true);
		 }	 
		 
		 if("${menu.status}" == "1")
		 { 
		 	$("#Radio3").attr("checked",true);
		 }
		 else if("${menu.status}" == "2")
		 {
		 	$("#Radio4").attr("checked",true);
		 }
	
	
	  $('#parentId').combotree({ disabled: true }); 
	  
	  $('#parentId').combotree('setValue', '${menu.parentId}');
// 	  $(":input").attr("disabled", "disabled");

	});
	
</script>
</head>
<body>

<fieldset>
    <legend>表单详情</legend>
   <form id="menuForm" class="easyui-form" method="post">
   <!--  <span>编号：</span>
    <input name="menuId" type="text" class="easyui-validatebox" data-options="required: true, autoFocus: true" /><hr /> -->
    <span>名&nbsp;&nbsp;称：</span>
    <input name="menuName" type="text" value="${menu.menuName }" disabled="disabled" class="easyui-validatebox" data-options="required: true, prompt: '请输入菜单名称'" /><hr />
    <span>类&nbsp;&nbsp;型：</span>
    <input id="Radio1" name="type"  type="radio" value="1" disabled="disabled"/><label for="Radio1">菜单</label>
    <input id="Radio2" name="type" type="radio" value="2" disabled="disabled"/><label for="Radio2">按钮</label>
    <hr/>
    <span>状&nbsp;&nbsp;态：</span>
    <input id="Radio3" name="status"  type="radio" value="1" disabled="disabled"/><label for="Radio3">正常</label>
    <input id="Radio4" name="status" type="radio" value="2" disabled="disabled"/><label for="Radio4">停用</label>
    <hr/>
    <span>路&nbsp;&nbsp;径：</span>
    <input name="url" type="text" value="${menu.url }" disabled="disabled" class="easyui-validatebox" data-options="required: true, prompt: '请输入菜单路径'" /><hr />
    <span>所属上级：</span>
    <select id="parentId" class="easyui-combotree" style="width:200px;"  name="parentId"
        data-options="url:'${ctx}/menu/loadMenuTree',required:true"></select>
    <!-- <hr />
    <span>备注：</span>
    <textarea id="TextArea1" cols="20" rows="2" class="easyui-validatebox" data-options="required: true"></textarea> -->
    </form>
</fieldset>
</body>
</html>
