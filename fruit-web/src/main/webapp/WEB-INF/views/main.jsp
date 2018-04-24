<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/common/baseTitle.jsp"%>
<html>

<head>
	<title>MedLink</title>
	<%@ include file="/WEB-INF/views/common/baseJsCss.jsp"%>
    <meta name="viewport" content="width=device-width" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>LeaRun敏捷开发框架（专业版）在线示例</title>
    
    <c:set var="ctx" value="${pageContext.request.contextPath}"/>
	<script type="text/javascript">
		var ctx = "<%=request.getContextPath()%>";
	</script>	
    
    <script src="${ctx}/static/main/js/jquery.cookie.js"></script>
    <link href="${ctx}/static/main/css/font-awesome.css" rel="stylesheet" />
    <script src="${ctx}/static/main/js/learun-clientdata.js"></script>
    <script src="${ctx}/static/main/js/index.js"></script>
    <link href="${ctx}/static/main/css/index.css" rel="stylesheet" />
   

    <link href="${ctx}/static/main/css/learun-ui.css" rel="stylesheet"/>

    <script src="${ctx}/static/main/js/learun.js"></script>

 
    <script>
        $(function () {
            initialPage();            
        });
        //初始化页面
        function initialPage() {
            $("#container").height($(window).height());
            $(window).resize(function (e) {
                $("#container").height($(window).height());
            });
          loadnav();
           
        }
       
    </script>
</head>
<body style="overflow: hidden;">
    <%-- <div id="ajax-loader" style="cursor: progress; position: fixed; top: -50%; left: -50%; width: 200%; height: 200%; background: #fff; z-index: 10000; overflow: hidden;">
        <img src="${ctx}/static/main/Images/ajax-loader.gif" style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; margin: auto;" />
    </div> --%>
    <div id="container">
        <div id="side" >
            <img id="icon-vension" src="${ctx}/static/main/Images/icon_v_b_e.png" alt="企业版">
            <div id="navDiv" style="overflow-y:auto;overflow-x:hidden;">
                <ul  style="width:80px;" id="nav">
                 	<!-- <li class="item">
     					<a id="1"  href="javascript:void(0);" class="main-nav">
     						<div class="main-nav-icon"><i class="fa fa fa-desktop"></i></div>
           					<div class="main-nav-text">123</div>
            				<span class="arrow"></span>
       			 		</a>  
       			 		
       			 		<div class="sub-nav-wrap">
    						<ul class="sub-nav">
    							<li><a id="11"><i class="fa fa fa-database"></i>wang</a></li>
    							<li class="sub" title='123'><a id="22"><i class="fa fa fa-database"></i>xing</a></li>
                			</ul>
                		</div>
    				</li> -->
    				
                </ul>
               
            </div>
        </div>
        <div id="main">
            <div id="main-hd">
                <div id="main-hd-title">
                    <a>WistronITS</a>
                </div>
                <div style="float: right">
                    <ul id="topnav">
                        <li class="list">
                            <a>
                                <span><i class="fa fa-home"></i></span>
                               	 系统首页
                            </a>
                        </li>
                        <li class="list" id="UserSetting">
                            <a>
                                <span><i class="fa fa-user"></i></span>
                                                                                                               个人中心
                            </a>
                        </li>
                        <li class="list">
                            <a>
                                <span><i class="fa fa-bell"></i></span>
                                	消息通知
                            </a>
                        </li>
                        <li class="list" onclick="IndexOut()">
                            <a>
                                <span><i class="fa fa-power-off"></i></span>
                               	 安全退出
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div id="main-bd">
               <div id="main-tabs" class="easyui-tabs">
				<div title="首页" data-options="closeable:true" style="height: 100%;">
				   <iframe name="medLinkMain"  style="height:100%;width:100%;border: 0px" src="http://www.baidu.com"></iframe>
                </div>  

				</div>
                <!-- <div class="contextmenu">
                    <ul>
                        <li onclick="$.removeTab('reloadCurrent')">刷新当前</li>
                        <li onclick="$.removeTab('closeCurrent')">关闭当前</li>
                        <li onclick="$.removeTab('closeAll')">全部关闭</li>
                        <li onclick="$.removeTab('closeOther')">除此之外全部关闭</li>
                        <div class='m-split'></div>
                        <li>退出</li>
                    </ul>
                </div> -->
            </div>
        </div>
    </div>
    <!--载进度条start
    <div id="loading_background" class="loading_background" style="display: none;"></div>
    <div id="loading_manage">
      	  正在拼了命为您加载…
    </div>-->
    <!--载进度条end-->
    
</body>
</html>
<script>

</script>