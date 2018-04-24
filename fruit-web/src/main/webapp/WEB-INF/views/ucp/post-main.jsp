<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/common/baseTitle.jsp"%>
<html>

<head>
	<title>岗位管理</title>
	<%@ include file="/WEB-INF/views/common/baseJsCss.jsp"%>
	
</head>
<body class="easyui-layout" style="margin: 5px"> 
	<div data-options="region:'center',iconCls:'icon-metro-user',title:'岗位管理',split:true" style="width:80%;">
	<div id="tt" class="easyui-toolbar" style="height: 6%;margin-top: 15px">
       <span style="margin-left: 30px">组名称：</span>
       <input id="postName" type="text" value="" />
        <a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-search'" onclick="queryPostList()">查询</a>
        <a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-plus'" onclick="add()">新增</a>
        <a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-eye2'" onclick="view()">查看</a>
        <a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-console'" onclick="update()">编辑</a>
        <a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-wrench'">配置</a>
        <a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-close'" onclick="del()">删除</a>
    </div>
	<table id="postList"></table>
	</div>
	<div data-options="region:'west',iconCls:'icon-metro-tree',title:'机构树',split:true" style="width:20%;">
		<div id="orgTree" style="margin-top: 10px"/>
	</div> 
	
	<div id="dd"></div>  
</body>
<script type="text/javascript">
    $(function () {
    	loadOrgTree();
        queryPostList();
    });
    
    function loadOrgTree()
    {
    	$('#orgTree').tree({    
    		url:'${ctx}/org/loadOrgTree'   
		});
    };
    
    function queryPostList()
    {
    	$("#postList").datagrid({
            width: '100%',
            height: 550,
            method: "post",
            url: "${ctx}/post/list",
            queryParams: {"postName":$("#postName").val()},
            idField: 'groupId',           
            columns: [[
            	{ field: 'ck', checkbox: true },
                { field: 'postId', title: '岗位编号', width: '10%' , tooltip: true,sortable:true},
                { field: 'postName', title: '岗位名称', width: '10%' , tooltip: true,sortable:true},
                { field: 'orgId', title: '归属机构', width: '10%' , tooltip: true,sortable:true},
                { field: 'postStatus', title: '岗位状态', width: '10%' , tooltip: true,sortable:true,
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
                
                { field: 'postDesc', title: '岗位描述', width: '28%' , tooltip: true,sortable:true},               
                { field: 'createDate', title: '创建日期', width: '15%' ,sortable:true},
                { field: 'modifyDate', title: '修改时间', width: '15%' ,sortable:true}
            ]],            
       		pagination: true,
            remoteSort: false,
            rownumbers: true,
            singleSelect: true,           
        	onLoadSuccess : function(data){
				 if(data.total==0) 
				 {				 
					var tips = "<font color=red>没有数据....</font>";
					$('#postList').datagrid("insertRow",{index: 1,row:{postId : tips}} );
				 } 
			}
        
        });
    };
    
   function add()
    {
        var url = "${ctx}/post/add";    
    	$('#dd').dialog({    
    	title: '岗位新增',
    	iconCls: 'icon-metro-user',    
    	width: 600,    
    	height: 400,    
    	closed: false,    
    	cache: false,    
    	//href: 'get_content.php', 
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
    	var row = $("#postList").datagrid('getSelected');
        if (row == null || row.postId==null)
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
				url:ctx+"/post/del",
                type:"post",
                data: {"postId":row.post},
                dataType :"json",
                async:false,  
       			cache:false, 
               	success: function(data){  
               		if(data.msg =="success")
               		{
               			$("#postList").datagrid('reload');
               		}
           			

        		}
                                            
                });    
           } });    
             
                    		  
         }
                
    }
    
    function view()
    {
    	var row = $("#postList").datagrid('getSelected');
        if (row == null || row.postId==null)
        {
          $.messager.alert('提示信息', '请选择要查看的数据！', 'info');
           return false;
        }
        else 
        {    
            var url = "${ctx}/post/view?postId="+row.postId;        		  
         	                
            $('#dd').dialog({    
    		title: '岗位查看',    
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
    	var row = $("#postList").datagrid('getSelected');
        if (row == null || row.postId==null)
        {
          $.messager.alert('提示信息', '请选择要更改的数据！', 'info');
           return false;
        }
        else 
        {          		  
         	 var url = "${ctx}/post/update?postId="+row.postId;        		  
         	                
            $('#dd').dialog({    
    		title: '岗位编辑',    
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
    
  
</script>
