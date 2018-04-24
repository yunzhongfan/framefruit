package fruit.utils;


/**
 * 消息回复，消息类型
 * @author nbc
 *
 */
public enum MsgType {
	Image("image"), Text("text");
	
	
	private  String  code;
	MsgType(String str){
		this.code = str;
	}
	public String getCode() {
		return code;
	}

}
