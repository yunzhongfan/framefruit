<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/common/baseTitle.jsp"%>
<html>

<head>
	<title>MedLink</title>
	<%@ include file="/WEB-INF/views/common/baseJsCss.jsp"%>
	<script type="text/javascript" src="${ctx }/static/bootstrap/js/google-maps.js"></script>
	<link rel="stylesheet" type="text/css" href="${ctx }/static/bootstrap/css/font-awesome.css" />
<script type="text/javascript">
$(document).ready(
		function(){
			$("#left-menu-li").load(ctx+"/login/leftMenu");
		}
	);
function openMenuTow(nodeName,url) {  
    //树型菜单的名字   
    //var noteText = $(".tree-title", node.target).text();  
    var exist_tab = $('#main-tabs').tabs('getTab', nodeName);  
    //判断是否已经打开该选项卡  
    if (exist_tab) {  
        $('#main-tabs').tabs('select', nodeName);  
        return;  
    } else {  
    	var content;
    	if(url != ""){
    		url = ctx+url;
    		content='<iframe scrolling="yes" frameborder="0"  src="'+url+'" style="width:100%;height:100%;border:0px;"></iframe>';
    	}else{
    		content="优化中！"
    	}
        $('#main-tabs').tabs('add', {  
            'id' : 'tab',  
            title : nodeName,  
            fit : true,  
            content : content,  
            closable : true  
        });  
        //获取最后一个tabs 在新加的选项卡后面添加"关闭全部"  
        /* var li = $(".tabs-wrap ul li:last-child");  
        $("#close").remove();  
        li.after("<li id='close'><a class='tabs-inner' href='javascript:void()' onClick='javascript:closeAll()'>关闭全部</a></li>"); */  
    }  
} 
function closeAll() {  
    $(".tabs li").each(function(index, obj) {  
          //获取所有可关闭的选项卡  
          var tab = $(".tabs-closable", this).text();  
          $(".easyui-tabs").tabs('close', tab);  
    });  
    $("#close").remove();//同时把此按钮关闭  
}  
function logout(){
	/* $.messager.confirm('确认对话框', '您确定要退出系统吗？', function(r){
		if(r){ */
			window.location.href = "${ctx}/login/logout";
// 		}
// 	});
}
</script>
</head>
  
<body style="height:100%;" onload="$('.vertical-nav').verticalnav({speed: 400,align: 'left'});">
<div class="kePublic" style="height:100%;">
<!--效果html开始-->
<div class="content" style="height:100%;width:100%;">
	<div id="left-menu" style="height:100%;width:4%;">
	 <ul class="vertical-nav dark red" id="left-menu-li">
<%--		<li class="active"><a href="#"><i class="icon-home"><font class="textcls">首页</font></i></a></li>
		
		<c:forEach items="${topMenus}" var="item">
			<li>
				<c:if test="${empty item.url || item.url == '' }">
					<a href="#"><i class="icon-cogs"><font class="textcls">${item.menuName }</font></i></a>
				</c:if>
				<c:if test="${not empty item.url || item.url != '' }">
					<a href="${item.url }"><i class="icon-cogs"><font class="textcls">${item.menuName }</font></i></a>
				</c:if>
				<ul>
					<c:forEach items="${menuChilds }" var="childTwo">
						<c:if test="${childTwo.key==item.menuId }">
							<c:forEach items="${childTwo.value }" var="childT">
								<c:if test="${childT.parentId==childTwo.key }">
									<li><a href="#" onclick="openMenuTow('${childT.menuName }','${ctx}${childT.url }')">${childT.menuName }</a></li>
								</c:if>
							</c:forEach>
								
						</c:if>
					</c:forEach>
				</ul>
			</li>
		</c:forEach>--%>

	</ul> 
</div>
<div id="main" style="width:95%;border: 0px;background-color: #fff;" >
	<div id="main-top" style="border: 0px;background-color: #fff;">
		<div float="right" style="padding-top: 9px;">
			<ul>
				<li style="float: right;display: inline;margin: 3px 12px 0px 0px;">
					<a href="#"><img src="${ctx }/static/bootstrap/images/home.png"></a>
				</li>
				<li style="float: right;display: inline;margin: 3px 12px 0px 0px;">
					<a href="#"><img src="${ctx }/static/bootstrap/images/person.png"></a>
				</li>
				<li style="float: right;display: inline;margin: 3px 12px 0px 0px;">
					<a href="#"><img src="${ctx }/static/bootstrap/images/message.png"></a>
				</li>
				<li style="float: right;display: inline;margin: 3px 12px 0px 0px;">
					<a href="#" onclick="logout();"><img src="${ctx }/static/bootstrap/images/logout.png"></a>
				</li>
			</ul>
		</div>
	</div>
	<div id="main-bottom" style="border: 0px;height: 100%;width: 100%;margin-left: 26px;">
		<div id="main-tabs" class="easyui-tabs">
				<div title="首页" data-options="closeable:true" style="height: 100%;">
				   <iframe name="medLinkMain"  style="height:100%;width:100%;border: 0px" src="http://www.baidu.com"></iframe>
                </div>  

		</div>
	</div>
</div>

</div>
</div>

<!-- 通用弹出框 -->
	<div id="common_window"></div>
</body>
</html>
