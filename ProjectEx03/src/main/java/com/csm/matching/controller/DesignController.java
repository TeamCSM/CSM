package com.csm.matching.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.csm.matching.domain.Criteria;
import com.csm.matching.domain.DesignVO;
import com.csm.matching.domain.PageMaker;
import com.csm.matching.domain.ResumeVO;
import com.csm.matching.service.DesignService;
import com.csm.matching.service.ResumeService;
import com.csm.user.domain.LoginDTO;

@Controller
@RequestMapping("/design/*")
public class DesignController {
private static final Logger logger = LoggerFactory.getLogger(DesignController.class);
	
	@Inject
	private DesignService service;
	
	@Inject
	private ResumeService rService;
	
	@RequestMapping(value ="/dUpdate", method = RequestMethod.POST)
	public String update(DesignVO design, Model model, @RequestParam("uno") int uno, ResumeVO vo) throws Exception {
		service.update(design);
		rService.accept(uno, vo);
		
		model.addAttribute("msg", "success");
		
		return "/matching/resume/resume";
	}
	
	@RequestMapping(value ="/register", method = RequestMethod.GET)
	public String registerGET(DesignVO design, Model model, HttpSession session) throws Exception {
		logger.info("register get............");
		LoginDTO dto = (LoginDTO) session.getAttribute("login");
		
		return "/matching/program/register";
	}
	
	@RequestMapping(value ="/register", method = RequestMethod.POST)
	public String registPOST(DesignVO design, RedirectAttributes rttr) throws Exception {
		logger.info("regist post.......");
		logger.info(design.toString());
		
		service.regist(design);
		
		rttr.addFlashAttribute("msg", "success");
		
		//return "/program/success";
		return "redirect:/program/listAll";
	}
	
	@RequestMapping(value ="/listAll", method = RequestMethod.GET)
	public String listAll(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		logger.info(cri.toString());
		
		model.addAttribute("list", service.listAll(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.listCountCriteria(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "/matching/design/designListAll";
	}
	
	@RequestMapping(value ="/read", method = RequestMethod.GET)
	public String read(@RequestParam("idx") int idx, Model model, HttpSession session) throws Exception{
		LoginDTO dto = (LoginDTO) session.getAttribute("login");
		model.addAttribute(service.read(idx));
		model.addAttribute("rlist", rService.listAll(idx));
		
		return "/matching/design/read";
	}
	
	@RequestMapping(value ="/remove", method = {RequestMethod.GET, RequestMethod.POST})
	public String remove(@RequestParam("idx") int idx, RedirectAttributes rttr) throws Exception {
		service.remove(idx);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/design/listAll";
	}
	
	@RequestMapping(value ="/modify", method = RequestMethod.GET)
	public String modifyGET(@RequestParam("idx") int idx, Model model) throws Exception {
		model.addAttribute(service.read(idx));
		
		return "/matching/design/modify";
	}
	
	@RequestMapping(value ="/modify", method = RequestMethod.POST)
	public String modifyPOST(DesignVO design, RedirectAttributes rttr) throws Exception {
		logger.info("mod post.....");
		
		service.modify(design);
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/design/listAll";
	}

}
