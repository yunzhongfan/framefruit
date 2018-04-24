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
 * ��ҳ����--��ҳ��Ȩ
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
	 * �ص�URL
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
		authCodeParams.setScope(AuthCodeParams.SCOPE_SNSAPIBASE);// ���þ�Ĭ��Ȩ
		authCodeParams.setState(MD5Util.MD5Encode("ceshi", "")); // ��ֹ������,����У��
		String url = pageDevService.getAuthPath(authCodeParams, fileutils.getProperties(""));
		/** �õ���Ȩ��url��һ���������ӻ���һ���˵���ť��֮���Լ��ٽ�һ����ʵ��redirect_uri��ҵ���߼� **/
		return url;
	}

}
