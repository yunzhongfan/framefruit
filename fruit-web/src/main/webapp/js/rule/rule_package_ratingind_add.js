$(function() {
	$("#ratinginded").hide();
	$("[name='ind_val']").css("width","200px");
	if($("#package_id").val()!=""){
		$("#package_name").attr("disabled","disabled");
		$("#package_desc").attr("disabled","disabled");
	}	
});

var rowObject;

//条件数组
var condArr= new Array();

//反转字符串
function reverse(str){
  var tmp = "";
  for(var i = str.length - 1;i>=0;i--){
      tmp += str.charAt(i);
  }
  return tmp;
}

//查询某个字符串中，子串第count次出现的index下标
//str: 是你的原字符串//searchfor: 是你的要找的字符串//count: 寻找的次数
function getPosition(str,searchfor,count){
	 var re = new RegExp(searchfor,"g");
	 while(count--){
	     re.test(str);
	 }
	 var pos = re.lastIndex-searchfor.length;
	 if(pos < 0)
	     return -1;
	 else
	     return pos;
}

//页面取值，拼凑汉语语句发到后台解析
function calDateFromPage(){
	var condNum=$('tr[name=first]').length;//条件个数
	var temConditionArr=new Array();//存储条件
	for(var i=1;i<=condNum;i++){
		//条件
		temConditionArr[i-1] = $($('[name="ind_condition"]')[i-1]).find("option:selected").val();
		//约束值
		if(temConditionArr[i-1] == "介于"){
			//判断必须为数字
			if(isNaN(Number($($('tr[name="first"]')[i-1]).find('input[name="ind_val"]:first').val()))){
				$.messager.alert('提示',"介于项的约束值输入的不是数字！",'info');
				$($('tr[name="first"]')[i-1]).find('input[name="ind_val"]:first').focus();
				return false;
			}
			if(isNaN(Number($($('tr[name="first"]')[i-1]).find('input[name="ind_val"]:last').val()))){
				$.messager.alert('提示',"介于项的约束值输入的不是数字！",'info');
				$($('tr[name="first"]')[i-1]).find('input[name="ind_val"]:last').focus();
				return false;
			}	
			temConditionArr[i-1] += $($('tr[name="first"]')[i-1]).find('input[name="ind_val"]:first').val();
			temConditionArr[i-1] += $($('tr[name="first"]')[i-1]).find('select[name="val_condition"]:first').find("option:selected").val()
			temConditionArr[i-1] += "与";
			temConditionArr[i-1] += $($('tr[name="first"]')[i-1]).find('select[name="val_condition"]:last').find("option:selected").val()
			temConditionArr[i-1] += $($('tr[name="first"]')[i-1]).find('input[name="ind_val"]:last').val();
		}else{
			temConditionArr[i-1] += $($('tr[name="first"]')[i-1]).find('input[name="ind_val"]:first').val();
		}
		//处理得分
		temConditionArr[i-1] += "得分";
		temConditionArr[i-1] += $($('input[name="ind_score"]')[i-1]).val();
	}
	//检测条件是比较数字还是 字符
	var n=$($('tr[name="first"]')[0]).find('input[name="ind_val"]:first').val()
	 
	return isNaN(Number(n)).toString().substring(0, 1)+temConditionArr.toString();
}


//添加规则包和规则指标内容
function doSave(){
	//未添加规则包的时候
	if($("#package_id").val()==""){
		if(!$("#addRuleForm").form("validate")){
			$.messager.alert(msgTitle, "请检查栏位是否正确输入", "warning",function(){
				$("#addRuleForm .validatebox-invalid:first").focus();
			});
			return;
		}
		else{
			//用户输入规则指标内容，所有内容一起添加
			if($("#ind_id").val()!=""||$("#ind_name").val()!=""||$("#description").val()!=""){
				if(!$("#addRatingindForm").form("validate")){
					$.messager.alert(msgTitle, "请检查栏位是否正确输入", "warning",function(){
						$("#addRatingindForm .validatebox-invalid:first").focus();
					});
					return;
				}
				else{
					var flag='0';
					var inputLength = $('tr[name=first]').find('input').length;
					for(var i=0;i<inputLength;i++){
						if($($('tr[name=first]').find('input')[i]).val()=="")
							{
								$.messager.alert('提示',"请先在输入框输入内容！",'info');
								$($('tr[name=first]').find('input')[i]).focus();
								flag='1';
								return;
							}
						}
					if(flag=='0'){
						addRuleRating();
					}
				}
			}else{
				//用户没有输入规则指标内容时，仅保存规则包
				addRule();
				$.messager.alert('提示信息','规则包添加成功!','info',function(data){
					if(!!window.ActiveXObject || "ActiveXObject" in window){
						window.parent.frames["center"].reloadLeft();
					}else{
						window.parent.frames["center"].reloadLeft();
					}
				})
			}
		}
	}
	//用户已保存规则包时候，保存规则指标
	else{
		if(!$("#addRatingindForm").form("validate")){
			$.messager.alert(msgTitle, "请检查栏位是否正确输入", "warning",function(){
				$("#addRatingindForm .validatebox-invalid:first").focus();
			});
			return;
		}else{
			var flag="0";
			var inputLength = $('tr[name=first]').find('input').length;
			for(var i=0;i<inputLength;i++){
				if($($('tr[name=first]').find('input')[i]).val()=="")
					{
						$.messager.alert('提示',"请先在输入框输入内容！",'info');
						$($('tr[name=first]').find('input')[i]).focus();
						flag="1";
						return;
					}
				}
			if(flag=="0"){
				addRating();
			}
		}
	}
}

//用户没有输入规则指标内容时，仅保存规则包
function addRuleRating(){
	$.ajax({
		url: ctx+"/rule/addRulePackage",
		type:"post",
		data:$("#addRuleForm").serialize(),
		dataType:"json",
		success:function(result){
			$("#package_id").val(result.package_id);
			$("#package_name").attr("disabled","disabled");
			$("#package_desc").attr("disabled","disabled");
			addRating();
			}
	});
}

//用户保存规则包 规则指标内容
function addRule(){
	$.ajax({
		url: ctx+"/rule/addRulePackage",
		type:"post",
		data:$("#addRuleForm").serialize(),
		dataType:"json",
		success:function(result){
			$("#package_id").val(result.package_id);
			$("#package_name").attr("disabled","disabled");
			$("#package_desc").attr("disabled","disabled");
		}
	});
}
//添加规则指标和规则内容
function addRating(){
	$.ajax({
        url : ctx + "/rule/existRatingind",
        data : {
        	"package_id" : $("#package_id").val(),
        	"ind_id" : $("#ind_id").val()
        },
        type : 'POST',
        success : function(data) {
        	if(data.msg=="N"){
        		$.messager.alert("添加指标","该指标代码已存在！","info");
        	}else{
        		$.ajax({
    				url: ctx+"/rule/addRatingind",
    				type:"post",
    				data:$("#addRatingindForm").serialize(),
    				dataType:"json",
    				success:function(result){
    						$("#rating_id").val(result.rating_id);
    						addRulePackageInd();
    						$("#ratinginded").show();
    						if($("tr[name=ratingind_first]:first").find('input:first').val()==''){
    							$("[name='ratingind_id']").val($("#ind_id").val());
    							$("[name='ratingind_name']").val($("#ind_name").val());
    							if($("#is_main").val()==1){
    								$("[name='ratingind_key']").val("关键");
    							}else{
    								$("[name='ratingind_key']").val("非关键");
    							}
    							$("[name='ratingind_description']").val($("#description").val());
    						}else{
    							var newline=$('tr[name=ratingind_first]:last').clone();
    							$('tr[name=ratingind_first]:last').after(newline);
    							//初始化新的一行
    							$('tr[name=ratingind_first]:last').find('input:first').val($("#ind_id").val());
    							$("tr[name=ratingind_first]:last").find('input:eq(1)').val($("#ind_name").val());
    							if($("#is_main").val()==1){
    								$("tr[name=ratingind_first]:last").find('input:eq(2)').val("关键");
    							}else{
    								$("tr[name=ratingind_first]:last").find('input:eq(2)').val("非关键");
    							}
    							$("tr[name=ratingind_first]:last").find('input:eq(3)').val($("#description").val());
    						}
    					}
    			});	
        	}
        },
        error:function(){
        	$.messager.alert("错误","添加指标出错，请联系管理员！","error");
        }
    });

}
//添加规则内容
function addRulePackageInd(){
		//计算页面转换成语句发到后台
		var calData=calDateFromPage();
		if(!calData){
			return;
		}
		$.ajax({
    	        url:ctx+"/rule/saveRulePackageInd",
    	        data : {
    	        	"package_id" : $("#package_id").val(),
    	        	"ind_id" : $("#ind_id").val(),
    	        	"rating_id" : $("#rating_id").val(),
    	        	"rule_content" : calData
    	        },
    	        type : 'POST',
    	        success : function(r) {
    	        	 $.messager.alert('规则指标',"已成功添加该规则指标内容！",'info',function(data){
    					if(!!window.ActiveXObject || "ActiveXObject" in window){
    						window.parent.frames["center"].reloadRight();
    						window.parent.frames["center"].reloadLeft();
    					}else{
    						window.parent.frames["center"].reloadRight();
    						window.parent.frames["center"].reloadLeft();
    					}
    	        	 });
    	        	 $("#ind_id").val("");
    	        	 $("#ind_name").val("");
    	        	 $("#description").val("");
    	        	 $('[dele=dele]').remove();
    	        	 $('tr[name=first]:last').find('input').val("");
    	        },
    	        error:function(){
    	        	$.messager.alert('错误','添加规则内容出错，请联系管理员！','error');
    	        }
    	    });
}

//返回
function doBack(){
	$.messager.alert("操作提示", "请确认信息已保存完整！","question",function(){
		 if(!!window.ActiveXObject || "ActiveXObject" in window){
			 window.parent.frames["center"].reloadLeft();
			 }else{
				 window.parent.frames["center"].reloadLeft(); 
			 } 
		  parent.$('#common_window').window('close');
	});	
}

//添加一行
function doIteamAdd(){
	//alert(getPosition("liubinbinlin","in",2));
	var newline=$('tr[name=first]:last').clone();
	$('tr[name=first]:last').after(newline);
	$('tr[name=first]:last').attr('dele','dele');
	//初始化新的一行
	$('tr[name=first]:last').find('input:first').css("width","200px");
	$('tr[name=first]:last').find('span[name="temp_val"]').html("");
	$('tr[name=first]:last').find('select[name="val_condition"]').remove();
	if($('tr[name=first]:last').find('input[name="ind_val"]').length>1){
		$('tr[name=first]:last').find('input[name="ind_val"]:last').remove();
	}
	$('tr[name=first]:last').find('input').val("");
}

//删除一行
function doDel(opp){
	var length = $("#search tr").length;
	if (length < 3) {
		$.messager.alert("提示","至少留一行！","info");
	} else {
		$(opp).parent().parent().remove();//移除当前行
	}
}

//下拉框改变
function doSelectChange(opp){
	if($(opp).parent().parent().find("option:selected").val()=="介于"){
		$(opp).parent().parent().find('input:first').css("width","70px");
		$(opp).parent().parent().find('span[name="temp_val"]').html("&nbsp;约束值&nbsp;");
		$(opp).parent().parent().find('span[name="temp_val"]').before('<select id="val_condition" name="val_condition" style="width:50px;height:23px;border:1px  solid #95B8E7;padding:1px;"><option value="A"><</option> <option value="B">≤</option></select>');
		$(opp).parent().parent().find('span[name="temp_val"]').after(
				'<select id="val_condition" name="val_condition" style="width:50px;height:23px;border:1px  solid #95B8E7;padding:1px;"><option value="A"><</option> <option value="B">≤</option></select><input  name="ind_val"  style="width:70px;height:18px;border:1px  solid #95B8E7;padding:1px;"   class="easyui-validatebox input2" />'	
		);
		$(opp).parent().parent().find('input').attr("value","");
	}else{
		$(opp).parent().parent().find('input:first').css("width","200px");
		$(opp).parent().parent().find('span[name="temp_val"]').html("");
		$(opp).parent().parent().find('select[name="val_condition"]').remove();
		if($(opp).parent().parent().find('input[name="ind_val"]').length>1){
			$(opp).parent().parent().find('input[name="ind_val"]:last').remove();
		}
		$(opp).parent().parent().find('input').attr("value","");
	}
}