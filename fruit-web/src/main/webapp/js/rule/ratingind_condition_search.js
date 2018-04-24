$(function() {
	$("#rule_content").hide();
	$("#ind_val").css("width","200px");
	if($("#is_key").val()==1){
		$("#is_main").val("1");
	}else{
		$("#is_main").val("0");
	}
	dealIndContent();
});

var rowObject;

//条件数组
var condArr= new Array();

//解析规则的dr代码
function dealIndContent(){
	var countent=$("#rule_content").html();//dr代码
	if(countent==""||countent.length==0){
		return;
	}
	var startIndexArr = new Array();//
	var endIndexArr = new Array();
	//条件个数
	var conditionCount=countent.split('DroolsUtil.calcGrade').length-1;
	var condStr= new Array();
	
	for(var i=1;i<=conditionCount;i++)
		{
			startIndexArr[i-1]=getPosition(countent,'map,"IND_LEVEL",',i)+17;
			endIndexArr[conditionCount-i]=countent.length - getPosition(reverse(countent),';',i)-2;
		}
	for(var i=1;i<=conditionCount;i++)
	{
		condStr[i-1]=countent.substring(startIndexArr[i-1],endIndexArr[i-1])
		//初始化table行数
		if(i>1){
			doIteamAdd();
		}
		condArr[i-1]=condStr[i-1].split("),");
		//页面赋值
	}
	initFormData();
}

//初始化页面
function initFormData(){
	for(var i=1;i<=condArr.length;i++){
		//处理下拉框
		if(condArr[i-1][0].indexOf("&amp;")!=-1){
			$($('[name="ind_condition"]')[i-1]).find('option[value=介于]').attr("selected","selected");
			$($('tr[name="first"]')[i-1]).find('input:first').css("width","70px");
			$($('tr[name="first"]')[i-1]).find('span[name="temp_val"]').html("&nbsp;约束值&nbsp;");
			$($('tr[name="first"]')[i-1]).find('span[name="temp_val"]').before('<select id="val_condition" name="val_condition" style="width:50px;height:23px;border:1px  solid #95B8E7;padding:1px;"><option value="A"><</option> <option value="B">≤</option></select>');
			$($('tr[name="first"]')[i-1]).find('span[name="temp_val"]').after('<select id="val_condition" name="val_condition" style="width:50px;height:23px;border:1px  solid #95B8E7;padding:1px;"><option value="A"><</option> <option value="B">≤</option></select><input id="ind_val" name="ind_val"  style="width:70px;height:18px;border:1px  solid #95B8E7;padding:1px;"   class="easyui-validatebox input2" />');
			//处理大小关系的下拉框
			if(condArr[i-1][0].split('&amp')[0].indexOf("lt;=")!=-1){
				$($('tr[name="first"]')[i-1]).find('select[name="val_condition"]:first').find('option[value=B]').attr("selected","selected");
			}else{
				$($('tr[name="first"]')[i-1]).find('select[name="val_condition"]:first').find('option[value=A]').attr("selected","selected");
			}
			if(condArr[i-1][0].split('&lt;')[2].indexOf("=")!=-1){
				$($('tr[name="first"]')[i-1]).find('select[name="val_condition"]:last').find('option[value=B]').attr("selected","selected");
			}else{
				$($('tr[name="first"]')[i-1]).find('select[name="val_condition"]:last').find('option[value=A]').attr("selected","selected");
			}
			//处理约束值
			$($('tr[name="first"]')[i-1]).find('input[name="ind_val"]:first').attr("value",condArr[i-1][0].split('&')[0]);
			if(condArr[i-1][0].split('&lt;')[2].indexOf("=")!=-1){
				$($('tr[name="first"]')[i-1]).find('input[name="ind_val"]:last').attr("value",condArr[i-1][0].split('&lt;')[2].split('=')[1]);
			}else{
				$($('tr[name="first"]')[i-1]).find('input[name="ind_val"]:last').attr("value",condArr[i-1][0].split('&lt;')[2]);
			}
		}else if(condArr[i-1][0].indexOf("contains")!=-1){
			$($('[name="ind_condition"]')[i-1]).find('option[value=包含]').attr("selected","selected");
			//处理约束值
			$($('tr[name="first"]')[i-1]).find('input[name="ind_val"]:first').attr("value",condArr[i-1][0].split('contains("')[1].substring(0,condArr[i-1][0].split('contains("')[1].length-2));
		}else if(condArr[i-1][0].indexOf("&gt;=")!=-1){
			$($('[name="ind_condition"]')[i-1]).find('option[value=大于等于]').attr("selected","selected");
			//处理约束值
			$($('tr[name="first"]')[i-1]).find('input[name="ind_val"]:first').attr("value",condArr[i-1][0].split('&gt;=')[1]);
		}else if(condArr[i-1][0].indexOf("&lt;=")!=-1){
			$($('[name="ind_condition"]')[i-1]).find('option[value=小于等于]').attr("selected","selected");
			//处理约束值
			$($('tr[name="first"]')[i-1]).find('input[name="ind_val"]:first').attr("value",condArr[i-1][0].split('&lt;=')[1]);
		}else if(condArr[i-1][0].indexOf("&gt;")!=-1){
			$($('[name="ind_condition"]')[i-1]).find('option[value=大于]').attr("selected","selected");
			//处理约束值
			$($('tr[name="first"]')[i-1]).find('input[name="ind_val"]:first').attr("value",condArr[i-1][0].split('&gt;')[1]);
		}else if(condArr[i-1][0].indexOf("&lt;")!=-1){
			$($('[name="ind_condition"]')[i-1]).find('option[value=小于]').attr("selected","selected");
			//处理约束值
			$($('tr[name="first"]')[i-1]).find('input[name="ind_val"]:first').attr("value",condArr[i-1][0].split('&lt;')[1]);
		}else if(condArr[i-1][0].indexOf("==")!=-1){
			$($('[name="ind_condition"]')[i-1]).find('option[value=等于]').attr("selected","selected");
			//处理约束值
			$($('tr[name="first"]')[i-1]).find('input[name="ind_val"]:first').attr("value",condArr[i-1][0].split('==')[1].replace('"',"").replace('"',""));
		}else{
			$($('[name="ind_condition"]')[i-1]).find('option[value=其它]').attr("selected","selected");
			//处理约束值
			$($('tr[name="first"]')[i-1]).find('input[name="ind_val"]:first').attr("value",condArr[i-1][0]);
		}
		//处理分值
		var scoreLength = condArr[i-1][1].indexOf(")");
		if(scoreLength!=-1){
			$($('input[name="ind_score"]')[i-1]).attr("value",condArr[i-1][1].substring(0,scoreLength));
		}else{
			$($('input[name="ind_score"]')[i-1]).attr("value",condArr[i-1][1]);
		}
	}
}

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
			//alert(temConditionArr[i-1]);
		}else{
			temConditionArr[i-1] += $($('tr[name="first"]')[i-1]).find('input[name="ind_val"]:first').val();
		}
		//处理得分
		temConditionArr[i-1] += "得分";
		temConditionArr[i-1] += $($('input[name="ind_score"]')[i-1]).val();
		//alert(temConditionArr[i-1]);
	}
	//检测条件是比较数字还是 字符
	var n=$($('tr[name="first"]')[0]).find('input[name="ind_val"]:first').val()
	return isNaN(Number(n)).toString().substring(0, 1)+temConditionArr.toString();
}

function doBack(){
	parent.$('#common_window').window('close');
}

//添加一行
function doIteamAdd(){
	var newline=$('tr[name=first]:last').clone();
	$('tr[name=first]:last').after(newline);
	//初始化新的一行
	$('tr[name=first]:last').find('input:first').css("width","200px");
	$('tr[name=first]:last').find('span[name="temp_val"]').html("");
	$('tr[name=first]:last').find('select[name="val_condition"]').remove();
	if($('tr[name=first]:last').find('input[name="ind_val"]').length>1){
		$('tr[name=first]:last').find('input[name="ind_val"]:last').remove();
	}
	$('tr[name=first]:last').find('input').attr("value","");
}

//下拉框改变
function doSelectChange(opp){
	if($(opp).parent().parent().find("option:selected").val()=="介于"){
		$(opp).parent().parent().find('input:first').css("width","70px");
		$(opp).parent().parent().find('span[name="temp_val"]').html("&nbsp;约束值&nbsp;");
		$(opp).parent().parent().find('span[name="temp_val"]').before('<select id="val_condition" name="val_condition" style="width:50px;height:23px;border:1px  solid #95B8E7;padding:1px;"><option value="A"><</option> <option value="B">≤</option></select>');
		$(opp).parent().parent().find('span[name="temp_val"]').after(
				'<select id="val_condition" name="val_condition" style="width:50px;height:23px;border:1px  solid #95B8E7;padding:1px;"><option value="A"><</option> <option value="B">≤</option></select><input id="ind_val" name="ind_val"  style="width:70px;height:18px;border:1px  solid #95B8E7;padding:1px;"   class="easyui-validatebox input2" />'	
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