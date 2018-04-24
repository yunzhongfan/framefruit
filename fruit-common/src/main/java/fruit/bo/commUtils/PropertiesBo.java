package fruit.bo.commUtils;

import org.springframework.stereotype.Component;

@Component
public class PropertiesBo {
	
	 private   static  String key;  
     private   static  String valus;
     
     
	public static String getKey() {
		return key;
	}
	public static void setKey(String key) {
		PropertiesBo.key = key;
	}
	public static String getValus() {
		return valus;
	}
	public static void setValus(String valus) {
		PropertiesBo.valus = valus;
	}  
     
     

}
