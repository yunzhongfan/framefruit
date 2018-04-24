package fruit.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import fruit.bo.commUtils.PropertiesBo;

/**
 * 一般文件操作的工具类
 * @author nbc
 *
 */
@Component
public class FileUtils {
	@Autowired
	private PropertiesBo bo;
	public  PropertiesBo getProperties(String key){
		    Properties prop =  new  Properties();  
	        InputStream in = this.getClass().getClassLoader().getResourceAsStream("wecharturl.properties");  
	         try  {  
	            prop.load(in);  
	         String   value = prop.getProperty(key.trim()).trim();  
	         if(bo==null){
	        	 bo = new PropertiesBo();
	         }
	         bo.setValus(value);
	         bo.setKey(key);
	         return bo;
	        }  catch  (IOException e) {  
	            e.printStackTrace();  
	        }
			return null;  
	}

}
