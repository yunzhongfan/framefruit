<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/baseTitle.jsp"%>
<html>
<head>
	<%@ include file="/WEB-INF/views/common/baseJsCss.jsp"%>
	<script type="text/javascript" src="${ctx }/js/rule/ratingind_condition_search.js"></script>				
</head>

<body style="margin:0px">
	<div class="n_path">
	    <span class="searchbox-text">当前位置：统一配置台&nbsp;>&nbsp;参数配置&nbsp;>&nbsp;规则包管理&nbsp;&gt;&nbsp;<font color="#B80106"><strong>查看规则指标</strong></font></span>
	</div>
	<div id="addAllInformation">
		<form id="addRatingindForm" method="post">
			<input type="hidden" id="package_id" name="package_id" value="${rulePackage.package_id}" />
			<input type="hidden" id="rating_id" name="rating_id" value="${rulePackage.rating_id}" />
			<div class="easyui-panel" title="规则指标" style="width:100%;border-bottom-width: 0" >
				<div id="error"></div>
				<div id="message">
					<s:actionerror/>
					<s:actionmessage/>
				</div>
				<br/>
				<table width="100%"  class="editTab" id="searchRatingind"> 
	               <tr>
	                   <td align="right">指标代码：</td>
	                   <td align="left">
	                   		<input id="ind_id" name="ind_id" value="${rulePackage.ind_id}" style="width:200px;height:18px;border:1px  solid #95B8E7;padding:1px;"  disabled="disabled" />
	                   </td>
	                   <td align="right">指标名称：</td>
	                   <td align="left">
	                   		<input id="ind_name" name="ind_name" value="${rulePackage.ind_name}" style="width:200px;height:18px;border:1px  solid #95B8E7;padding:1px;"  data-options="required:true" />
	                   </td>
	               </tr>
	               <tr>
	              		<td align="right">是否关键：</td>
	               		<td align="left">
	               			<input id="is_key" type="hidden" value="${rulePackage.is_main}" />
		               		<select id="is_main" name="is_main" style="width:200px;height:18px;border:1px  solid #95B8E7;padding:1px;">
		               			<option value="1">关键</option>
		               			<option value="0">非关键</option>
		               		</select>              	
	               		</td>
	               		<td align="right">描述：</td>
	               		<td align="left">
	               			<input id="description" name="description" style="width:200px;height: 41px;border:1px  solid #95B8E7;padding:1px;"  value="${rulePackage.description}"  class="easyui-validatebox " />             	
	               		</td>
	               </tr>
				</table>
				<br/>
			</div>
		</form>
		<form id="mainForm" action="" method="post">
			<input type="hidden" id="package_ind_id" name="package_ind_id" value="${rulePackage.package_ind_id}" />
			<textarea id="rule_content" name="rule_content" >${rulePackage.rule_content}</textarea>
			<div class="easyui-panel" style="width:100%;border-top-width: 0">
				<table width="100%"  class="editTab" id="search"> 
		               <tr name="first">
		              		<td align="right" width="5%" name="ind_name">val：</td>
		               		<td align="left">
			               		<select id="select_condition" name="ind_condition" style="width:200px;height:18px;border:1px  solid #95B8E7;padding:1px;" onchange="doSelectChange(this);">
			               			<option value="包含">包含</option>
			               			<option value="大于">大于</option>
			               			<option value="小于">小于</option>
			               			<option value="大于等于">大于等于</option>
			               			<option value="小于等于">小于等于</option>
			               			<option value="介于">介于</option>
			               			<option value="等于">等于</option>
			               		</select>
		               		</td>
		               		<td align="right">约束值：</td>
		               		<td align="left">
		               			<input id="ind_val" name="ind_val" style="width:200px;height:18px;border:1px  solid #95B8E7;padding:1px;"   class="easyui-validatebox " />             	
		               			<span name="temp_val"></span>
		               		</td>
		               		<td align="right">分值：</td>
		               		<td align="left">
		               			<input id="ind_score" name="ind_score" style="width:200px;height:18px;border:1px  solid #95B8E7;padding:1px;"    class="easyui-validatebox " />             	
		               		</td>
		               	</tr>
				</table>
			</div>
			<br/>
		</form>
		<div>
			<table width="100%" border="1" cellspacing="0" cellpadding="0" class="editTab">
				<tr>
					<td>
						<a href="#" class="easyui-linkbutton" iconCls="icon-back" onclick="doBack();" style="margin-left: 30px">返回</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>
