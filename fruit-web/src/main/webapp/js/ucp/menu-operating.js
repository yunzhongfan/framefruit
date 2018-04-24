function save(){
	$('#menuForm').form('submit',{  
		url:ctx+"/menu/menuSave",
	success:function(data){
		var data = eval('(' + data + ')');
		if(data.msg=="success"){
			//$.messager.show({ icon: "info", msg: "新增成功!" ,position: "center"});
			parent.$("#menuList").treegrid('reload');
			parent.$('#addMenuWindow').dialog('close');
		}  
	}  
	});  
}

function update(){
	$('#menuForm').form('submit',{  
		url:ctx+"/menu/menuUpdate",
	success:function(data){
		var data = eval('(' + data + ')');
		if(data.msg=="success"){
			//$.messager.show({ icon: "info", msg: "新增成功!" ,position: "center"});
			parent.$("#menuList").treegrid('reload');
			parent.$('#addMenuWindow').dialog('close');
		}  
	}  
	});   
}

function cancel(){
	parent.$("#menuList").treegrid('reload');
	parent.$('#addMenuWindow').dialog('close');
}