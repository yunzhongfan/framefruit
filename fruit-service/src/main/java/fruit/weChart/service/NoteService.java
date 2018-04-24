package fruit.weChart.service;

import java.io.IOException;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.DocumentException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import fruit.bo.weChart.button.Menu;
import fruit.bo.weChart.button.OutputMessageBo;
import fruit.utils.SerializeXmlUtil;

/**
 * ��Ϣ����ҵ���߼�
 * @author nbc
 *
 */
@Service
public class NoteService {
	private static Logger log = LoggerFactory.getLogger(NoteService.class);  
	
	/**
	 * ������Ϣ����Ӧ������
	 * @param req
	 * @param rep
	 * @return 
	 */
	public String acceptMessage(HttpServletRequest req, HttpServletResponse rep) {
		try {
			
			Map<String, String> map = SerializeXmlUtil.xmlToMap(req);
				String  toUserName = map.get("ToUserName");
				String  fromUserName = map.get("FromUserName");
				String  createTime = map.get("CreateTime");
				String  msgType = map.get("MsgType");
				String  content = map.get("Content");
				String  event = map.get("Event");
				//String  msgId = map.get("MsgId");
				//�ı����͵���Ϣ 
				if("text".equals(msgType)){
					OutputMessageBo output = new OutputMessageBo();
					output.setContent("欢迎您的关注："+content);
					output.setCreateTime(new Date().getTime());
					output.setFromUserName(toUserName);
					output.setMsgType("text");
					output.setToUserName(fromUserName);
					String xml = SerializeXmlUtil.beanToXML(output); 
					log.info(xml);
					return xml;
				}
				//��ע/ȡ���¼�
				if("event".equals(msgType)){
					//��ע�¼�
					if("subscribe".equals(event)){
						 String mycontent = Menu.autoFllowText();
						 OutputMessageBo output = new OutputMessageBo();
							output.setContent(mycontent);
							output.setCreateTime(new Date().getTime());
							output.setFromUserName(toUserName);
							output.setMsgType("text");
							output.setToUserName(fromUserName);
							String xml = SerializeXmlUtil.beanToXML(output); 
							log.info(xml);
							return xml;
					}
					
				}	
		} catch (IOException e) {
				e.printStackTrace();
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		return null;
		
		
	}

}
