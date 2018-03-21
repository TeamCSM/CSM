package com.csm.customer.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

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

import com.csm.customer.domain.BestMVO;
import com.csm.customer.domain.PageMaker;
import com.csm.customer.domain.SearchCriteria;
import com.csm.customer.service.BestMBoardService;

@Controller
@RequestMapping("/customer/sBestm/*")
public class BestMSearchController {
	private static final Logger logger = LoggerFactory.getLogger(BestMSearchController.class);

	@Inject
	private BestMBoardService service;
	
	@RequestMapping(value= "register", method = RequestMethod.GET)
	public void registerGet(BestMVO board, Model model)throws Exception{
		
		logger.info("register get......");
	}
	
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String registPOST(BestMVO board, RedirectAttributes rttr)throws Exception{
		logger.info("regist post......");
		logger.info(board.toString());
		
		service.regist(board);
		
		rttr.addFlashAttribute("msg","SUCCESS");
		
		return "redirect:/customer/sBestm/list";
	}
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

		logger.info(cri.toString());

		//model.addAttribute("list", service.listCriteria(cri));
		model.addAttribute("list", service.listSearchCriteria(cri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		//pageMaker.setTotalCount(service.listCountCriteria(cri));
		pageMaker.setTotalCount(service.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
	@RequestMapping(value = "readPage", method = RequestMethod.GET)
	public void read(@RequestParam("bno") int bno, @ModelAttribute("cri") SearchCriteria cri, Model model)
			throws Exception {

		model.addAttribute("list", service.read(bno));
	}
	@RequestMapping(value = "removePage", method = RequestMethod.POST)
	  public String remove(@RequestParam("bno") int bno, SearchCriteria cri, RedirectAttributes rttr) throws Exception {

	    service.remove(bno);

	    rttr.addAttribute("page", cri.getPage());
	    rttr.addAttribute("perPageNum", cri.getPerPageNum());
	    rttr.addAttribute("searchType", cri.getSearchType());
	    rttr.addAttribute("keyword", cri.getKeyword());

	    rttr.addFlashAttribute("msg", "SUCCESS");

	    return "redirect:/customer/sBestm/list";
	  }
	@RequestMapping(value = "modifyPage", method = RequestMethod.GET)
	  public void modifyPagingGET(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

	    model.addAttribute(service.read(bno));
	  }
	 @RequestMapping(value = "modifyPage", method = RequestMethod.POST)
	  public String modifyPagingPOST(BestMVO board, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		System.out.println(board);
	    logger.info(cri.toString());
	    service.modify(board);

	    rttr.addAttribute("page", cri.getPage());
	    rttr.addAttribute("perPageNum", cri.getPerPageNum());
	    rttr.addAttribute("searchType", cri.getSearchType());
	    rttr.addAttribute("keyword", cri.getKeyword());
	    rttr.addFlashAttribute("msg", "SUCCESS");

	    logger.info(rttr.toString());

	    return "redirect:/customer/sBestm/list";
	  }
		@RequestMapping(value = "body", method = RequestMethod.GET)
		public void listPages(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
	}
		@RequestMapping(value = "listSearch", method = RequestMethod.GET)
		public ResponseEntity<Map<String, Object>> listSearch(@ModelAttribute("cri") 
				SearchCriteria cri) {
			
			ResponseEntity<Map<String , Object>> entity = null;
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			logger.info(cri.toString());
			try {
			//model.addAttribute("list", service.listCriteria(cri));
			map.put("list", service.listSearchCriteria(cri));
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			
			//pageMaker.setTotalCount(service.listCountCriteria(cri));
			
			pageMaker.setTotalCount(service.listSearchCount(cri));
			
			map.put("pageMaker", pageMaker);
			entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
			}
			catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
}
