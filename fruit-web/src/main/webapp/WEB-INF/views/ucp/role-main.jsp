<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/common/baseTitle.jsp"%>
<html>

<head>
	<title>角色信息管理</title>
	<%@ include file="/WEB-INF/views/common/baseJsCss.jsp"%>
	
</head>
<body>
	<div id="p" class="easyui-panel" title="角色信息管理">
	<div id="tt" class="easyui-toolbar" style="height: 6%;vertical-align:middle;margin-top: 15px">
       <span style="margin-left: 30px">角色名称：</span>
       <input id="roleName" type="text" value="" />
        <a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-search'" onclick="queryRoleList()">查询</a>
        <a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-plus'" onclick="add()">新增</a>
        <a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-eye2'" onclick="view()">查看</a>
        <a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-console'" onclick="update()">编辑</a>
        <a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-wrench'" onclick="roleMenuAssigned()">角色菜单分配</a>
        <a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-close'" onclick="del()">删除</a>
    </div>
	<table id="roleList"></table>
	</div>
	<div id="dd"></div>
</body>
<script type="text/javascript">
    $(function () {
        queryRoleList();
    });
    
    function queryRoleList()
    {
    	$("#roleList").datagrid({
            width: '100%',
            height: 560,
            method: "post",
            url: "${ctx}/role/list",
            queryParams: {"roleName":$("#roleName").val()},
            idField: 'roleId',           
            columns: [[
            	{ field: 'ck', checkbox: true },
                { field: 'roleId', title: '角色编号', width: '10%' , tooltip: true,sortable:true},
                { field: 'roleName', title: '角色名称', width: '10%' , tooltip: true,sortable:true},
                { field: 'roleStatus', title: '角色状态', width: '10%' , tooltip: true,sortable:true,
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
                },
                
                { field: 'roleDesc', title: '角色描述', width: '30%' , tooltip: true,sortable:true},               
                { field: 'createDate', title: '创建日期', width: '18%' ,sortable:true},
                { field: 'modifyDate', title: '修改时间', width: '18%' ,sortable:true}
            ]],            
       		pagination: true,
            remoteSort: false,
            rownumbers: true,
            singleSelect: true,           
        	onLoadSuccess : function(data){
				 if(data.total==0) 
				 {				 
					var tips = "<font color=red>没有数据....</font>";
					$('#roleList').datagrid("insertRow",{index: 1,row:{roleId : tips}} );
				 } 
			}
        
        });
    };
    
   
    function add()
    {
        var url = "${ctx}/role/add";    
    	$('#dd').dialog({    
    	title: '角色新增', 
    	iconCls: 'icon-metro-user',   
    	width: 600,    
    	height: 400,    
    	closed: false,    
    	cache: false,    
    	content: '<iframe id="open-age" name="open-page" scrolling="auto" frameborder="0" src="' + url + '" style="width:100%;height:100%;"></iframe>',   
    	modal: true ,
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
                    	$('#dd').dialog('close');
                    }
                }]  
		});         
    };
    
    
    
    
    function del()
    {
    	var row = $("#roleList").datagrid('getSelected');
        if (row == null || row.roleId==null)
        {
          $.messager.alert('提示信息', '请选择要删除的数据！', 'info');
           return false;
        }
        else 
        {          		  
          $.messager.confirm('确认','您确认想要删除记录吗？',function(r){
          	if (r)
          	{    
				$.ajax({  
					type: "POST",
					url:ctx+"/role/del",
                	type:"post",
                	data: {"roleId":row.roleId},
                	dataType :"json",
                	async:false,  
       				cache:false, 
               		success: function(data){  
               			if(data.msg =="success")
               			{
               				$("#roleList").datagrid('reload');
               			}
           			}                                            
                   });    
           	 } 
           });    		  
         }
                
    }
    
    
    
    
    
    function view()
    {
    	var row = $("#roleList").datagrid('getSelected');
        if (row == null || row.roleId==null)
        {
          $.messager.alert('提示信息', '请选择要查看的数据！', 'info');
           return false;
        }
        else 
        {    
            var url = "${ctx}/role/view?roleId="+row.roleId;        		  
         	                
            $('#dd').dialog({    
    		title: '角色查看',    
    		width: 600,    
    		height: 400,    
    		closed: false,    
    		cache: false,    
    		content: '<iframe id="open-page" name="open-page" scrolling="auto" frameborder="0" src="' + url + '" style="width:100%;height:100%;"></iframe>',   
    		modal: true ,
        	buttons: [{
                    text:'取消',
                    iconCls:'icon-cancel',
                    handler:function(){
                    	$('#dd').dialog('close');
                    }
                }]  
			});           
                    		  
        }
    }
    
    
    
    function update()
    {
    	var row = $("#roleList").datagrid('getSelected');
        if (row == null || row.roleId==null)
        {
          $.messager.alert('提示信息', '请选择要更改的数据！', 'info');
           return false;
        }
        else 
        {          		  
         	var url = "${ctx}/role/update?roleId="+row.roleId;        		  
         	                
            $('#dd').dialog({    
    		title: '角色编辑',    
    		width: 600,    
    		height: 400,    
    		closed: false,    
    		cache: false,    
    		content: '<iframe id="open-page" name="open-page" scrolling="auto" frameborder="0" src="' + url + '" style="width:100%;height:100%;"></iframe>',   
    		modal: true ,
        	buttons: [{
                    text:'保存',
                    iconCls:'icon-save',
                    handler:function(){
                       window.frames["open-page"].window.update();
                    }
                },{
                    text:'取消',
                    iconCls:'icon-cancel',
                    handler:function(){
                    	$('#dd').dialog('close');
                    }
                }]  
			});           
                    		  
        }
    }
    
    function roleMenuAssigned(){
    	
    	var row = $("#roleList").datagrid('getSelected');
        if (row == null || row.roleId==null)
        {
          $.messager.alert('提示信息', '请选择要分配的角色！', 'info');
           return false;
        }else{
        	var url = "${ctx}/role/role-MenuAssigned?roleId="+row.roleId;    
        	$('#dd').dialog({    
        	title: '角色菜单分配', 
        	iconCls: 'icon-metro-user',   
        	width: 600,    
        	height: 400,    
        	closed: false,    
        	cache: false,    
        	content: '<iframe id="open-age" name="open-page" scrolling="auto" frameborder="0" src="' + url + '" style="width:100%;height:100%;"></iframe>',   
        	modal: true ,
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
                        	$('#dd').dialog('close');
                        }
                    }]  
    		}); 
        }
    }
  
</script>
