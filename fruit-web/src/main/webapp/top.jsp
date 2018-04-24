<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="static/css-top/global.css">
<link rel="stylesheet" href="static/css-top/common-header9.css">
<script type="text/javascript" src="static/js-top/base-all.js"></script>
<script type="text/javascript" src="static/js-top/common-header.js"></script>



<div style="background-color: #4f5052;height: 20px">
	<div style="float: left; padding-left: 10px;"><font color="#ffffff">甜橙信贷审批系统</font></div>
	<div style="float: right; width: 250px; text-align: left;padding-right: 10px;">
				<span style="width: 50px;"><font color="#ffffff">登录用户:&nbsp</font></span>
				<span style="width: 100px;"><font color="#ffffff">${userInfo.user_name }</font></span>
				<span style="width: 50px;" onclick="updatePassword();"><font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;修改密码</font></span>
				<span style="width: 50px;" onclick="doLogout();"><font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;退出</font></span>
	</div>
			
</div>
<div data-spm="2">
  <div class="ali-common-header">
    <div class="ali-common-header-inner common-header-clearfix">
	
<%-- <ul class="headmenu item pull-left" id="J_common_header_menu" data-spm="201">
	<c:forEach items="${topMenus}" var="item">
	
	   <li class="top-menu-item" has-dropdown="true" menu-type="dev" data-spm-click="">
	          <a class="menu-hd" href="javascript:void(0)">
	          	${item.desp }
	          </a>
	          <div class="menu-dropdown solutions dev-bg">
	            <div class="menu-dropdown-inner module-padding dev-inner common-header-clearfix">
		              
		              		<c:forEach items="${childs }" var="childTwo">
					    		<c:if test="${childTwo.key==item.id }">
					    			<c:forEach items="${childTwo.value }" var="childT">
					    				<c:if test="${childT.parent_id==childTwo.key }">
					    					<div class="module-wrap " style="">
						    					<div class="module-hd">
								                  	${childT.desp }
								                </div>
								                <div class="module-bd">
								                <c:forEach items="${childTwo.value }" var="childTree">
			    									<c:if test="${childTree.parent_id==childT.id }">
			    									    <c:if test='${childTree.desp=="数据采集"}'>
			    									        <a onclick="openUrl('${childTree.href}')" target="center">			    										
										                    <img src="${ctx}/images/login/${childTree.img_name}"/>
										                    ${childTree.desp }
										                    </a>
			    									    </c:if>
			    										 <c:if test='${childTree.desp!="数据采集"}'>
			    									        <a onclick="openUrl('${ctx}${childTree.href}')" target="center">			    										
										                    <img src="${ctx}/images/login/${childTree.img_name}"/>
										                    ${childTree.desp }
										                    </a>
			    									    </c:if>
			    									</c:if>
			    								</c:forEach>
			    								</div>
		    								</div>
					    				</c:if>
					    			</c:forEach>
					    		</c:if>
					    	</c:forEach>
		                
		             
	             
	            </div>
	            
	          </div>
	    </li>
	    
  </c:forEach>
  
</ul> --%>
<ul class="headmenu item pull-left" id="J_common_header_menu" data-spm="201">
	 <li class="top-menu-item" has-dropdown="true" menu-type="dev" data-spm-click="">
	 <a class="menu-hd" href="javascript:void(0)">我的工作台</a>	         
	  </li>
	 <li class="top-menu-item" has-dropdown="true" menu-type="dev" data-spm-click="">
	  <a class="menu-hd" href="javascript:void(0)"> 門診管理</a>
	  </li>
	 <li class="top-menu-item" has-dropdown="true" menu-type="dev" data-spm-click="">
	 <a class="menu-hd" href="javascript:void(0)"> 閱片管理</a>
	 </li>
	 <li class="top-menu-item" has-dropdown="true" menu-type="dev" data-spm-click="">
	 	<a class="menu-hd" href="javascript:void(0)">統一配置台</a>
	 </li>
</ul>
</div>
</div>
</div>
