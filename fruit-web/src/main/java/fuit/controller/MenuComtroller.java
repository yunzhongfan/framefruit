package fuit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import fruit.bo.weChart.button.Menu;
import fruit.utils.AccessTokenUtil;
import fruit.weChart.service.MenuService;
import net.sf.json.JSONObject;

/**
 * �Զ���˵�
 * 
 * @author nbc
 *
 */

@Controller
@RequestMapping("order")
public class MenuComtroller {

	@Autowired
	private MenuService menuService;

	/**
	 * ��ת��֧��ͨ��ҳ��
	 * 
	 * @return
	 */
	@RequestMapping("/orderForm")
	public String orderForm() {
		return "/orderForm";
	}

	/**
	 * �����˵�
	 */
	@RequestMapping("/createMenu")
	public JSONObject createMenu() {
		String accessToken = AccessTokenUtil.getAccessToken("wxa68469551bd53648", "c988126cef3b5989e90347ac225ccee3")
				.getAccess_token();
		return menuService.createMenu(accessToken, new Menu().getMenu());
	}

	/**
	 * ɾ���˵�
	 */
	@RequestMapping("/deleteMenu")
	public JSONObject deleteMenu() {
		String accessToken = AccessTokenUtil.getAccessToken("wxa68469551bd53648", "c988126cef3b5989e90347ac225ccee3")
				.getAccess_token();
		return menuService.getMenuInfo(accessToken);
	}

	/**
	 * ��ѯ�˵�
	 */
	@RequestMapping("/getMenu")
	public JSONObject getMenu() {
		String accessToken = AccessTokenUtil.getAccessToken("wxa68469551bd53648", "c988126cef3b5989e90347ac225ccee3")
				.getAccess_token();
		return menuService.getMenuInfo(accessToken);
	}

}
