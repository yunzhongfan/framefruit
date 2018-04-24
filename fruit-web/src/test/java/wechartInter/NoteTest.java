package wechartInter;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import fruit.utils.AccessTokenUtil;
import fuit.controller.NoteController;

public class NoteTest {

	public static void main(String[] args) {
		String accessToken = AccessTokenUtil.getAccessToken("wxa68469551bd53648", "c988126cef3b5989e90347ac225ccee3")
				.getAccess_token();
		System.out.println("accessToken:" + accessToken);
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(
				new String[] { "classpath:/spring/webapp-context.xml", "classpath:/spring/webapp-mvc.xml" });
		context.start();
		NoteController ms = (NoteController) context.getBean("NoteController");
		
		// 3.´´½¨²Ëµ¥
		//ms.createMenu(accessToken, new Menu().getMenu());
	}

}
