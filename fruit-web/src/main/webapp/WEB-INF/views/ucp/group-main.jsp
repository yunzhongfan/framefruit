<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/common/baseTitle.jsp"%>
<html>

<head>
	<title>工作组管理</title>
	<%@ include file="/WEB-INF/views/common/baseJsCss.jsp"%>
	
</head>
<body>
	<div id="p" class="easyui-panel" title="工作组管理">
	<div id="tt" class="easyui-toolbar" >
       <span style="margin-left: 30px">组名称：</span>
       <input id="groupName" type="text" value="" />
        <a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-search'" onclick="queryWorkGroupList()">查询</a>
        <a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-plus'" onclick="add()">新增</a>
        <a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-eye2'" onclick="view()">查看</a>
        <a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-console'" onclick="update()">编辑</a>
        <a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-wrench'">配置</a>
        <a class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-metro-close'" onclick="del()">删除</a>
    </div>
	<table id="groupList"></table>
	</div>
	<div id="dd"></div>
</body>
<script type="text/javascript">
    $(function () {
        queryWorkGroupList();
    });
    
    function queryWorkGroupList()
    {
    	console.info($("#groupName").val());
    	$("#groupList").datagrid({
            width: '100%',
            height: 550,
            method: "post",
            url: "${ctx}/group/list",
            queryParams: {"groupName":$("#groupName").val()},
            idField: 'groupId',           
            columns: [[
            	{ field: 'ck', checkbox: true },
                { field: 'groupId', title: '组编号', width: '10%' , tooltip: true,sortable:true},
                { field: 'groupName', title: '组名称', width: '10%' , tooltip: true,sortable:true},
                { field: 'groupStatus', title: '组状态', width: '10%' , tooltip: true,sortable:true,
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
                
                { field: 'groupDesc', title: '组描述', width: '30%' , tooltip: true,sortable:true},               
                { field: 'createDate', title: '创建日期', width: '18%' ,sortable:true,
                	formatter: function(value,row,index){
                		if(value!=null&&value!=""){
                			return dateFmort(value,row,index);
                		}
        			}
                },
                { field: 'modifyDate', title: '修改时间', width: '18%' ,sortable:true,
                	formatter: function(value,row,index){
                		if(value!=null&&value!=""){
                			return dateFmort(value,row,index);
                		}
        			}
                }
            ]],            
       		pagination: true,
            remoteSort: false,
            rownumbers: true,
            singleSelect: true,           
        	onLoadSuccess : function(data){
				/*  if(data.total==0) 
				 {		
				//	 $.messager.alert('警告','没有数据....'); 
				 	var tips = "<font color=red>没有数据....</font>";
					$('#groupList').datagrid("insertRow",{index: 1,row:{groupId : tips}} ); 
				 }  */
			}
        
        });
    };
    
    
    function dateFmort(value,row,index){ 
	   	var formdate;
	      if(value!=null){
	    	 // value =  value.replace(/-/g,"/");
	    	// console.info(value.format("yyyy-MM-dd"));
	 /*    	  var converted = Date.parse(value);
	    	  console.info(converted.format("yyyy-MM-dd")); */
	    	   var myDate = new Date(value);
	    	  console.info(myDate);
	    	   var year=myDate.getFullYear();
	    	   var month=myDate.getMonth()+1;
	    	   var day=myDate.getDate();
	    	   if(month<10){
	    		  month="0"+month;
	    	   }
	    	   if(day<10){
	    		   day="0"+day;
	    	   }
	    	formdate = year+"-"+ month +"-"+day;
	      }
	      return formdate; 
} 
   
     function add()
    {
        var url = "${ctx}/group/add";    
    	$('#dd').dialog({    
    	title: '工作组新增',
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
    	var row = $("#groupList").datagrid('getSelected');
        if (row == null || row.groupId==null)
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
				url:ctx+"/group/del",
                data: {"groupId":row.groupId},
                dataType :"json",
                async:false,  
       			cache:false, 
               	success: function(data){  
               		if(data.msg =="success")
               		{
               			$("#groupList").datagrid('reload');
               		}
           			

        		}
                                            
                });    
           } });    
             
                    		  
         }
                
    }
    
    function view()
    {
    	var row = $("#groupList").datagrid('getSelected');
        if (row == null || row.groupId==null)
        {
          $.messager.alert('提示信息', '请选择要查看的数据！', 'info');
           return false;
        }
        else 
        {    
            var url = "${ctx}/group/view?groupId="+row.groupId;        		  
         	                
            $('#dd').dialog({    
    		title: '工作组查看',    
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
    	var row = $("#groupList").datagrid('getSelected');
        if (row == null || row.groupId==null)
        {
          $.messager.alert('提示信息', '请选择要更改的数据！', 'info');
           return false;
        }
        else 
        {          		  
         	var url = "${ctx}/group/update?groupId="+row.groupId;        		  
            $('#dd').dialog({    
    		title: '工作组编辑',    
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
