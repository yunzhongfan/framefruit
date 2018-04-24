<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/common/baseTitle.jsp"%>
<html>

<head>
	<title>人员信息管理</title>
	<%@ include file="/WEB-INF/views/common/baseJsCss.jsp"%>
	
</head>

<body class="easyui-layout" style="margin: 5px"> 

	<div data-options="region:'center',iconCls:'icon-metro-user',title:'人员信息管理',split:true" >
			<div id="tt" class="easyui-toolbar" style="height: 6%;vertical-align:middle;margin-top: 15px">
			<input id="orgId" type="hidden" value=""  />
			<span style="margin-left: 30px">用户工号：</span>
      	 	<input id="staffNo" type="text" value="" style="margin-left: 2px; margin-right: 2px; padding-left: 2px; padding-right: 3px;" />
       		<span style="margin-left: 30px">用户姓名：</span>
      	 	<input id="staffName" type="text" value="" style="margin-left: 2px; margin-right: 2px; padding-left: 2px; padding-right: 3px;" />
        	
        	<div style="float: right;">
  			<a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-search'" onclick="queryStaffList()">查询</a>
        	<a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-plus'" onclick="add()">新增</a>
        	<a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-eye2'" onclick="view()">查看</a>
        	<a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-console'" onclick="update()">编辑</a>
        	<a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-wrench'" id="cz"></a>
        	<a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-close'" onclick="del()">删除</a>
			</div>
    		</div>
			<table id="staffList"></table>
	</div> 
	<div data-options="region:'west',iconCls:'icon-metro-tree',title:'机构树',split:true,collapsible:true" style="width: 20%;">
		<div id="orgTree" style="margin-top: 10px"/>
	</div> 
	
	
	<div id="mm" style="width:100px">   
		<div data-options="iconCls:'icon-metro-wrench'" onclick="staff_role()">用户绑定角色</div>    			     
	</div>   
	
</body>
<script type="text/javascript">
    $(function () {
    	loadOrgTree();
        queryStaffList();
        
    });
    
    
    function loadOrgTree()
    {
    	$('#orgTree').tree({    
    		url:'${ctx}/org/loadOrgTree',
    		onDblClick:function(node){
    			debugger
    			$("#orgId").val(node.id);
    			queryStaffList();
    		}
		});
    }
    
    function queryStaffList()
    {
    	$("#staffList").datagrid({
           // title: '人员列表',
            width: '100%',
            height: 'auto',
            method: "post",
            url: "${ctx}/staff/list",
            queryParams: {"staffNo":$("#staffNo").val(),"staffName":$("#staffName").val(),"orgId":$("#orgId").val()},
            //idField: 'staffId',           
            columns: [[
            	{ field: 'ck', checkbox: true },
                { field: 'staffId', title: '工号', width: '10%' , tooltip: true,sortable:true},
                { field: 'staffName', title: '名称', width: '10%' , tooltip: true,sortable:true},
                { field: 'sex', title: '性别', width: '5%' , tooltip: true,sortable:true,
                	formatter: function(value,row,index)
                	{
						if (value == "1")
						{
							return "男";
						} 
						else if(value == "2") 
						{
							return "女";
						}
					}
                },
                { field: 'staffStatus', title: '人员状态', width: '8%' , tooltip: true,sortable:true,
                	formatter: function(value,row,index)
                	{
						if (value == "1")
						{
							return "正常";
						} 
						else if (value == "2") 
						{
							return "暂停";
						}
						else if(value == "3")
						{
							return "删除";
						}
					}
                },
                { field: 'orgId', title: '机构编码', width: '10%' , tooltip: true,sortable:true},
                { field: 'orgName', title: '机构名称', width: '15%' , tooltip: true,sortable:true},
                { field: 'phone', title: '电话号码', width: '10%' , tooltip: true,sortable:true},
                { field: 'createDate', title: '创建日期', width: '15%' ,sortable:true},
                { field: 'modifyDate', title: '修改时间', width: '15%' ,sortable:true}
            ]],            
       		pagination: true,
            remoteSort: false,
            rownumbers: true,
            singleSelect: true,
           enableHeaderClickMenu: true,
            enableHeaderContextMenu: true,
            enableRowContextMenu: true,
            rowTooltip: true ,          
            onLoadSuccess : function(data) {
				 if (data.total == 0) {
					var tips = "<font color=red>没有数据....</font>";
					$('#staffList').datagrid( "insertRow", {index: 1,row:{staffId : tips}} );
				}  
			}
        	
        });
    };
    
    function add()
    {
        var url = "${ctx}/staff/add";
        showMessageDialog(url,"人员新增",600,400);
       
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
         	
           
           showMessageDialog(url,"人员",600,400);
                    		  
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
         	 
         	 showMessageDialog(url,"人员修改",600,400);
           
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
        	
        	showMessageDialog(url,"用户绑定角色",750,500);
          
        }
    };
    
     
</script>
