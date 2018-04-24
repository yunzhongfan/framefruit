package fruit.pageDev;

import java.util.Map;

public abstract class AbstractParams {  
    
    /** 
     * 返回请求参数 
     * @return 
     */  
    public abstract Map<String,String> getParams() throws Exception;  
}  
