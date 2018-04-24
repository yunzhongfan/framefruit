package fruit.weChart.service;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import fruit.bo.commUtils.PropertiesBo;
import fruit.bo.weChart.button.Menu;
import fruit.utils.FileUtils;
import fruit.utils.WeiXinUtil;
import net.sf.json.JSONObject;


/**
 * 菜单管理
 * @author nbc
 *
 */
@Service("menuService")
public class MenuService {
	
	@Autowired
	private  FileUtils fileutils;
	private static Logger log = LoggerFactory.getLogger(MenuService.class);  
    
    
    /** 
     * 1.创建菜单 
     *  
     * @param menu 菜单实例 
     * @param accessToken 有效的access_token 
     * @return 0表示成功，其他值表示失败 
     */  
    public JSONObject createMenu(String accessToken,Menu menu) {  
        //1.获取json字符串：将Menu对象转换为json字符串
        Gson gson = new Gson(); 
        String jsonMenu =gson.toJson(menu);      //使用gson.toJson(user)即可将user对象顺序转成json
        System.out.println("jsonMenu:"+jsonMenu);
        fileutils.getProperties("create_menu_url");
	//2.获取请求的url  
      //  create_menu_url = create_menu_url.replace("ACCESS_TOKEN", accessToken);  
       String create_menu_url = PropertiesBo.getValus().replace("ACCESS_TOKEN", accessToken);

        //3.调用接口,发送请求，创建菜单  
        JSONObject jsonObject = WeiXinUtil.httpRequest(create_menu_url, "POST", jsonMenu);  
        System.out.println("jsonObject:"+jsonObject.toString());

        //4.错误消息处理
        if (null != jsonObject) {  
            if (0 != jsonObject.getInt("errcode")) {  
                log.error("创建菜单失败 errcode:{} errmsg:{}", jsonObject.getInt("errcode"), jsonObject.getString("errmsg"));  
            }  
        }
		return jsonObject;  
    }  
    
    /**
     * 查询自定义的菜单
     * @param accessToken
     * @return
     */
    public  JSONObject  getMenuInfo(String accessToken){
    	fileutils.getProperties("get_menu_url");
    	String get_menu_url = PropertiesBo.getValus().replace("ACCESS_TOKEN", accessToken);
           //3.调用接口,发送请求，创建菜单  
         JSONObject jsonObject = WeiXinUtil.httpRequest(get_menu_url, "GET");
		return jsonObject;
    }
    
    
    /**
     * 删除自定义的菜单
     * @param accessToken
     * @return
     */
    public  JSONObject  deleteMenuInfo(String accessToken){
    	fileutils.getProperties("delete_menu_url");
    	String get_menu_url = PropertiesBo.getValus().replace("ACCESS_TOKEN", accessToken);
           //3.调用接口,发送请求，创建菜单  
         JSONObject jsonObject = WeiXinUtil.httpRequest(get_menu_url, "GET");
		return jsonObject;
    }
    
    
    
    

    

}
