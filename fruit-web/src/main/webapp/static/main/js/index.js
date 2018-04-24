
//初始化导航
var tablist;
loadnav = function () {
    var navJson = {};
    //动态加载导航菜单
    var _html = "";
    var index = 0;
    $.each(authorizeMenuData, function (i) {
        var row = authorizeMenuData[i];
        if (row.parentId == '100') {
            index++;
            _html += '<li class="item">';
            _html += '    <a id=' + row.menuId + '  href="javascript:void(0);" class="main-nav">';
            _html += '        <div class="main-nav-icon"><i class="fa ' + row.icon + '"></i></div>';
            _html += '        <div class="main-nav-text">' + row.menuName + '</div>';
            _html += '        <span class="arrow"></span>';
            _html += '    </a>';
            _html += getsubnav(row.menuId);
            _html += '</li>';
            navJson[row.menuId] = row;
        }
    });
    $("#nav").append(_html);
    $('#nav li a').click(function () {
    	
        var id = $(this).attr('id');
        var data = navJson[id];
        if (data.url != "") {
        	openMenu(data.menuName,data.url);        
        }
    })
    $("#nav li.item").hover(function (e) {
        $('#navDiv').width(4000);
        var $sub = $(this).find('.sub-nav-wrap');
        var length = $sub.find('.sub-nav').find('li').length;
        if (length > 0) {
            $sub.css('bottom', 'initial');
            $(this).addClass('on');
            $sub.show();
            
            var sub_top = $sub.offset().top + $sub.height();
            var body_height = $(window).height();
            if (sub_top > body_height) {
                $sub.css('bottom', '0px');
            }
        }
    }, function (e) {
        $('#navDiv').width(80);
        $(this).removeClass('on');
        $(this).find('.sub-nav-wrap').hide();
    });
    $("#nav li.sub").hover(function (e) {
        var $ul = $(this).find('ul');
        $ul.show();
        var top = $(this).find('ul').offset().top;
        var height = $ul.height();
        var wheight = $(window).height();
        if (top + height > wheight) {
            $ul.css('top', parseInt('-' + (height - 11))).css('left', '130px')
        } else {
            $ul.css('top', '0px').css('left', '130px');
        }
    }, function (e) {
        $(this).find('ul').hide();
        $(this).find('ul').css('top', '0px');
    });
    //导航二菜单
    function getsubnav(menuId) {
        var _html = '<div class="sub-nav-wrap">';
        _html += '<ul class="sub-nav">';
        $.each(authorizeMenuData, function (i) {
            var row = authorizeMenuData[i];
            if (row.parentId == menuId) {
                if (isbelowmenu(row.menuId) == 0) {
                    _html += '<li><a id=' + row.menuId + '><i class="fa ' + row.icon + '"></i>' + row.menuName + '</a></li>';
                } else {
                    _html += '<li class="sub" title=' + (row.menuName == null ? "" : row.menuName) + '><a id=' + row.menuId + '><i class="fa ' + row.icon + '"></i>' + row.menuName + '</a>';
                    _html += getchildnav(row.menuId);
                    _html += '</li>'; //sub
                }
                navJson[row.menuId] = row;
            }
        });
        _html += '</ul>';
        _html += '</div>';
        return _html;
    }
    //导航三菜单
    function getchildnav(menuId) {
        var _html = '<div class="sub-child"><ul>';
        $.each(authorizeMenuData, function (i) {
            var row = authorizeMenuData[i];
            if (row.parentId == menuId) {
                _html += '<li title=' + (row.menuName == null ? "" : row.menuName) + '><a id=' + row.menuId + '><i class="fa ' + row.icon + '"></i>' + row.menuName + '</a></li>';
                navJson[row.menuId] = row;
            }
        });
        _html += '</ul></div>';
        return _html;
    }
    //判断是否有子节点
    function isbelowmenu(menuId) {
        var count = 0;
        $.each(authorizeMenuData, function (i) {
            if (authorizeMenuData[i].parentId == menuId) {
                count++;
                return false;
            }
        });
        return count;
    }
    $(window).resize(function (e) {
        window.setTimeout(function () {
            $('#navDiv').height(($(window).height()));
        }, 200);
        e.stopPropagation();
    });
    $('#navDiv').height(($(window).height()));
    
    function openMenu(menuName,url){ 
       
    	if ($('#main-tabs').tabs('exists', menuName))
    	{
    		$('#main-tabs').tabs('select', menuName);
    	} 
    	else 
    	{  
        	var content;
        	if(url != ""){
        		url = ctx+url;
        		content='<iframe scrolling="yes" frameborder="0"  src="'+url+'" style="width:100%;height:100%;border:0px;"></iframe>';
        	}else{
        		content="优化中！"
        	}
            $('#main-tabs').tabs('add', {  
                'id' : 'tab',  
                title : menuName,  
                fit : true,  
                content : content,  
                closable : true  
            });  
            //获取最后一个tabs 在新加的选项卡后面添加"关闭全部"  
            /* var li = $(".tabs-wrap ul li:last-child");  
            $("#close").remove();  
            li.after("<li id='close'><a class='tabs-inner' href='javascript:void()' onClick='javascript:closeAll()'>关闭全部</a></li>"); */  
        }  
    } ;
}
