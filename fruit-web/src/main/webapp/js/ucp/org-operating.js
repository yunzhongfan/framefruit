function save(){
	$('#orgForm').form('submit',{  
			url:ctx+"/org/orgSave",
		success:function(data){
			var data = eval('(' + data + ')');
    		if(data.msg=="success"){
    			//$.messager.show({ icon: "info", msg: "新增成功!" ,position: "center"});
    			parent.$("#orgList").treegrid('reload');
    			parent.$('#addOrgWindow').dialog('close');
    		}  
		}  
		});       	
}

function update(){
	$('#orgForm').form('submit',{  
		url:ctx+"/org/orgUpdate",
	success:function(data){
		var data = eval('(' + data + ')');
		if(data.msg=="success"){
			//$.messager.show({ icon: "info", msg: "新增成功!" ,position: "center"});
			parent.$("#orgList").treegrid('reload');
			parent.$('#addOrgWindow').dialog('close');
		}  
	}  
	});       
}

function cancel(){
	parent.$("#orgList").treegrid('reload');
	parent.$('#addOrgWindow').dialog('close');
}