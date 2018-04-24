package fruit.utils;

import java.io.IOException;
import java.io.InputStream;
import java.io.Writer;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.core.util.QuickWriter;
import com.thoughtworks.xstream.io.HierarchicalStreamWriter;
import com.thoughtworks.xstream.io.xml.PrettyPrintWriter;
import com.thoughtworks.xstream.io.xml.XppDriver;

import fruit.bo.weChart.button.OutputMessageBo;

/**
 * xml转换工具
 * 
 * @author nbc
 *
 */
public class SerializeXmlUtil {

	/**
	 * xml转map
	 * 
	 * @param req
	 * @return
	 * @throws IOException
	 * @throws DocumentException
	 */
	@SuppressWarnings("unchecked")
	public static Map<String, String> xmlToMap(HttpServletRequest req) throws IOException, DocumentException {
		Map<String, String> map = new HashMap<String, String>();
		SAXReader reader = new SAXReader();
		InputStream in = req.getInputStream();
		Document doc = reader.read(in);
		Element root = doc.getRootElement();
		List<Element>  list = root.elements();
		for(Element  el:list){
			map.put(el.getName(),el.getText());
		}
		
		/*	Iterator<Element> it = root.elementIterator();
		while (it.hasNext()) {
			map.put(it.next().getName(), it.next().getText());
		}*/
		return map;
	}

	/**
	 * 对象转换为xml
	 * @param output
	 * @return
	 */
	public static String beanToXML(OutputMessageBo output) {
		
	//	XStream  xStream = new XStream();
		xstream.alias("xml", OutputMessageBo.class);
		return xstream.toXML(output);
	}
	
	
	
	 /**
    *
    * 定义xstream让value自动加上CDATA标签
    */
   private static XStream xstream = new XStream(new XppDriver() {
       public HierarchicalStreamWriter createWriter(Writer out) {
           return new PrettyPrintWriter(out) {
               boolean cdata = false;
               @SuppressWarnings("unchecked")
               public void startNode(String name, Class clazz) {

                   if (!name.equals("xml")) {
                       char[] arr = name.toCharArray();
                       if (arr[0] >= 'a' && arr[0] <= 'z') {
                           // arr[0] -= 'a' - 'A';
                           arr[0] = (char) ((int) arr[0] - 32);
                       }
                       name = new String(arr);
                   }

                   super.startNode(name, clazz);

               }

               @Override
               public void setValue(String text) {

                   if (text != null && !"".equals(text)) {
                       Pattern patternInt = Pattern
                               .compile("[0-9]*(\\.?)[0-9]*");
                       Pattern patternFloat = Pattern.compile("[0-9]+");
                       if (patternInt.matcher(text).matches()
                               || patternFloat.matcher(text).matches()) {
                           cdata = false;
                       } else {
                           cdata = true;
                       }
                   }
                   super.setValue(text);
               }

               protected void writeText(QuickWriter writer, String text) {
                   if (cdata) {
                       writer.write("<![CDATA[");
                       writer.write(text);
                       writer.write("]]>");
                   } else {
                       writer.write(text);
                   }
               }
           };
       }

   });
	
}
