package fruit.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLDecoder;

import org.apache.commons.lang.StringUtils;

import net.sf.json.JSONObject;

public class WeiXinUtil {

	public static JSONObject httpRequest(String url1, String type, String jsonMenu) {

		try {
			// 创建连接
			URL url = new URL(url1);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setDoOutput(true);
			connection.setDoInput(true);
			connection.setRequestMethod(type);
			connection.setUseCaches(false);
			connection.setInstanceFollowRedirects(true);
			connection.setRequestProperty("Content-type", "application/json;");
			connection.addRequestProperty("Charset","UTF-8");//设置字符编码类型

			connection.connect();
			if(StringUtils.isNotBlank(jsonMenu)){
				PrintWriter out = new PrintWriter(new OutputStreamWriter(connection.getOutputStream(),"utf-8")); 
				out.write(jsonMenu);
				out.flush();
				out.close();
			}
			// 读取响应
			BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream(),"UTF-8"));
			String lines;
			StringBuffer sb = new StringBuffer("");
			while ((lines = reader.readLine()) != null) {
				lines = URLDecoder.decode(lines, "utf-8");
				sb.append(lines);
			}
			System.out.println(sb);
			reader.close();
			// 断开连接
			connection.disconnect();
		byte[] bt =	sb.toString().getBytes();
		JSONObject ob1 = JSONObject.fromObject(sb.toString());
		return ob1;
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
		/**
		 * 获取get请求
		 * @param get_menu_url
		 * @param string
		 * @return
		 */
	public static JSONObject httpRequest(String get_menu_url, String string) {
		// TODO Auto-generated method stub
		return null;
	}

}
