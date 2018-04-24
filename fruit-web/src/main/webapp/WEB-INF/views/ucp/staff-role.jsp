<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/common/baseTitle.jsp"%>
<html>

<head>
	<title>用户绑定角色</title>
	<%@ include file="/WEB-INF/views/common/baseJsCss.jsp"%>	
</head>
<body class="easyui-layout panel-body">
    <div id="tt"  class="easyui-toolbar" style="height: 6%;vertical-align:middle;margin-top: 5px">
    	<input type="hidden" id="staffId" value="${staffId }" />
       <span style="margin-left: 15px">角色名称：</span>
       <input id="roleName" type="text" value=""  style="width: 100px"/>
       <a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-search'" onclick="leftList()">查询</a>
    
           <span style="margin-left: 18%">角色名称：</span>
       <input id="roleName1" type="text" value="" style="width: 100px" />
        <a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-search'" onclick="rightList()">查询</a>
    </div>

 <div class="easyui-layout" data-options="fit:true,border:false" style="height:auto;"  >   
    <div data-options="region:'west',split:false,title:'未选中角色',collapsible:false" style="width:300px;">  
        <table id="hasAttrDataGrid" data-options="fit:true,border:false"></table> 
    </div>  
          
    <div data-options="region:'center'" style="padding-top:182px; padding-left:12px;">  
        <a href="javascript:void(0)" class="easyui-linkbutton c1" style="width:60px;  margin-bottom:20px;" onclick="moveIn()">《 移入</a>  
        <a href="javascript:void(0)" class="easyui-linkbutton c5" style="width:60px;" onclick="moveOut()">移出 》</a>  
    </div>  
      
    <div data-options="region:'east',split:false,title:'选中的角色',collapsible:false" style="width:300px; ">  
        <table id="noAttrDataGrid" data-options="fit:true,border:false"></table> 
    </div>
</div> 
</body>
</html>

<script type="text/javascript">
var staffId= "${staffId}";
$(function(){
	leftList();
	rightList();
})
   function leftList()
   {	
// 	var left=window.parent.frames["center"].$("#staffList").datagrid('getSelected');
// 	var leftId=left.staffId
	$("#hasAttrDataGrid").datagrid({
        width: '100%',
        height: 300,
        method: "post",
        url: "${ctx}/staff/staffRole?leftId="+staffId,
        queryParams: {"roleName":$("#roleName").val()},
        idField: 'role_Id', 
        columns: [[
        	{ field: 'ck', checkbox:true },
            { field: 'role_Id', title: '角色编号', width: '30%' , tooltip: true,sortable:true},
            { field: 'role_Name', title: '角色名称', width: '30%' , tooltip: true,sortable:true},
            { field: 'role_Status', title: '角色状态', width: '30%' , tooltip: true,sortable:true,
            	formatter: function(value,row,index)
            	{
					if (value == "1")
					{
						return "正常";
					} 
					else if(value == "2")
					{
						return "停用";
					}
				}
            }
        ]],            
   		pagination: true,
        remoteSort: false,
        rownumbers: true,
        singleSelect: false,  
    	onLoadSuccess : function(data){
			 if(data.total==0) 
			 {				 
				var tips = "<font color=red>没有数据....</font>";
				$('#roleList').datagrid("insertRow",{index: 1,row:{role_Id : tips}} );
			 } 
		}
    
    });
	}

	function rightList()
	{
		//加载右边
// 		var right=window.parent.frames["center"].$("#staffList").datagrid('getSelected');
// 		var rightId=right.staffId
		$("#noAttrDataGrid").datagrid({
	        width: '100%',
	        height: 300,
	        method: "post",
	        url: "${ctx}/staff/staffRole1?rightId="+staffId,
	        queryParams: {"roleName":$("#roleName1").val()},
	        idField: 'role_Id',           
	        columns: [[
	        	{ field: 'ck', checkbox: true },
	            { field: 'role_Id', title: '角色编号', width: '30%' , tooltip: true,sortable:true},
	            { field: 'role_Name', title: '角色名称', width: '30%' , tooltip: true,sortable:true},
	            { field: 'role_Status', title: '角色状态', width: '30%' , tooltip: true,sortable:true,
	            	formatter: function(value,row,index)
	            	{
						if (value == "1")
						{
							return "正常";
						} 
						else if(value == "2")
						{
							return "停用";
						}
					}
	            }
	        ]],            
	   		pagination: true,
	        remoteSort: false,
	        rownumbers: true,
	        singleSelect: false,   
	    	onLoadSuccess : function(data){
				 if(data.total==0) 
				 {				 
					var tips = "<font color=red>没有数据....</font>";
					$('#roleList').datagrid("insertRow",{index: 1,row:{role_Id : tips}} );
				 } 
			}
	    
	    });
	}

	


//移到右边方法
    function moveOut(){  
        var checkeds = $('#hasAttrDataGrid').datagrid('getChecked'); 
// 	    var left=window.parent.frames["center"].$("#staffList").datagrid('getSelected');
// 	    var staffid=left.staffId
        var idStr = '';  
        for(var i = 0; i < checkeds.length; i++){  
            idStr += checkeds[i].role_Id + ",";  
        }
        if(idStr.length == 0){  
        	 $.messager.alert('提示信息', '请选择要移出的属性！', 'info');       
            return;  
        }  
        //parent.$.messager.confirm('询问', '您是否要执行该操作？', function(b) {  
        //    if (b) {  
                $.ajax({  
                    url:"${ctx}/staff/staffRoleMoveout?ids="+idStr+"&staffid="+staffId,
                    type:"post",
                    dataType :"json",
                    success:function(msg){
                    	if(msg==1){
                    		 $('#hasAttrDataGrid').datagrid('reload');       //刷新代码
                    		 $('#hasAttrDataGrid').datagrid('unselectAll');
                    		 $('#noAttrDataGrid').datagrid('reload');        //刷新代码
                    		 $('#noAttrDataGrid').datagrid('unselectAll');
                    	}
                    		 
                      }
                          
                });   
       //    }  
       // });  
    }  

//移到左边方法
function moveIn(){  
// 	    var left=window.parent.frames["center"].$("#staffList").datagrid('getSelected');
// 	    var staffid=left.staffId
        var checkeds = $('#noAttrDataGrid').datagrid('getChecked'); 
        var idStr = '';  
        for(var i = 0; i < checkeds.length; i++){  
            idStr += checkeds[i].role_Id + ",";  
        }  
        if(idStr.length == 0){  
        	 $.messager.alert('提示信息', '请选择要移出的属性！', 'info');        
            return;  
        } 
        //parent.$.messager.confirm('询问', '您是否要执行该操作？', function(b) {  
        //    if (b) {  
                $.ajax({  
                    url:"${ctx}/staff/staffRoleMovein?ids="+idStr+"&staffid="+staffId,
                    type:"post",
                    dataType :"json",
                    success:function(msg){
                    	if(msg==1){
                    		  $('#hasAttrDataGrid').datagrid('reload');       //刷新代码
                    		  $('#hasAttrDataGrid').datagrid('unselectAll');
                    		  $('#noAttrDataGrid').datagrid('reload');         //刷新代码
                    		  $('#noAttrDataGrid').datagrid('unselectAll');

                    	}
                    		 
                      }
                          
                });   
        //    }  
        //});  
    } 

     function save(){
         var all = $('#noAttrDataGrid').datagrid('getData'); 
         var idStr = '';   
         for(var i = 0; i<all.rows.length; i++){  
             idStr += all.rows[i].role_Id + ",";  
         }  
//          var staffid=window.parent.frames["center"].$("#staffList").datagrid('getSelected').staffId
         $.ajax({  
        	 url:ctx+"/staff/saveStaffRoleS?ids="+idStr+"&staffid="+staffId,
             type:"post",
             dataType :"json",
             success:function(msg){
            	    $.messager.alert('提示信息', '用户绑定角色成功！', 'info');       
               }
                   
         });  
     }
     
</script>