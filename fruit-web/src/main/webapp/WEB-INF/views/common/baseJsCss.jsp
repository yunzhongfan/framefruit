	<%@ page pageEncoding="UTF-8" %>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
	<meta http-equiv="Cache-Control" content="no-store"/>
	<meta http-equiv="Pragma" content="no-cache"/>
	<meta http-equiv="Expires" content="0"/>
	<meta name="keywords" content="" />
	<meta name="description" content=" " />
	<meta name="generator" content="Discuz! 6.1.0" />
	<meta name="copyright" content="纬创软件" />
	<c:set var="ctx" value="${pageContext.request.contextPath}"/>
	<script type="text/javascript">
		var ctx = "<%=request.getContextPath()%>";
	</script>	
	
    
	<link rel="stylesheet" type="text/css" href="${ctx}/static/jquery-easyui-1.5/themes/metro/easyui.css" />
 	<link rel="stylesheet" type="text/css" href="${ctx}/static/jquery-easyui-1.5/themes/icon.css" />
	
 	
 	
 	<link href="${ctx}/static/jquery-easyui-theme/metro-standard/easyui.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/jquery-easyui-theme/icon.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/icons/icon-all.css" rel="stylesheet" type="text/css"/>
 	<link href="${ctx}/static/extends/jeasyui.extensions.css" rel="stylesheet" type="text/css"/>
 	
 
 	<script type="text/javascript" src="${ctx}/static/jquery-easyui-1.5/jquery.min.js"></script>
 	  
	<script type="text/javascript" src="${ctx}/static/jquery-easyui-1.5/jquery.easyui.min.js"></script>

	<script type="text/javascript" src="${ctx}/static/extends/validatebox.js"></script>
	
 	<script type="text/javascript" src="${ctx}/static/jquery-easyui-1.5/locale/easyui-lang-zh_CN.js"></script>
 	
 	
	
    <script>
    //url：窗口调用地址，title：窗口标题，width：宽度，height：高度，shadow：是否显示背景阴影罩层  
	function showMessageWindow(url, title, width, height, shadow) {  
    	var content = '<iframe id="open-age" name="open-page" src="' + url + '" width="100%" height="99%" frameborder="0" scrolling="no"></iframe>';  
    	var boarddiv = '<div id="msgwindow" title="' + title + '"></div>'//style="overflow:hidden;"可以去掉滚动条  
    	$(document.body).append(boarddiv);  
    	var win = $('#msgwindow').window({  
        	content: content,  
        	width: width,  
        	height: height,  
        	modal: shadow,  
        	title: title,  
        	onClose: function () {  
            $('#msgwindow').window('destroy');//后面可以关闭后的事件  
        	}  
    	});  
    	win.dialog('open');  
	} ;


	//url：窗口调用地址，title：窗口标题，width：宽度，height：高度，shadow：是否显示背景阴影罩层  
	function showMessageDialog(url, title, width, height, shadow) {  
    	var content = '<iframe id="open-age" name="open-page" src="' + url + '" width="100%" height="99%" frameborder="0" scrolling="no"></iframe>';  
    	var boarddiv = '<div id="msgDialog" title="' + title + '"></div>'//style="overflow:hidden;"可以去掉滚动条  
    	$(document.body).append(boarddiv);  
    	var win = $('#msgDialog').dialog({  
        	content: content,  
        	width: width,  
        	height: height,  
        	modal: shadow,  
        	title: title,  
        	onClose: function () {  
            $(this).dialog('destroy');//后面可以关闭后的事件  
        	} ,
         	buttons: [{
                    text:'保存',
                    iconCls:'icon-save',
                    handler:function(){
                    	window.frames["open-page"].window.save();                      
                    }
                },{
                    text:'取消',
                    iconCls:'icon-cancel',
                    handler:function(){
                    	 $('#msgDialog').dialog('destroy');//后面可以关闭后的事件  
                    }
                }]   
   		});  
    	win.dialog('open');  
	} 
    
    </script>
    
    