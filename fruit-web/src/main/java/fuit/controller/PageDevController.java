package fuit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import fruit.pageDev.AuthCodeParams;
import fruit.utils.FileUtils;
import fruit.utils.MD5Util;
import fruit.weChart.service.PageDevService;

/**
 * 
 * 
 * 网页开发--网页授权
 * 
 * @author nbc
 *
 */
public class PageDevController {

	@Autowired
	private PageDevService pageDevService;

	@Autowired
	private FileUtils fileutils;

	/**
	 * 回调URL
	 * 
	 * @param request
	 * @param response
	 * @return
	 * 
	 */
	@RequestMapping("/oauthBind")
	public String oauthBind(HttpServletRequest request, HttpServletResponse response) {
		AuthCodeParams authCodeParams = new AuthCodeParams();
		String redirect_uri = "http://www.liebesy.com/oauth/bindWxPhone.shtml";
		authCodeParams.setRedirect_uri(redirect_uri);
		authCodeParams.setAppid("");
		authCodeParams.setScope(AuthCodeParams.SCOPE_SNSAPIBASE);// 采用静默授权
		authCodeParams.setState(MD5Util.MD5Encode("ceshi", "")); // 防止被攻击,用于校验
		String url = pageDevService.getAuthPath(authCodeParams, fileutils.getProperties(""));
		/** 得到授权的url（一般推送链接或者一个菜单按钮）之后，自己再进一步的实现redirect_uri的业务逻辑 **/
		return url;
	}

}
