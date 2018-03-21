package com.csm.user.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger; 
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.csm.user.domain.LoginDTO;
import com.csm.user.domain.messageVO;
import com.csm.user.service.MessageSevice;

@Controller
@RequestMapping("/user/message/*")
public class MessageController {
	
	@Inject
	private MessageSevice service;
	
	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
	
	@RequestMapping(value = "messageHome", method = RequestMethod.GET)
	public void Message() throws Exception {
		
	}
	@RequestMapping(value = "myPage", method = RequestMethod.GET)
	public void myPage() throws Exception {
		
	}
	
	@RequestMapping(value = "register", method = RequestMethod.GET)
	public void registerGET(HttpSession session, Model model) throws Exception {
		
	}
	
	
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String registerPOST(messageVO board, 
			RedirectAttributes rttr,
			HttpSession session,
			Model model) throws Exception {
		int cnt = 0;
		logger.info("regist post......");
		logger.info(board.toString());
		
		int dd = service.userCheck(board);
		
		if(dd>0) {
			
			service.regist(board);
			rttr.addFlashAttribute("msg","SUCCESS");
		}
		else{
			rttr.addFlashAttribute("msg","FAIL");
		}
		return "redirect:/user/message/messageHome";	
	}
	
	//마이 메세지
	@RequestMapping(value = "myMessage", method = RequestMethod.GET)
	public void myMassage(HttpSession session, 
			RedirectAttributes rttr, 
			Model model,
			messageVO vo)throws Exception {
			
		LoginDTO login =  (LoginDTO)session.getAttribute("login");
		
		if(login.getUser_id()!=null) {
			model.addAttribute("myMessage", service.myMassage(login));
		}
		else {
		rttr.addFlashAttribute("msg", "FAIL");
		}		
	}
	
	@RequestMapping(value = "yourMessage", method = RequestMethod.GET)
	public void messageList(HttpSession session, 
			RedirectAttributes rttr, 
			Model model,
			messageVO vo)throws Exception {

		LoginDTO login =  (LoginDTO)session.getAttribute("login");
		
		if(login.getUser_id()!=null) {
			model.addAttribute("yourMessage", service.yourMassge(login));
		}
		else {
		rttr.addFlashAttribute("msg", "FAIL");
		}		
	}
	@RequestMapping(value = "readPage", method = RequestMethod.GET)
	public void yourreadPage(HttpSession session, 
			@RequestParam("messagenum") int messagenum, 
			String type,
			Model model)
			throws Exception {
		
		service.readCheck(messagenum, type);
		model.addAttribute("type", type);
		model.addAttribute("list", service.readMessage(messagenum));
	}
	
	@RequestMapping(value = "removePage", method = RequestMethod.POST)
	  public String remove(@RequestParam("messagenum") int messagenum, RedirectAttributes rttr) throws Exception {

	    service.remove(messagenum);
	    
	    rttr.addFlashAttribute("msg", "SUCCESS");

	    return "redirect:/user/sBestm/list";
	  }
}
