<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/common/baseTitle.jsp"%>
<html>

<head>
	<title>人员信息管理</title>
	<%@ include file="/WEB-INF/views/common/baseJsCss.jsp"%>
	
</head>

<body class="easyui-layout"> 

	<div data-options="region:'center',iconCls:'icon-metro-user',title:'人员信息管理',split:true" >
			<div id="tt" class="easyui-toolbar" style="height: 6%;vertical-align:middle;margin-top: 15px">
			<input id="regionId" type="hidden" value=""  />
			<span style="margin-left: 30px">用户工号：</span>
      	 	<input id="staffNo" type="text" value="" style="margin-left: 2px; margin-right: 2px; padding-left: 2px; padding-right: 3px;" />
       		<span style="margin-left: 30px">用户姓名：</span>
      	 	<input id="staffName" type="text" value="" style="margin-left: 2px; margin-right: 2px; padding-left: 2px; padding-right: 3px;" />
        	<a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-search'" onclick="queryStaffList()">查询</a>
        	<a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-plus'" onclick="add()">新增</a>
        	<a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-eye2'" onclick="view()">查看</a>
        	<a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-console'" onclick="update()">编辑</a>
        	<a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-wrench'" id="cz"></a>
        	<a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-close'" onclick="del()">删除</a>
    		</div>
			<table id="regionList"></table>
	</div> 
	<div data-options="region:'west',iconCls:'icon-metro-tree',title:'机构树',split:true,collapsible:true" style="width: 20%;">
		<div id="orgTree" style="margin-top: 10px"/>
	</div> 
	
	<div id="dd"></div>  
	
	
</body>
<script type="text/javascript">
    $(function () {
    	loadRegionTree();
        queryRegionList();
        
    });
    
    
    function loadRegionTree()
    {
    	$('#orgTree').tree({    
    		url:'${ctx}/region/loadRegionTree',
    		onDblClick:function(node){
    			debugger
    			$("#regionId").val(node.id);
    			queryRegionList();
    		}
		});
    }
    
    function queryRegionList()
    {
    	$("#regionList").datagrid({
           // title: '人员列表',
            width: '100%',
            height: 'auto',
            method: "post",
            url: "${ctx}/region/list",
            queryParams: {"regionId":$("#regionId").val()},
            columns: [[
            	{ field: 'ck', checkbox: true },
                { field: 'region_id', title: '工号', width: '10%' , tooltip: true,sortable:true},
                { field: 'parent_id', title: '名称', width: '10%' , tooltip: true,sortable:true},
                { field: 'region_name', title: '性别', width: '5%' , tooltip: true,sortable:true},
                { field: 'region_level', title: '人员状态', width: '8%' , tooltip: true,sortable:true},                	
                { field: 'is_leaf', title: '机构编码', width: '10%' , tooltip: true,sortable:true}
               
            ]],            
       		pagination: true,
            remoteSort: false,
            rownumbers: true,
            singleSelect: true,           
            onLoadSuccess : function(data) {
				 if (data.total == 0) {
					var tips = "<font color=red>没有数据....</font>";
					$('#staffList').datagrid( "insertRow", {index: 1,row:{regionId : tips}} );
				}  
			}
        	
        });
    };
    
    function add()
    {
        var url = "${ctx}/staff/add";
        showTopDialog("人员新增", url, "save");
    	/* parent.$('#common_window').dialog({     
    	title: '人员新增',
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
                    	window.parent.frames["open-page"].window.save();                      
                    }
                },{
                    text:'取消',
                    iconCls:'icon-cancel',
                    handler:function(){
                    	parent.$('#common_window').dialog('close');
                    }
                }]  
		});   */       
    };
    
    function del()
    {
    	var row = $("#staffList").datagrid('getSelected');
        if (row == null || row.staffId==null)
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
				url:ctx+"/staff/del",
                type:"post",
                data: {"staffId":row.staffId},
                dataType :"json",
                async:false,  
       			cache:false, 
               	success: function(data){  
               		if(data.msg =="success")
               		{
               			$("#staffList").datagrid('reload');
               		}
           			

        		}
                                            
                });    
           } });    
             
                    		  
         }
                
    }
    
    function view()
    {
    	var row = $("#staffList").datagrid('getSelected');
        if (row == null || row.staffId==null)
        {
          $.messager.alert('提示信息', '请选择要查看的数据！', 'info');
           return false;
        }
        else 
        {    
            var url = "${ctx}/staff/view?staffId="+row.staffId;        		  
         	
            showTopDialog("人员新增",url,"view");
           /*  $('#dd').dialog({    
    		title: '人员查看',    
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
			});   */         
                    		  
        }
    }
    
    function update()
    {
    	var row = $("#staffList").datagrid('getSelected');
        if (row == null || row.staffId==null)
        {
          $.messager.alert('提示信息', '请选择要更改的数据！', 'info');
           return false;
        }
        else 
        {          		  
         	 var url = "${ctx}/staff/update?staffId="+row.staffId;        		  
         	 
         	 showTopDialog("人员修改",url,"update");
            /* $('#dd').dialog({    
    		title: '人员编辑',    
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
			});      */      
                    		  
        }
    }
     $(function(){
    	$("#cz").menubutton({
    		text:"配置",
    		iconCls:"icon-metro-wrench",
    		menu:"#mm"
    			
    	});
    }) 
    
    function staff_role()
    {
     	var row = $("#staffList").datagrid('getSelected');
        if (row == null || row.staffId==null)
        {
          $.messager.alert('提示信息', '请选择用户！', 'info');
           return false;
        }else{
        	var url = "${ctx}/staff/box?staffId="+row.staffId;
        	showTopDialog("用户绑定角色",url,"save",700,550);
           /*   parent.$('#common_window').dialog({    
     		title: '用户绑定角色',    
     		width: 700,    
     		height: 550,    
     		closed: false,    
     		cache: false,    
     		content: '<iframe id="open-page" name="open-page" scrolling="auto" frameborder="0" src="' + url + '" style="width:100%;height:100%;"></iframe>',   
     		modal: true ,
     		buttons: [ {
                     text:'保存',
                     iconCls:'icon-save',
                     handler:function(){
                    	 window.frames["open-page"].window.save();
                     }
                 }, {
                     text:'取消',
                     iconCls:'icon-cancel',
                     handler:function(){
                    	 parent.$('#common_window').dialog('close');
                     }
                 }]  
 			});  */
        }
    };
    
     
</script>
