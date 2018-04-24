package wechartInter;


import org.springframework.context.support.ClassPathXmlApplicationContext;

import fruit.bo.weChart.button.Menu;
import fruit.utils.AccessTokenUtil;
import fruit.weChart.service.MenuService;

public class MenuTest {

	
	/*@Test    
	  public void testCreateMenu(){
	      //1.��װ�˵�
	      MenuService ms=new MenuService();
	      //2.��ȡaccess_token:������ҵid��Ӧ����Կ��ȡaccess_token
	      String accessToken=AccessTokenUtil.getAccessToken("wxa68469551bd53648", "c988126cef3b5989e90347ac225ccee3").getAccess_token();
	      System.out.println("accessToken:"+accessToken);
	      //3.�����˵�
	      ms.createMenu( accessToken, ms.getMenu());
	  }*/
	
	public static void main(String[] args){
	      String accessToken=AccessTokenUtil.getAccessToken("wxa68469551bd53648", "c988126cef3b5989e90347ac225ccee3").getAccess_token();

	     ClassPathXmlApplicationContext context =new  ClassPathXmlApplicationContext("classpath:/spring/webapp-context.xml");
	      context.start();
	       MenuService ms =(MenuService) context.getBean("menuService");
		  System.out.println("accessToken:"+accessToken);
	      //3.�����˵�
	      ms.createMenu( accessToken, new Menu().getMenu());
	}


	
}
