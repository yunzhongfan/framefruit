<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<link rel="stylesheet" type="text/css" href="${ctx }/static/css-top/global.css" />
<link rel="stylesheet" type="text/css" href="${ctx }/static/css-top/common-header9.css" />

<!-- <script type="text/javascript" src="${ctx }/static/js-top/base-all.js"></script> -->
<script type="text/javascript" src="${ctx }/static/js-top/common-header.js"></script>
<script type="text/javascript">
function openUrl(url,element){
	//parent.main.location.href=url;
	window.parent.$("#center").attr("src",url);	
}

function updatePassword() {
	
	var url = ctx+'/login!toUpdatePasswordPage.action';
	
	openTopWindow(url,"修改密码",400,260);
	
	
}

function doLogout() {
	$.messager.confirm("确认对话框", "您确定要退出系统吗？", function(r){
		if(r){
			window.location.href = "${ctx}/login/logout";
		}
	});
}
</script>
</head>
<body>
<div style="background-color: #4f5052;height: 20px">
	<div style="float: left; padding-left: 10px;"><font color="#ffffff">MedLink</font></div>
	<div style="float: right; width: 250px; text-align: left;padding-right: 10px;">
				<span style="width: 50px;"><font color="#ffffff">登录用户:&nbsp</font></span>
				<span style="width: 100px;"><font color="#ffffff">${userInfo.staffName }</font></span>
				<span style="width: 50px;" onclick="updatePassword();"><font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;修改密码</font></span>
				<span style="width: 50px;" onclick="doLogout();"><font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;退出</font></span>
	</div>
			
</div>
<div data-spm="2">
  <div class="ali-common-header">
    <div class="ali-common-header-inner common-header-clearfix">
	
 <ul class="headmenu item pull-left" id="J_common_header_menu" data-spm="201">
	<c:forEach items="${topMenus}" var="item">
	
	   <li class="top-menu-item" has-dropdown="true" menu-type="dev" data-spm-click="">
	          <a class="menu-hd" href="javascript:void(0)">
	          	${item.menuName }
	          </a>
	          <div class="menu-dropdown solutions dev-bg">
	            <div class="menu-dropdown-inner module-padding dev-inner common-header-clearfix">
		              
		              		<c:forEach items="${menuChilds }" var="childTwo">
					    		<c:if test="${childTwo.key==item.menuId }">
					    			<c:forEach items="${childTwo.value }" var="childT">
					    				<c:if test="${childT.parentId==childTwo.key }">
					    					<div class="module-wrap " >
						    					<div class="module-hd">
						    						 <a onclick="openUrl('${ctx}${childT.url}')" target="center" style="color: #333;">			    										
<!-- 										                    <img src="${ctx}/images/login/${childTree.img_name}"/> -->
										                    ${childT.menuName }
										                    </a>
<!-- 								                  	${childT.menuName } -->
								                </div>
								               <%--  <div class="module-bd">
								                <c:forEach items="${childTwo.value }" var="childTree">
			    									<c:if test="${childTree.parentId==childT.menuId }">
			    									        <a onclick="openUrl('${ctx}${childTree.url}')" target="center">			    										
<!-- 										                    <img src="${ctx}/images/login/${childTree.img_name}"/> -->
										                    ${childTree.menuName }
										                    </a>
			    									</c:if>
			    								</c:forEach>
			    								</div> --%>
		    								</div>
					    				</c:if>
					    			</c:forEach>
					    		</c:if>
					    	</c:forEach>
	            </div>
	            
	          </div>
	    </li>
	    
  </c:forEach>
  
</ul>
</div>
</div>
</div>
</body>
</html>
