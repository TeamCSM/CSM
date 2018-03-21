package com.csm.matching.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.csm.matching.domain.ProgramVO;
import com.csm.matching.domain.ResumeVO;
import com.csm.matching.service.DesignService;
import com.csm.matching.service.ProgramService;
import com.csm.matching.service.ResumeService;
import com.csm.user.domain.LoginDTO;
import com.csm.user.domain.UserVO;
import com.csm.user.service.UserService;

@Controller
@RequestMapping("/program/*")
public class ProgramController {
	private static final Logger logger = LoggerFactory.getLogger(ProgramController.class);
	
	@Inject
	private ProgramService pService;
	
	@Inject
	private DesignService dService;
	
	@Inject
	private ResumeService rService;
	
	@Inject
	private UserService uService;
	
	@RequestMapping(value ="/pUpdate", method = RequestMethod.POST)
	public String update(ProgramVO program, Model model, @RequestParam("uno") int uno, ResumeVO vo) throws Exception {
		System.out.println("확인 "+vo);
		pService.update(program);
		rService.accept(uno, vo);
		
		model.addAttribute("msg", "success");
		
		return "/matching/resume/resume";
	}
	
	@RequestMapping(value ="/register", method = RequestMethod.GET)
	public String registerGET(ProgramVO program, Model model, HttpSession session) throws Exception {
		logger.info("register get............");
		LoginDTO dto = (LoginDTO) session.getAttribute("login");
		
		return "/matching/program/register";
	}
	
	@RequestMapping(value ="/register", method = RequestMethod.POST)
	public String registPOST(ProgramVO program, DesignVO design, RedirectAttributes rttr) throws Exception {
		logger.info("regist post.......");
		logger.info(program.toString());
		logger.info(design.toString());
		
		pService.regist(program);
		dService.regist(design);
		
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/program/listAll";
	}
	
	@RequestMapping(value ="/listAll", method = RequestMethod.GET)
	public String listAll(@ModelAttribute("cri")Criteria cri, Model model) throws Exception {
		logger.info(cri.toString());
		
		model.addAttribute("list", pService.listAll(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(pService.listCountCriteria(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "/matching/program/programListAll";
	}
	
	@RequestMapping(value ="/read", method = RequestMethod.GET)
	public String read(@RequestParam("idx") int idx, Model model, HttpSession session) throws Exception{
		LoginDTO dto = (LoginDTO) session.getAttribute("login");
		model.addAttribute(pService.read(idx));
		model.addAttribute("rlist", rService.listAll(idx));
		
		return "/matching/program/read";
	}
	
	@RequestMapping(value ="/remove", method = {RequestMethod.GET, RequestMethod.POST})
	public String remove(@RequestParam("idx") int idx, RedirectAttributes rttr) throws Exception {
		pService.remove(idx);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/program/listAll";
	}
	
	@RequestMapping(value ="/modify", method = RequestMethod.GET)
	public String modifyGET(@RequestParam("idx") int idx, Model model) throws Exception {
		model.addAttribute(pService.read(idx));
		
		return "/matching/program/modify";
	}
	
	@RequestMapping(value ="/modify", method = RequestMethod.POST)
	public String modifyPOST(ProgramVO program, RedirectAttributes rttr) throws Exception {
		logger.info("mod post.....");
		
		pService.modify(program);
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/program/listAll";
	}
	
	@RequestMapping(value="/resume", method = RequestMethod.GET)
	public String resumeGET(HttpSession session, Model model, UserVO vo) throws Exception {
		LoginDTO dto = (LoginDTO) session.getAttribute("login");
		vo = uService.userInfo(dto.getUser_id());
		model.addAttribute("resume", vo);
		
		return "/matching/resume/resume";
	}
	
	@RequestMapping(value ="/resume", method = RequestMethod.POST)
	public String resumePOST(ResumeVO resume, Model model) throws Exception {		
		rService.resume(resume);
		
		model.addAttribute("msg", "success");
		
		return "/matching/resume/resume";
	}
	
	@RequestMapping(value ="/resumeRead", method = RequestMethod.GET)
	public String resumeRead(@RequestParam("uno") int uno, Model model) throws Exception {	
		model.addAttribute("resumeVO", rService.read(uno));
		
		return "/matching/resume/resumeList";
	}
	
	@RequestMapping(value ="/delete", method = {RequestMethod.GET, RequestMethod.POST})
	public String delete(@RequestParam("uno") int uno, Model model) throws Exception {
		rService.delete(uno);
		
		model.addAttribute("msg", "success");
		
		return "/matching/resume/resume";
	}

}
