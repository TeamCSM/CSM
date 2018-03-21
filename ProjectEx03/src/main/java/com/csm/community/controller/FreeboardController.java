package com.csm.community.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.csm.community.domain.FreeboardVO;
import com.csm.community.domain.PageMake;
import com.csm.community.domain.UnderPage;
import com.csm.community.service.FreeboardService;
import com.csm.community.utill.CreateNew;
import com.csm.customer.domain.NoticeVO;
import com.csm.customer.service.NoticeBoardService;
import com.csm.user.domain.LoginDTO;

@Controller
@RequestMapping("/community/freeboard/*")
public class FreeboardController {
	
	@Inject
	private FreeboardService service;
	@Inject
	private NoticeBoardService service2;
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void registerGET(FreeboardVO freeboard,Model model)throws Exception {
		
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registerPOST(FreeboardVO freeboard,RedirectAttributes rttr, HttpServletRequest req)throws Exception {
		
		
		String ip = req.getRemoteAddr();
		freeboard.setIp(ip);
		service.regist(freeboard, req);
		
		return "redirect:/community/freeboard/listPage";
	}
	
	@RequestMapping(value="/readPage", method=RequestMethod.GET)
	public void read(@RequestParam("bno") int bno, @ModelAttribute("pm") PageMake pm,
			Model model) throws Exception
	{
		service.UpdateViewCount(bno);
		model.addAttribute("boardVO",service.read(bno));
	}
	
	@RequestMapping(value="/removePage", method=RequestMethod.POST)
	public String remove(@RequestParam("bno") int bno, PageMake pm,
			RedirectAttributes rttr)throws Exception{
		
		service.remove(bno);
		
		rttr.addAttribute("page",pm.getPage());
		rttr.addAttribute("perPageNum", pm.getPerPageNum());
		rttr.addAttribute("SearchType",pm.getSearchType());
		rttr.addAttribute("Keyword",pm.getKeyword());
		
		rttr.addFlashAttribute("msg","success");
		
		return "redirect:/community/freeboard/listPage";
	}
	
	@RequestMapping(value="/modifyPage", method=RequestMethod.GET)
	public void modifyGET(@RequestParam("bno") int bno, 
			@ModelAttribute("pm") PageMake pm, Model model)throws Exception{
		
		model.addAttribute("boardVO",service.read(bno));
	}
	
	@RequestMapping(value="/modifyPage", method=RequestMethod.POST)
	public String modifyPOST(FreeboardVO freeboard, 
			PageMake pm, RedirectAttributes rttr)throws Exception{
		
		service.modify(freeboard);
		
		rttr.addFlashAttribute("msg", "modify");
		rttr.addAttribute("page", pm.getPage());
		rttr.addAttribute("perPageNum", pm.getPerPageNum());
		rttr.addAttribute("SearchType",pm.getSearchType());
		rttr.addAttribute("Keyword",pm.getKeyword());
		
		return "redirect:/community/freeboard/listPage";
	}
	
	@RequestMapping(value="/listPage", method=RequestMethod.GET)
	public void listPage(@ModelAttribute("pm") PageMake pm, Model model) throws Exception{
		
		List<FreeboardVO> list = service.listPage(pm);
		List<NoticeVO> list2 = service2.listAll();
		
		CreateNew createNew = new CreateNew();
		
		for(FreeboardVO temp : list) {
			String result = createNew.addNew(temp);
			temp.setTitle(temp.getTitle()+result);
		}
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
	
		UnderPage underPage = new UnderPage();
	
		underPage.setPm(pm);
		
		underPage.setTotalCount(service.listCountPaging(pm));
	
		model.addAttribute("UnderPage", underPage);
	
	}
	
}
