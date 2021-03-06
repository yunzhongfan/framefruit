package fruit.utils;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.TimerTask;

import fruit.bo.weChart.button.AccessToken;
import net.sf.json.JSONObject;

/**
 * 定时获取Access_Token
 * 
 * @author nbc
 *
 */

public class AccessTokenUtil {

	
	
	// 1、定义一个Access_Token类存储accessToken的信息：
	private String access_token;
	// 获取到的access_token
	private int expires_in; // 有效时间（两个小时，7200s）

	// 2、编写AccessTokenUtil获取accessToken
	/**
	 * 获取accessToken
	 * 
	 * @param appID
	 *            微信公众号凭证
	 * @param appScret
	 *            微信公众号凭证秘钥
	 * @return
	 */
	public static  AccessToken getAccessToken(String appID, String appScret) {
		AccessToken token = new AccessToken();
		// 访问微信服务器
		String url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=" + appID + "&secret="
				+ appScret;
		try {
			URL getUrl = new URL(url);
			HttpURLConnection http = (HttpURLConnection) getUrl.openConnection();
			http.setRequestMethod("GET");
			http.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			http.setDoOutput(true);
			http.setDoInput(true);

			http.connect();
			InputStream is = http.getInputStream();
			int size = is.available();
			byte[] b = new byte[size];
			is.read(b);

			String message = new String(b, "UTF-8");

			JSONObject json = JSONObject.fromObject(message);

			token.setAccess_token(json.getString("access_token"));
			token.setExpires_in(new Integer(json.getString("expires_in")));
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return token;
	}

}
