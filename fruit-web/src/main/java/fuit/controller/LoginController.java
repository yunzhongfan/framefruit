package fuit.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import fruit.utils.TokenCheckoutUtil;

/**
 * 
 * ��̨��¼����
 * 
 * @author nbc
 *
 */

@Controller
@RequestMapping("login")
public class LoginController {

	@RequestMapping("/doLogin")
	public String doLogin() {

		return "/login";

	}

	/**
	 * ΢����Ϣ���պ�token��֤
	 * 
	 * @param model
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/checkToken")
	public void checkToken(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		boolean isGet = request.getMethod().toLowerCase().equals("get");
		PrintWriter print;
		if (isGet) {
			// ΢�ż���ǩ��
			String signature = request.getParameter("signature");
			// ʱ���
			String timestamp = request.getParameter("timestamp");
			// �����
			String nonce = request.getParameter("nonce");
			// ����ַ���
			String echostr = request.getParameter("echostr");
			// ͨ������signature���������У�飬��У��ɹ���ԭ������echostr����ʾ����ɹ����������ʧ��
			if (signature != null && TokenCheckoutUtil.checkSignature(signature, timestamp, nonce)) {
				try {
					print = response.getWriter();
					print.write(echostr);
					print.flush();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

}
