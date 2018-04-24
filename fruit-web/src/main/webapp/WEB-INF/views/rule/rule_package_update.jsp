<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/baseTitle.jsp"%>
<html>
<head>
<%@ include file="/WEB-INF/views/common/baseJsCss.jsp"%>
<script type="text/javascript">
	//修改规则包
	function doAdd(){
		if(!$("#addRuleForm").form("validate")){
			$.messager.alert(msgTitle, "请检查栏位是否正确输入", "warning",function(){
				$("#addRuleForm .validatebox-invalid:first").focus();
			});
			return;
		}
		$.ajax({
			url: ctx+"/rule/updateRulePackage",
			type:"post",
			data:$("#addRuleForm").serialize(),
			success:function(result){
				$.messager.alert("修改规则包","该规则包修改成功！","info",function(){
				 	if(!!window.ActiveXObject || "ActiveXObject" in window){
					 	window.parent.frames["center"].reloadLeft();
					 	window.parent.frames["center"].reloadRightRule();
					}else{
						window.parent.frames["center"].reloadLeft();
						window.parent.frames["center"].reloadRightRule();
					} 
				  });
			}
		});
	}
	//返回
	function doBack(){
		if(!!window.ActiveXObject || "ActiveXObject" in window){
			window.parent.frames["center"].reloadLeft();
			window.parent.frames["center"].reloadRightRule();
		}else{
			window.parent.frames["center"].reloadLeft();
			window.parent.frames["center"].reloadRightRule();	
		}
		parent.$('#common_window').window('close');
	}
	
</script>
</head>

<body style="margin:0px">
	<div class="n_path">
	    <span class="searchbox-text">当前位置：统一配置台&nbsp;>&nbsp;参数配置&nbsp;>&nbsp;规则包管理&nbsp;&gt;&nbsp;<font color="#B80106"><strong>修改规则包</strong></font></span>
	</div>
	
	<form id="addRuleForm" action="" method="post">
		<input type="hidden"  name="package_id" value="${rulePackage.package_id}" />
		<div class="easyui-panel" title="规则包信息" style="width:100%;">
			<div id="error"></div>
			<div id="message">
				<s:actionerror/>
				<s:actionmessage/>
			</div>
			<br/>
			<table width="100%"  class="editTab" id="searchRule"> 
				<tr>
	        		<td align="right">所属类别：</td>
	                <td align="left">
	                	<input style="width:200px;height:18px;border:1px  solid #95B8E7;padding:1px;"  value="规则统一管理" data-options="required:true,validType:['unnormal','name','lengthb[0,50]'] " class="easyui-validatebox" disabled="disabled"/>
	                   	<font color="red">&nbsp;&nbsp;*</font>
	                </td>
	            </tr>
	            <tr>
	            	<td align="right">规则包名：</td>
	                <td align="left">
	                   	<input id="package_name" name="package_name" style="width:200px;height:18px;border:1px  solid #95B8E7;padding:1px;"  value="${rulePackage.package_name}" data-options="required:true,validType:['unnormal','name','lengthb[0,50]'] " class="easyui-validatebox" />
	                   	<font color="red">&nbsp;&nbsp;*</font>
	                </td>
	                <td align="right">规则包描述：</td>
	                <td align="left">
	                   	<input id="package_desc" name="package_desc" style="width:200px;height:18px;border:1px  solid #95B8E7;padding:1px;" maxlength="16" value="${rulePackage.package_desc}"  class="easyui-validatebox " />
	       			</td>
	            </tr>   
			</table>
			<br/>
			<br/> 
		</div>
		<table width="100%" border="1" cellspacing="0" cellpadding="0" class="editTab" id="search">
			<tr>
				<td>
					<a href="#" class="easyui-linkbutton" iconCls="icon-save" onclick="doAdd();" style="margin-left: 350px" >保存</a>
					<a href="#" class="easyui-linkbutton" iconCls="icon-back" onclick="doBack();" style="margin-left: 30px">返回</a>
				</td>
			</tr>
		</table>
		<br/>
	</form>
	
</body>
</html>
