package fuit.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import fruit.weChart.service.NoteService;


/**
 * 消息管理
 * @author nbc
 *
 */
@Controller
@RequestMapping("Note")
public class NoteController {
	
	@Autowired
	private  NoteService noteService;
	
	
	@RequestMapping("/Autoresponse")
	public  void autoResponseNote(HttpServletRequest req,HttpServletResponse rep) throws IOException {
				String  xml = noteService.acceptMessage(req, rep);  
				System.out.println(xml);
				req.setCharacterEncoding("UTF-8");
				req.setCharacterEncoding("UTF-8");
			    PrintWriter io = rep.getWriter();
				io.write(xml);
				io.close();
	}

}
