<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/common/baseTitle.jsp"%>
<%@ page language="java" import="org.medLink.common.core.utils.SessionTokenGenerator" %>
<%@ page language="java" import="org.medLink.web.ucp.shiro.util.SessionUtil" %>
<%@ page language="java" import="org.medLink.common.core.utils.MD5" %>
<%@ page language="java" import="java.util.*" %>
<html>

<head>
	<title>系統登录</title>
	<%@ include file="/WEB-INF/views/common/baseJsCss.jsp"%>
	
	 	<link rel="shortcut icon" type="image/x-icon" href="${ctx }/static/res/homepage/favicon.ico?v=3.9" />
        <link href="${ctx }/static/res/ui/css/screen.css?v=3.9" media="screen, projection" rel="stylesheet" type="text/css" >
        <link rel="stylesheet" type="text/css" href="${ctx }/static/res/ui/css/base.css?v=3.9">
        <link rel="stylesheet" type="text/css" href="${ctx }/static/res/passport/css/login.css?v=3.9">
        
        <script type="text/javascript" src="${ctx }/static/common/capsLock.js"></script>
        <script type="text/javascript" src="${ctx }/static/common/MD5.js"></script>
</head>
<body>
        <div class="logina-logo" style="height: 55px">
            <a href="">
                <img src="${ctx }/static/res/passport/images/toplogo.png?v=3.9" height="60" alt="">
            </a>
        </div>
        <div class="logina-main main clearfix">
            <div class="tab-con">
                <form id="form-login" method="post" action="${ctx }/login/doLogin">
                		<%
							 String sessiontoken = SessionTokenGenerator.generateToken(SessionUtil.getSession());//生成tokenId
							 String md5Key = MD5.getRandomNum(10);
						 %>
						 <input type="hidden" name="session-token" id="token" value="<%=sessiontoken %>" />
                    <div id='login-error' class="error-tip">${message }</div>
                    <table border="0" cellspacing="0" cellpadding="0">
                        <tbody>
                            <tr>
                                <th>账户</th>
                                <td width="245">
                                    <input id="userName" type="text" name="userName" placeholder="电子邮箱/手机号" autocomplete="off" value=""></td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <th>密码</th>
                                <td width="245">
                                    <input id="password1" type="password" name="password1" placeholder="请输入密码" autocomplete="off">
                                    <input type="hidden" id="password" name="password"/>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr id="tr-vcode">
                                <th>验证码</th>
                                <td width="245">
                                    <div class="valid">
                                        <input type="text" id="captcha" name="captcha" placeholder="请输入验证码" autocomplete="off"><img class="vcode" id="checkimg" src="${ctx}/login/captcha" onclick="refCaptcha(this.id)" width="85" height="35" alt="">
                                    </div>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr class="find">
                                <th></th>
                                <td>
                                    <div>
                                        <label class="checkbox" for="chk11"><input style="height: auto;" id="chk11" type="checkbox" name="remember_me" >记住我</label>
                                        <!-- <a href="passport/forget-pwd">忘记密码？</a> -->
                                    </div>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <th></th>
                                <td width="245"><input class="confirm" type="button" value="登  录" onclick="login()"></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                    <input type="hidden" name="refer" value="site/">
                </form>
            </div>
            <div class="reg">
                <p>还没有账号？<br>赶快免费注册一个吧！</p>
                <a class="reg-btn" href="#">立即免费注册</a>
            </div>
        </div>
        <div id="footer">
            <div class="copyright">Copyright © 2014 js-css.cn. All Rights Reserved. js代码网 版权所有</div>
        </div>
<script type="text/javascript">
function refCaptcha(id){
	document.getElementById(id).src="${ctx}/login/captcha?"+Math.random();
}

function login() {
	var userName = document.getElementById("userName").value;// 登陆账号，区分大小写
	var password = document.getElementById("password1").value;
	if (userName == "") {
		$("#login-error").text("请输入用户名!");
		$("#userName").focus();
		return;
	}
	if (password == "") {
		$("#login-error").text("请输入密码!");
		$("#password1").focus();
		return;
	}
	var passMd5=hex_md5(password);
	var passMd5Key=passMd5.substring(0, 16)+"<%=md5Key %>"+passMd5.substring(16,passMd5.length);
	$("#password").val(passMd5Key);

	document.forms[0].submit();
}
document.onkeydown = function(event) {
	var e = event || window.event || arguments.callee.caller.arguments[0];
	if (e && e.keyCode == 27) { // 按 Esc 
	}
	if (e && e.keyCode == 113) { // 按 F2 
	}
	if (e && e.keyCode == 13) { // enter 键
		login();
	}
};
if ("${param.kickout}" != "") {
	$.messager.confirm("系统登录", "您的账号在其他地方登录,被迫退出登录！", function(data) {
	});
}
//调用capsLock.js 校验大写锁是否开启
$("#password1").capsLockTip();
if (self.location != top.location) {
	top.location.href = "login.jsp";
}
</script>
</body>
</html>