package com.csm.admin.controller;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.csm.admin.service.StatisticsService;
import com.csm.community.domain.FreeboardVO;
import com.csm.community.domain.PageMake;
import com.csm.community.domain.QuestionboardVO;
import com.csm.community.domain.UnderPage;
import com.csm.community.service.FreeboardService;
import com.csm.community.service.QuestionboardService;
import com.csm.community.utill.CreateNew;
import com.csm.customer.domain.BestMVO;
import com.csm.customer.domain.NoticeVO;
import com.csm.customer.domain.PageMaker;
import com.csm.customer.domain.SearchCriteria;
import com.csm.customer.service.NoticeBoardService;

@Controller
@RequestMapping("admin/adcommunity/*")
public class AdFreeboardController {
	
	@Inject
	private FreeboardService service;
	@Inject
	private NoticeBoardService service3;
	@Inject
	private QuestionboardService service2;
	
	@RequestMapping(value="adcoBoardAlllist", method=RequestMethod.GET)
	public void adcoBoardAlllist(Model model, @ModelAttribute("pm") PageMake pm)throws Exception {
				
		List<FreeboardVO> freeList =  service.listPage(pm);
		
		CreateNew createNew = new CreateNew();
		
		for(FreeboardVO temp : freeList) {
			String result = createNew.addNew(temp);
			temp.setTitle(temp.getTitle()+result);
		}
		model.addAttribute("freeList", freeList);
	
		UnderPage underPage = new UnderPage();
	
		underPage.setPm(pm);
		
		underPage.setTotalCount(service.listCountPaging(pm));
	
		model.addAttribute("UnderPage", underPage);
		
		List<QuestionboardVO> quList = service2.listPage(pm);
		
		CreateNew createNew2 = new CreateNew();
		
		for(QuestionboardVO temp2 : quList) {
			String result2 = createNew2.addNew2(temp2);
			temp2.setTitle(temp2.getTitle()+result2);
		}
		model.addAttribute("quList", quList);
	
		UnderPage underPage2 = new UnderPage();
	
		underPage2.setPm(pm);
		
		underPage2.setTotalCount(service2.listCountPaging(pm));
	
		model.addAttribute("UnderPage2", underPage2);
		
		
	}
	
	@RequestMapping(value="freeread/{bno}", method=RequestMethod.GET)
	public ModelAndView freeread(@PathVariable("bno") int bno , ModelAndView mav) throws Exception{
		
		mav.addObject("list", service.read(bno));
		mav.setViewName("admin/adcommunity/freeread");
		return mav;
	}
	
	
	
	@RequestMapping(value="/freeremove", method=RequestMethod.POST)
	public String remove(@RequestParam("bno") int bno, PageMake pm,
			RedirectAttributes rttr)throws Exception{
		
		service.remove(bno);
		
		rttr.addAttribute("page",pm.getPage());
		rttr.addAttribute("perPageNum", pm.getPerPageNum());
		rttr.addAttribute("SearchType",pm.getSearchType());
		rttr.addAttribute("Keyword",pm.getKeyword());
		
		rttr.addFlashAttribute("msg","success");
		
		return "redirect:/admin/adcommunity/adcoBoardAlllist";
	}
	
	
	@RequestMapping(value="quread/{bno}", method=RequestMethod.GET)
	public ModelAndView quread(@PathVariable("bno") int bno , ModelAndView mav) throws Exception{
		
		mav.addObject("list", service2.read(bno));
		mav.setViewName("admin/adcommunity/quread");
		return mav;
	}
	
	
	@RequestMapping(value="/quremove", method=RequestMethod.POST)
	public String quremove(@RequestParam("bno") int bno, PageMake pm,
			RedirectAttributes rttr)throws Exception{
		QuestionboardVO vo = new QuestionboardVO();
		vo.setBno(bno);
		service2.remove(vo);
		
		rttr.addAttribute("page",pm.getPage());
		rttr.addAttribute("perPageNum", pm.getPerPageNum());
		rttr.addAttribute("SearchType",pm.getSearchType());
		rttr.addAttribute("Keyword",pm.getKeyword());
		
		rttr.addFlashAttribute("msg","success");
		
		return "redirect:/admin/adcommunity/adcoBoardAlllist";
	}
	
	
	
}
