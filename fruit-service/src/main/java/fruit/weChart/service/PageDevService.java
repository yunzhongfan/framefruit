package fruit.weChart.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import fruit.bo.commUtils.PropertiesBo;
import fruit.pageDev.AuthCodeParams;

@Service
public class PageDevService {

	public String getAuthPath(AuthCodeParams authCodeParams, PropertiesBo properties) {
		 Map<String,String> params = authCodeParams.getParams();  
		   String  path = HttpReqUtil.setParmas(params, path,"")+"#wechat_redirect";  
		    return path;  
	}

}
