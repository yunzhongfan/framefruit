package fruit.bo.weChart.button;

/**
 * @desc  : 菜单 
 * 
 * @author: shirayner
 * @date  : 2017-8-20 下午9:30:31
 */

public class Menu {  
    private Button[] button;  
  
    public Button[] getButton() {  
        return button;  
    }  
  
    public void setButton(Button[] button) {  
        this.button = button;  
    }  
    
    
    
    /** 
     * 2.组装菜单数据 
     *  
     * @return 
     */  
    public  Menu getMenu() {  
      /* ViewButton btn11 = new ViewButton();  
        btn11.setName("JSSDK测试");  
        btn11.setType("view");  
        btn11.setUrl("http://5hcn2d.natappfree.cc/WeiXin_SanFenBaiXue/index.jsp");  

        CommonButton btn12 = new CommonButton();  
        btn12.setName("使用帮助");  
        btn12.setType("click");  
        btn12.setKey("12");  

        CommonButton btn13 = new CommonButton();  
        btn13.setName("翻译功能");  
        btn13.setType("click");  
        btn13.setKey("13");  

        ViewButton btn14 = new ViewButton();  
        btn14.setName("上传图片");  
        btn14.setType("view");  
        btn14.setUrl("http://5hcn2d.natappfree.cc/WeiXin_SanFenBaiXue/uploadimg.jsp"); 



     ViewButton btn15 = new ViewButton();  
        btn15.setName("上传图片2");  
        btn15.setType("view");  
        btn15.setUrl("http://5hcn2d.natappfree.cc/WeiXin_SanFenBaiXue/index2.jsp");  

      CommonButton btn21 = new CommonButton();  
        btn21.setName("歌曲点播");  
        btn21.setType("click");  
        btn21.setKey("21");  

        CommonButton btn22 = new CommonButton();  
        btn22.setName("经典游戏");  
        btn22.setType("click");  
        btn22.setKey("22");  

        CommonButton btn23 = new CommonButton();  
        btn23.setName("美女电台");  
        btn23.setType("click");  
        btn23.setKey("23");  

        CommonButton btn24 = new CommonButton();  
        btn24.setName("人脸识别");  
        btn24.setType("click");  
        btn24.setKey("24");  

      CommonButton btn25 = new CommonButton();  
        btn25.setName("聊天唠嗑");  
        btn25.setType("click");  
        btn25.setKey("25");  

        ViewButton btn31 = new ViewButton();  
        btn31.setName("上传图片2");  
        btn31.setType("view");  
        btn31.setUrl("http://5hcn2d.natappfree.cc/WeiXin_SanFenBaiXue/index2.jsp");  

        CommonButton btn33 = new CommonButton();  
        btn33.setName("幽默笑话");  
        btn33.setType("click");  
        btn33.setKey("33");  

        CommonButton btn34 = new CommonButton();  
        btn34.setName("用户反馈");  
        btn34.setType("click");  
        btn34.setKey("34");  

        CommonButton btn35 = new CommonButton();  
        btn35.setName("关于我们");  
        btn35.setType("click");  
        btn35.setKey("35");  

        ViewButton btn32 = new ViewButton();  
        btn32.setName("周边搜索");  
        btn32.setType("view");  
        btn32.setUrl("http://liufeng.gotoip2.com/xiaoqrobot/help.jsp"); 

        ComplexButton mainBtn1 = new ComplexButton();  
         mainBtn1.setName("查看历史");  
        mainBtn1.setSub_button(new Button[] { btn11, btn12, btn13, btn14, btn15 });  

        ComplexButton mainBtn2 = new ComplexButton();  
        mainBtn2.setName("下订单");  
       mainBtn2.setSub_button(new Button[] { btn21, btn22, btn23, btn24, btn25 });  

        ComplexButton mainBtn3 = new ComplexButton();  
        mainBtn3.setName("养生小常识");  
       mainBtn3.setSub_button(new Button[] { btn31, btn33, btn34, btn35, btn32 });  

        *//** 
         * 这是企业号目前的菜单结构，每个一级菜单都有二级菜单项<br> 
         *  
         * 在某个一级菜单下没有二级菜单的情况，menu该如何定义呢？<br> 
         * 比如，第三个一级菜单项不是“更多体验”，而直接是“幽默笑话”，那么menu应该这样定义：<br> 
         * menu.setButton(new Button[] { mainBtn1, mainBtn2, btn33 }); 
         *//*  
        Menu menu = new Menu();  
        menu.setButton(new Button[] { mainBtn1, mainBtn2, mainBtn3 });  */
    
    	  CommonButton mainBtn1 = new CommonButton();  
    	  mainBtn1.setName("查看历史");  
    	  mainBtn1.setType("click");  
    	  mainBtn1.setKey("11"); 
    	  ViewButton mainBtn2 = new ViewButton();  
    	  mainBtn2.setName("下订单喽");  
    	  mainBtn2.setType("view");  
    	  mainBtn2.setUrl("http://sg.ngrok.xiaomiqiu.cn/fruit-web/login/doLogin"); 
    	  
    	  CommonButton btn31 = new CommonButton();  
    	  btn31.setName("水果介绍");  
    	  btn31.setType("click");  
    	  btn31.setKey("31");  

          CommonButton btn32 = new CommonButton();  
          btn32.setName("订单、水果问题");  
          btn32.setType("click");  
          btn32.setKey("32");  

          ViewButton btn33 = new ViewButton();  
          btn33.setName("联系客服");  
          btn33.setType("view");  
          btn33.setUrl("http://liufeng.gotoip2.com/xiaoqrobot/help.jsp"); 
    	  
    	  ComplexButton mainBtn3 = new ComplexButton();  
          mainBtn3.setName("售后");  
        mainBtn3.setSub_button(new Button[] { btn31,btn32, btn33 });  
   		Menu menu = new Menu(); 
    	menu.setButton(new Button[] { mainBtn1, mainBtn2, mainBtn3 });

        return menu;  
    }  
    
    //关注自动回复菜单内容
    public static String autoFllowText(){
        StringBuffer sb = new StringBuffer();
        sb.append("      你关注，\n");
        sb.append("     或者不关注，\n");
        sb.append("      【水果吧】都在这里!\n");
        sb.append("     不离，\n");
        sb.append("      不弃！\n\n");
        sb.append("该公众号已实现以下功能：\n");
        sb.append("回复 1 ,近期特卖水果，\n");
        sb.append("回复 2 ,查看历史订单，\n");
        sb.append("回复 2 ,联系客服妹子\n");
        sb.append("如您在使用该公众有任何宝贵意见，欢迎反馈！\n\n");
        sb.append("反馈邮箱：xxxxxxx@qq.com");
        return sb.toString();       
    }

}