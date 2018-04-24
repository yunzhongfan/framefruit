<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/common/baseTitle.jsp"%>
<html>

<head>
	<title>参数管理</title>
	<%@ include file="/WEB-INF/views/common/baseJsCss.jsp"%>
	
</head>

<body class="easyui-layout" style="margin: 5px"> 

	<div data-options="region:'center',iconCls:'icon-metro-user',title:'参数管理',split:true" >
			<div id="tt" class="easyui-toolbar" style="height: 6%;vertical-align:middle;margin-top: 15px">
			<input id="test" type="hidden" value="">
			<span style="margin-left: 30px">参数编号：</span>
      	 	<input id="dictId" type="text" value="" style="margin-left: 2px; margin-right: 2px; padding-left: 2px; padding-right: 3px;" />
       		<span style="margin-left: 30px">参数名称：</span>
       		<input id="dictName" type="text" value="" style="margin-left: 2px; margin-right: 2px; padding-left: 2px; padding-right: 3px;" />
       		<a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-search'" onclick="queryDictList()">查询</a>
            <a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-plus'" onclick="dictAdd()">新增</a>
            <a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-eye2'" onclick="dictView()">查看</a>
            <a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-console'" onclick="dictUpdate()">编辑</a>
            <a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-close'" onclick="dictDel()">删除</a>
    		</div>
			<table id="dictList"></table>
	</div> 
	<div data-options="region:'west',iconCls:'icon-metro-tree',title:'系统参数树',split:true,collapsible:true" style="width: 20%;">
		<div id="dictTree" style="margin-top: 10px"/>
	</div> 
	<div id="addOrgWindow"></div>  
</body>
<script type="text/javascript">
   $(function(){
	   loadDictTree();
	   queryDictList();
   })
   
    function loadDictTree()
    {
    	$('#dictTree').tree({    
    		url:'${ctx}/dict/loadDictTree',
    		onDblClick:function(node){
    			debugger
    			$("#test").val(node.id);
    			queryDictList();
    		}
		});
    }
   
/*    function queryDictList(){
   	$("#dictList").treegrid({
         width: '100%',
         height: 550,
         method: "post",
         url: ctx+"/dict/list",
         queryParams: {"dictName":$("#dictName").val()},
         idField: 'id',
         treeField: 'text',
         animate: true,
         columns: [[
         	{ field: 'ck', checkbox: true },
             { field: 'id', title: '参数编号', width: 100 , tooltip: true,sortable:true},
             { field: 'text', title: '参数名称', width: 250 , tooltip: true,sortable:true},
             { field: 'status', title: '参数状态', width: 70 , tooltip: true,sortable:true,
             	formatter: function(value,row,index)
             	{
						if (value == "1")
						{
							return "正常";
						} 
						else if(value == "2")
						{
							return "停用";
						}else {
							return "删除";
						}
					}
             },
             { field: 'type', title: '参数类型', width: 150 ,sortable:true,
              	formatter: function(value,row,index)
             	{
						if (value == "1")
						{
							return "系统参数";
						} 
						else if(value == "2")
						{
							return "基础参数";
						}else (value == "3")
						{
							return "业务参数";
						}
					}	 
             },
             { field: 'prarentId', title: '父级参数', width: 100 , tooltip: true,sortable:true,hidden:true},
             { field: 'createDate', title: '创建日期', width: 200 ,sortable:true},
             { field: 'modifyDate', title: '修改时间', width: 200 ,sortable:true}
         ]],
    	 pagination: false,
         remoteSort: false,
         rownumbers: true,
         singleSelect: true
     });
   } */
   
   function queryDictList()
   {
   	$("#dictList").datagrid({
         width: '100%',
         height: 580,
         method: "post",
         url: "${ctx}/dict/list",
         queryParams: {"dictId":$("#dictId").val(),"dictName":$("#dictName").val(),"test":$("#test").val()},        
         columns: [[
                 	{ field: 'ck', checkbox: true },
                     { field: 'dict_id', title: '参数编号', width: 100 , tooltip: true,sortable:true},
                     { field: 'dict_name', title: '参数名称', width: 250 , tooltip: true,sortable:true},
                     { field: 'dict_status', title: '参数状态', width: 70 , tooltip: true,sortable:true,
                     	formatter: function(value,row,index)
                     	{
        						if (value == "1")
        						{
        							return "正常";
        						} 
        						else if(value == "2")
        						{
        							return "停用";
        						}else {
        							return "删除";
        						}
        					}
                     },
                     { field: 'dict_type', title: '参数类型', width: 150 ,sortable:true,
                      	formatter: function(value,row,index)
                     	{
        						if (value == "1")
        						{
        							return "系统参数";
        						} 
        						else if(value == "2")
        						{
        							return "基础参数";
        						}else (value == "3")
        						{
        							return "业务参数";
        						}
        					}	 
                     },
                     { field: 'prarent_id', title: '父级参数', width: 100 , tooltip: true,sortable:true,hidden:true},
                     { field: 'createDate', title: '创建日期', width: 200 ,sortable:true},
                     { field: 'modifyDate', title: '修改时间', width: 200 ,sortable:true}
                 ]],          
    	 pagination: true,
         remoteSort: false,
         rownumbers: true,
         singleSelect: true,           
         onLoadSuccess : function(data) {
				 if (data.total == 0) {
					var tips = "<font color=red>没有数据....</font>";
					$('#staffList').datagrid( "insertRow", {index: 1,row:{staffId : tips}} );
				}  
			}
     	
     });
   }
   
   
   function dictAdd()
   {
   	var url = ctx+"/dict/add";    
   	$('#addOrgWindow').dialog({    
   	title: '参数新增',    
   	width: 600,    
   	height: 400,    
   	closed: false,    
   	cache: false,    
   	//href: 'get_content.php', 
   	content: '<iframe name="open-page" scrolling="auto" frameborder="0" src="' + url + '" style="width:100%;height:100%;"></iframe>',   
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
        	 $('#addOrgWindow').dialog('close');
        }
           }]  
		}); 
   };
   
   function dictView()
   {
   	var row = $("#dictList").datagrid('getSelected');
       if (row == null || row.dict_id==null)
       {
         $.messager.alert('提示信息', '请选择要查看的数据！', 'info');
          return false;
       }
       else 
       {    
           var url = "${ctx}/dict/view?dictId="+row.dict_id;        		  
        	                
        $('#addOrgWindow').dialog({    
   		title: '参数查看',    
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
                   	$('#addOrgWindow').dialog('close');
                   }
               }]  
			});           
                   		  
       }
   }
   
   function dictUpdate()
   {
   	var row = $("#dictList").datagrid('getSelected');
       if (row == null || row.dict_id==null)
       {
         $.messager.alert('提示信息', '请选择要更改的数据！', 'info');
          return false;
       }
       else 
       {          		  
        	 var url = "${ctx}/dict/update?dictId="+row.dict_id;        		  
        	                
        $('#addOrgWindow').dialog({    
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
                   	$('#addOrgWindow').dialog('close');
                   }
               }]  
			});           
                   		  
       }
   }
   
   function dictDel()
   {
   	var row = $("#dictList").datagrid('getSelected');
       if (row == null || row.dict_id==null)
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
				url:ctx+"/dict/del",
               type:"post",
               data: {"dictId":row.dict_id},
               dataType :"json",
               async:false,  
      			cache:false, 
              	success: function(data){  
              		if(data.msg =="success")
              		{
              			$("#dictList").datagrid('reload');
              			$("#dictTree").tree('reload');
              		}else if(data.msg=="false"){
              			$.messager.alert('提示信息', '该参数有下级参数不能删除！', 'info');
              		}
          			

       		}
                                           
               });    
          } });    
            
                   		  
        }
               
   }
</script>
