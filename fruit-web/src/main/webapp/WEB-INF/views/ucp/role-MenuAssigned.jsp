<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/common/baseTitle.jsp"%>
<html>

<head>
	<title>组新增</title>
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
</head>
<body>
    <form id="roleMenuAssigned" class="easyui-form">
    <input type="hidden" name="roleId" id="roleId" value="${role.roleId}">
    <ul  id="MenuAssigned" style="margin-top:10px;" class="easyui-tree" ></ul> 
    </form>

</body>
</html>
<script>

$(document).ready(function(){
 Array.prototype.indexOf = function(val) {
		for (var i = 0; i < this.length; i++) {
		if (this[i] == val) return i;
		}
		return -1;
		};
	Array.prototype.remove = function(val) {
		var index = this.indexOf(val);
		if (index > -1) {
		this.splice(index, 1);
		}}; 
	$('#MenuAssigned').tree({ 
		checkbox:true,
	    url:'${ctx}/menu/loadMenuTree',
	    onLoadSuccess:function(node,data){ 
	    	if(data!=null){
	    		$.post(	"${ctx}/role/selectmenu?roleId="+$("#roleId").val(),
	    		        function(result){
	    		  		$(result).each(function(i, obj){
	    		            var n = $("#MenuAssigned").tree('find',obj.menuId);
	    		           console.info(n);
	    		            if(n){
	    		                $("#MenuAssigned").tree('check',n.target);
	    		            }
	    		        });
	    		    },'json');
	    	}
	    }
	});
});
	function save()
	{
		var menus = "";
		 var parentRoot = "";
		 var arrayObj = new Array();
		 var validate = $("#roleMenuAssigned").form("validate");
		 var nodes = $("#MenuAssigned").tree('getChecked');
		 console.info(nodes);
		 var tree = $('#MenuAssigned');  
		 var path = new Array(); 
		$(nodes).each(function(i, obj){
			if($(obj).tree('isLeaf',obj.target)){
				var parent1=obj;
				  do { 
		    		   if(path.length==0){
			        		path.push(parent1.id);
			        	}else{
			        		var flag = "true";
			        		for( var i =0;i<path.length;i++){
			        			if(path[i]==parent1.id){
				        			flag = "false";
				        			break;
				        		};
			        		}
			        		if(flag=="true"){
			        			path.push(parent1.id);
			        		}
			        	};  
		           parent1 = tree.tree('getParent', parent1.target);  
		        } while (parent1);
			}
		});
	 path.remove('100');
		for(var i = 0;i<path.length;i++){
			menus=menus+path[i]+","
		}
		menus=menus+";"
       	menus=menus.replace(",;","").replace(";","");
		console.info(menus);
		 var url="${ctx}/role/roleId/menus";
			$.post( url,
           		 {'roleId':$("#roleId").val(),'menus':menus},
           		  function(result){
           			 console.info(result);
           		    if(result.result=="success"){
           		    	parent.$('#dd').dialog('close');	
           		    	$.messager.alert('通知','保存成功息！'); 
           		    }else{
           		    	$.messager.alert('通知','系统错误！'); 
           		    }
           		   },'json');
			
             
		
	}
</script>