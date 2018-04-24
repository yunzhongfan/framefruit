 function queryOrgList()
    {
    	$("#orgList").treegrid({
           // title: '机构列表',
            width: '100%',
            height: 'auto',
            method: "post",
            url: ctx+"/org/list",
            queryParams: {"orgName":$("#orgName").val()},
            idField: 'id',
            treeField: 'text',
            animate: true,
            columns: [[
            	{ field: 'ck', checkbox: true },
                { field: 'id', title: '编号', width: 100 , tooltip: true,sortable:true},
                { field: 'text', title: '名称', width: 400 , tooltip: true,sortable:true},
                { field: 'status', title: '状态', width: 50 , tooltip: true,sortable:true,
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
                { field: 'parentId', title: '父级机构', width: 100 , tooltip: true,sortable:true,hidden:true},
                { field: 'createDate', title: '创建日期', width: 200 ,sortable:true},
                { field: 'modifyDate', title: '修改时间', width: 200 ,sortable:true}
            ]],
       		pagination: false,
            remoteSort: false,
            rownumbers: true,
            singleSelect: true
        });
    };
    
    function orgAdd()
    {
    	var url = ctx+"/org/add";    
    	$('#addOrgWindow').dialog({    
    	title: '机构新增',    
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
                    	//$('#addOrgWindow').dialog('close');
                    }
                }]  
		}); 
    };
    
    function orgDel()
    {
    	var row = $("#orgList").treegrid('getSelected');
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
				url:ctx+"/org/orgDelete",
                data: {"orgId":row.id},
                dataType :"json",
                async:false,  
       			cache:false, 
               	success: function(data){  
            		if(data.msg=="success"){
            			$("#orgList").treegrid('reload');
            		}
        		}
                                            
                });    
           } });    
             
                    		  
         }
                
    }
    
    function orgView()
    {
    	var row = $("#orgList").treegrid('getSelected');
        if (row == null || row.id==null)
        {
          $.messager.alert('提示信息', '请选择要查看的数据！', 'warning');
           return false;
        }else if(row.status != "1" && row.status != "2"){
        	$.messager.alert('提示信息', '选择的数据已删除！', 'warning');
            return false;
        }else {          		  
        	var url = ctx+"/org/view?orgId="+row.id;    
        	$('#addOrgWindow').dialog({    
        	title: '机构查看',    
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
                        	//$('#addOrgWindow').dialog('close');
                        }
                    }]  
    		}); 
                    		  
        }
    }
    
    function orgUpdate()
    {
    	var row = $("#orgList").treegrid('getSelected');
        if (row == null || row.id==null)
        {
          $.messager.alert('提示信息', '请选择要修改的数据！', 'warning');
           return false;
        }else if(row.status != "1" && row.status != "2"){
        	$.messager.alert('提示信息', '选择的数据已删除！', 'warning');
            return false;
        }else {          		  
        	var url = ctx+"/org/update?orgId="+row.id;    
        	$('#addOrgWindow').dialog({    
        	title: '机构修改',    
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
                        	//$('#addOrgWindow').dialog('close');
                        }
                    }]  
    		}); 
                    		  
        }
    }