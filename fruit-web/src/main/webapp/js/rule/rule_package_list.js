var selectRulePackageId;

function findRulePageList(node){
	findMenuPageList(node);
	$('#rule_list').datagrid({
	    url :ctx+"/rule/findRuleIndByID",
	    queryParams : {
	    	"package_id" : node.id
		},
	    title : '规则包列表',
	    fitColumns : true,
	    pageSize : 10,
	    columns : [[
	     {field : "package_id", title : "包ID", width : 200, sortable : true, hidden : true},
	     {field : "package_name", title : "规则包名", width : 200, sortable : true, align:"left"}, 
	     {field : "package_desc", title : "规则包描述", width : 200, sortable : true,align:"left",halign:"center"}
	     ]],
	     toolbar:[ 	                                               
	     { 
	    	text:'新增',
				iconCls:'icon-metro-plus',
				handler:function(){
					addRulePackage();
				}
	     },
	     {
		     text:'修改',
		     iconCls:'icon-metro-console',
		     handler:function(){
		    	 if (node == null || node.id==null){
		    		 $.messager.alert('提示信息', '请选择要修改的数据！', 'warning');
		    		 return false;
		    	 }
		    	 var url = ctx+"/rule/toUpdateRulePackage?package_id="+encodeURI(encodeURI(node.id));
		    	 showMessageWindow(url,"修改规则包",900,400);
              }
	      },
	      {
	    	  text : '删除',
	    	  iconCls : 'icon-metro-close',
	    	  handler : function(){
            	var row = $('#rule_list').datagrid('getSelected');
 				if (row){
 					var index = $('#rule_list').datagrid('getRowIndex', row);
 					deleRulePackage(index);
 				}  
	    	  }
	   }],
	   onLoadSuccess : function(data){
		   if (data.total == 0) {
				var tips = "<font color=red>没有数据....</font>";
				$('#rule_list').datagrid("insertRow", {
					index : 1,
					row : {
						LIST_ID : tips
					}
				});
			}else{
				$('#rule_list').datagrid("selectRow", 0);
			}
	   }  
	})	
}

function findMenuPageList(node)
	{
		//var menuName = $("#menuName").val();
		$('#menu_list').datagrid({
			url:ctx +"/rule/findSelectedIndList",
			title : '规则指标列表',
			fitColumns : true,
			queryParams : {
	    		"package_id" : node.id
	    	},
		    columns : [[
				{field : "rating_id", title : "指标ID", width : 200, sortable : true, hidden : true},
				{field : "ind_id", title : "指标代码", width : 200, sortable : true, align:"center"}, 
				{field : "ind_name", title : "指标名称", width : 200, sortable : true,align:"left",halign:"center"},
				{field : "is_main", title : "是否关键", width : 200,sortable : true,align:"center",
					 formatter : function(v, row) {
						if (v == '0')
							return '非关键';
						else if (v == '1')
							return '关键';
					 }},
				{field : "status", title : "状态", width : 200,sortable : true,align:"center",
					 formatter : function(v, row) {
						if (v == '0')
							return '<font color="green">激活</font>';
						else if (v == '1')
							return '<font color="red">作废</font>';
					 }},
			    {field : "description", title : "指标描述", width : 200,sortable : true,align:"center"},
				{field : "rule_content", title : "规则内容", width : 200, sortable : true, hidden : true} 
				]],
	            toolbar :[
               {
  	             text:'查看',
  	             iconCls:'icon-search',
  	             handler:function(){
  			            	var select_Row = $('#menu_list').datagrid('getSelections');
  			  				if(select_Row.length==0){
  			 					$.messager.alert("提示信息","请先至少选择一条信息进行操作!","warning");
  			 				}else{
  			 					var row = $('#menu_list').datagrid('getSelected');
  			 	 				if (row){
  			 	 					showMessageWindow(ctx + "/rule/toSearchIndWindow?rating_id="+encodeURI(encodeURI(row.rating_id)), "修改指标", 1000, 550);
  			 	 				}
  			 				}
  			             }
  	             },                                 
	             { 
	                  text : '新增',
	                  iconCls : 'icon-add',
	                  handler : function(){
		      	 			addRatingInd(node);
	                  }
	             },
	             {
	             text:'修改',
	             iconCls:'icon-edit',
	             handler:function(){
			            	var select_Row = $('#menu_list').datagrid('getSelections');
			  				if(select_Row.length==0){
			 					$.messager.alert("提示信息","请先至少选择一条信息进行操作!","warning");
			 				}else{
			 					var row = $('#menu_list').datagrid('getSelected');
			 	 				if (row){
			 	 					if(row.status!='0'){
			 	 						$.messager.alert('规则内容',"规则内容未激活！",'info');
			 	 						return;
			 	 					}
			 	 					showMessageWindow(ctx + "/rule/toUpdateIndWindow?rating_id="+encodeURI(encodeURI(row.rating_id)), "修改指标", 1000, 550);
			 	 				}
			 				}
			             }
	                },
	               {
	         			text:'激活',
	         			iconCls:'icon-ok',
	         			handler:function(){
	         				var select_Row = $('#menu_list').datagrid('getSelections');
	         				if(select_Row.length==0){
	        					$.messager.alert("提示信息","请先至少选择一条信息进行操作!","warning");
	        				}else{
	        					var row = $('#menu_list').datagrid('getSelected');
	        	 				if (row){
	        	 					var index = $('#menu_list').datagrid('getRowIndex', row);
	        	 					activate(index);
	        	 				}
	        				}
	         			}
	         		},{
	         			text:'禁用',
	         			iconCls:'icon-no',
	         			handler:function(){
	         				var select_Row = $('#menu_list').datagrid('getSelections');
	         				if(select_Row.length==0){
	        					$.messager.alert("提示信息","请先至少选择一条信息进行操作!","warning");
	        				}else{
	        					var row = $('#menu_list').datagrid('getSelected');
	        	 				if (row){
	        	 					var index = $('#menu_list').datagrid('getRowIndex', row);
	        	 					cancellation(index);
	        	 				}
	        				}
	         			}
	         		}]
	    	});
		
}

//添加规则包
function addRulePackage(){
	showMessageWindow(ctx+"/rule/toAddRuleAndRatingind", "新增规则包", 1000, 550);
	
}

//添加规则指标
function addRatingInd(node){
	showMessageWindow(ctx+"/rule/toAllocationInd?package_id="+encodeURI(encodeURI(node.id)), "指标分配",1000, 550);
}

//刷新当前页面
function reloadTab()
{
	$('#menu_list').treegrid('reload');
	$('#role_list').treegrid('reload');
}

function selectId(node){
	selectRulePackageId=node;
}

//刷新右边指标
function reloadRight(){
	findMenuPageList(selectRulePackageId);
}

//刷新右边规则包
function reloadRightRule(){
	findRulePageList(selectRulePackageId);
}

//刷新左边数
function reloadLeft(){
	$('#orgtree').tree({
		url:ctx+"/rule/loadOrgTree",
		animate:true,
		checkbox:false,
		lines:true,
		dnd:false,
		onClick:function(node){
			$(this).tree(node.state === 'closed' ? 'expand' : 'collapse', node.target);  
		    node.state = node.state === 'closed' ? 'open' : 'closed'; 
		    selectId(node);
		    findRulePageList(node);
		},
		onLoadSuccess:function(){
			$(this).find('span.tree-checkbox').unbind().click(function(){
			return false;
			});
		},
		 onContextMenu:function(e,row) { //右键时触发事件
	         e.preventDefault();
	         $(this).tree('select',row.target);
	         $('#rightMenu').menu('show', {
	             //显示右键功能
	             left: e.pageX,
	             top: e.pageY
	         });
	     }
		});
}

//删除规则包
function deleRulePackage(obj){
	if(obj === null || obj === undefined || obj === "") return;
	$.messager.confirm('删除规则包', '确定要删除选中规则包？', function(data) {
		if (!data) {
			return false;
		}else{
			$.messager.progress({title: '删除规则包', msg: '请稍候，正在删除数据...', interval: 500});
			var row= $('#rule_list').datagrid("getRows");
			var package_id= row[obj].package_id;
			if(package_id ==='undefined' || package_id === '' || package_id === null){
		    	$.messager.alert("警告", "没有数据", "warning");
		    	return;
		    }
			$.ajax({
	            url : ctx + "/rule/deleteRulePackage",
	            data : {
	            	"package_id" : package_id
	            },
	            type : 'POST',
	            success : function(msg) {
	            	$.messager.progress('close');
            		reloadLeft();
            		var node={};
            		node.id="";
            		findRulePageList(node);
	                $.messager.alert('规则删除',"已成功删除该规则包！");
	                
	            },
	            error:function(){
	            	$.messager.progress('close');
	            	$.messager.alert('错误','删除规则包出错，请联系管理员！','error');
	            }
	        });
		}
	});
	
}

//激活指标
function activate(obj){
	if(obj === null || obj === undefined || obj === "") return;
	var row= $('#menu_list').datagrid("getRows");
	if(row[obj].status=="0"){
		$.messager.alert('规则激活',"该规则已激活！",'info');
		return;
	}
	$.messager.confirm('激活规则指标', '确定要激活选中指标？', function(data) {
		if (!data) {
			return false;
		}else{
			$.messager.progress({title: '激活指标', msg: '请稍候，正在激活数据...', interval: 500});
			var row= $('#menu_list').datagrid("getRows");
			var ind_id= row[obj].ind_id;
			if(ind_id ==='undefined' || ind_id === '' || ind_id === null){
		    	$.messager.alert("警告", "没有数据", "warning");
		    	return;
		    }
			$.ajax({
	            url : ctx + "/rule/activateRulePackageInd",
	            data : {
	            	"package_id" : selectRulePackageId.id,
	            	"ind_id" : ind_id
	            },
	            type : 'POST',
	            success : function(msg) {
	            	$.messager.progress('close');
	            	findMenuPageList(selectRulePackageId);
		             $.messager.alert('规则激活',"已成功激活该规则！",'info');
	            },
	            error:function(){
	            	$.messager.progress('close');
	            	$.messager.alert('错误','激活规则指标出错，请联系管理员！','error');
	            }
	        });
		}
	});

}

//禁用指标
function cancellation(obj){
	if(obj === null || obj === undefined || obj === "") return;
	$.messager.confirm('禁用规则指标', '确定要禁用选中指标？', function(data) {
		if (!data) {
			return false;
		}else{
			$.messager.progress({title: '禁用指标', msg: '请稍候，正在作废数据...', interval: 500});
			var row= $('#menu_list').datagrid("getRows");
			var ind_id= row[obj].ind_id;
			if(ind_id ==='undefined' || ind_id === '' || ind_id === null){
		    	$.messager.alert("警告", "没有数据", "warning");
		    	return;
		    }
			$.ajax({
	            url : ctx + "/rule/deleteRulePackageInd",
	            data : {
	            	"package_id" : selectRulePackageId.id,
	            	"ind_id" : ind_id
	            },
	            type : 'POST',
	            success : function(msg) {
	            	$.messager.progress('close');
	            	findMenuPageList(selectRulePackageId);
		            $.messager.alert('规则禁用',"已成功禁用该规则！",'info');

	            },
	            error:function(){
	            	$.messager.progress('close');
	            	$.messager.alert('错误','禁用规则指标出错，请联系管理员！','error');
	            }
	        });
		}
	});
}

//右键功能新增方法
function new_add(){
 	/* var row = $('#menu_list').datagrid('getSelected'); */
 	showMessageWindow(ctx+"/rule/toAddRuleAndRatingind", "新增规则包", 1000, 550);
}

//右键功能查看方法
 function show_current(){
      var row = $('#orgtree').tree('getSelected'); 
      selectId(row);
      findRulePageList(row);
 }

//右键功能修改方法
function update(){

	var row = $('#orgtree').tree('getSelected'); 
	selectId(row);
    if (row == null || row.id==null){
       $.messager.alert('提示信息', '请选择要修改的数据！', 'warning');
        return false;
                       			}
    var url = ctx+"/rule/toUpdateRulePackage?package_id="+encodeURI(encodeURI(row.id));
    showMessageWindow(url,"修改规则包",900,400);
}

//右键功能删除方法
function deleteOne(){
	
	var row = $('#orgtree').tree('getSelected'); 
	if(row === null || row === undefined || row === "") return;
	$.messager.confirm('删除规则包', '确定要删除选中规则包？', function(data) {
		if (!data) {
			return false;
		}else{
			$.messager.progress({title: '删除规则包', msg: '请稍候，正在删除数据...', interval: 500});
			var package_id= row.id;
			if(package_id ==='undefined' || package_id === '' || package_id === null){
		    	$.messager.alert("警告", "没有数据", "warning");
		    	return;
		    }
			$.ajax({
	            url : ctx + "/rule/deleteRulePackage",
	            data : {
	            	"package_id" : package_id
	            },
	            type : 'POST',
	            success : function(msg) {
	            	$.messager.progress('close');
            		reloadLeft();
            		var node={};
            		node.id="";
            		findRulePageList(node);
	                $.messager.alert('规则删除',"已成功删除该规则包！");	            	
	                
	            },
	            error:function(){
	            	$.messager.progress('close');
	            	$.messager.alert('错误','删除规则包出错，请联系管理员！','error');
	            }
	        });
		}
	});
	
}