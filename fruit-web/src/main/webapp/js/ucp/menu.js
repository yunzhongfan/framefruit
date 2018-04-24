function queryMenuList(){
	$("#menuList").treegrid({
        // title: '菜单列表',
         width: '100%',
         height: 'auto',
         method: "post",
         url: ctx+"/menu/list",
         queryParams: {},
         idField: 'id',
         treeField: 'text',
         animate: true,
         columns: [[
         	{ field: 'ck', checkbox: true },
             { field: 'id', title: '编号', width: '10%' , tooltip: true,sortable:true},
             { field: 'text', title: '名称', width: '15%' , tooltip: true,sortable:true},
             { field: 'type', title: '类型', width: '8%' , tooltip: true,sortable:true,
              	formatter: function(value,row,index)
              	{
 						if (value == "1")
 						{
 							return "菜单";
 						} 
 						else if(value == "2")
 						{
 							return "按钮";
 						}else {
 							return "";
 						}
 					}
              },
             { field: 'status', title: '状态', width: '10%' , tooltip: true,sortable:true,
             	formatter: function(value,row,index)
             	{
						if (value == "1")
						{
							return "正常";
						} 
						else if(value == "2")
						{							return "停用";
						}else {
							return "删除";
						}
					}
             },
             { field: 'url', title: '路径', width: '25%' , tooltip: true,sortable:true},
             { field: 'parentId', title: '父级机构', width: '10%', tooltip: true,sortable:true,hidden:true},
             { field: 'createDate', title: '创建日期', width: '15%' ,sortable:true},
             { field: 'modifyDate', title: '修改时间', width: '15%' ,sortable:true}
         ]],
    		pagination: false,
         remoteSort: false,
         rownumbers: true,
         singleSelect: true
     });
}

function menuAdd(){
	var url = ctx+"/menu/add";    
	$('#addMenuWindow').dialog({    
	title: '菜单新增',    
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
                	//save();
                }
            },{
                text:'取消',
                iconCls:'icon-cancel',
                handler:function(){
                	//cancel();
                	window.frames["open-page"].window.cancel();
                }
            }]  
	}); 
}

function menuDel(){
	var row = $("#menuList").treegrid('getSelected');
    if (row == null || row.id==null){
      $.messager.alert('提示信息', '请选择要删除的数据！', 'warning');
       return false;
    }else if(row.status != "1" && row.status != "2"){
    	$.messager.alert('提示信息', '选择的数据已删除！', 'warning');
        return false;
    }else{          		  
      $.messager.confirm("提示信息","确认要删除选中的信息，及所属子级？",function (c) { 
      if (c){    
		$.ajax({  
			type: "POST",
			url:ctx+"/menu/menuDelete",
            data: {"menuId":row.id},
            dataType :"json",
            async:false,  
   			cache:false, 
           	success: function(data){  
        		if(data.msg=="success"){
        			$("#menuList").treegrid('reload');
        		}
    		}
                                        
            });    
       } });    
         
                		  
     }
}

function menuView(){
	var row = $("#menuList").treegrid('getSelected');
    if (row == null || row.id==null)
    {
      $.messager.alert('提示信息', '请选择要查看的数据！', 'warning');
       return false;
    }else if(row.status != "1" && row.status != "2"){
    	$.messager.alert('提示信息', '选择的数据已删除！', 'warning');
        return false;
    }else {          		  
    	var url = ctx+"/menu/view?menuId="+row.id;    
    	$('#addMenuWindow').dialog({    
    	title: '菜单查看',    
    	width: 600,    
    	height: 400,    
    	closed: false,    
    	cache: false,    
    	//href: 'get_content.php', 
    	content: '<iframe name="open-page" scrolling="auto" frameborder="0" src="' + url + '" style="width:100%;height:100%;"></iframe>',   
    	modal: true ,
        buttons: [{
                    text:'返回',
                    iconCls:'icon-cancel',
                    handler:function(){
                    	//cancel();
                    	window.frames["open-page"].window.cancel();
                    }
                }]  
		}); 
                		  
    }
}

function menuUpdate(){
	var row = $("#menuList").treegrid('getSelected');
    if (row == null || row.id==null)
    {
      $.messager.alert('提示信息', '请选择要修改的数据！', 'warning');
       return false;
    }else if(row.status != "1" && row.status != "2"){
    	$.messager.alert('提示信息', '选择的数据已删除！', 'warning');
        return false;
    }else {          		  
    	var url = ctx+"/menu/update?menuId="+row.id;    
    	$('#addMenuWindow').dialog({    
    	title: '菜单修改',    
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
	                	window.frames["open-page"].window.update();
	                	//save();
	                }
	            },{
                    text:'返回',
                    iconCls:'icon-cancel',
                    handler:function(){
                    	//cancel();
                    	window.frames["open-page"].window.cancel();
                    }
                }]  
		}); 
                		  
    }
}
