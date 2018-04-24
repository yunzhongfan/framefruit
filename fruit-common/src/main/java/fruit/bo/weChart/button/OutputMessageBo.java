package fruit.bo.weChart.button;


/**
 * 消息自动回复输出
 * @author nbc
 *
 */
public class OutputMessageBo {

	
	
	private  String  ToUserName;
	private  String  FromUserName;
	private  String  MsgType;
	private  String  Content;
	private  Long   CreateTime;
	
	
	public String getToUserName() {
		return ToUserName;
	}
	public void setToUserName(String toUserName) {
		ToUserName = toUserName;
	}
	public String getFromUserName() {
		return FromUserName;
	}
	public void setFromUserName(String fromUserName) {
		FromUserName = fromUserName;
	}
	public String getMsgType() {
		return MsgType;
	}
	public void setMsgType(String msgType) {
		MsgType = msgType;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public Long getCreateTime() {
		return CreateTime;
	}
	public void setCreateTime(Long createTime) {
		CreateTime = createTime;
	}
	
	
	
	
	
	
	
	
	
}
