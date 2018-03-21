package com.csm.admin.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.csm.customer.domain.BestMVO;
import com.csm.customer.domain.BestQVO;

import com.csm.customer.domain.NoticeVO;
import com.csm.customer.domain.PageMaker;
import com.csm.customer.domain.SearchCriteria;
import com.csm.customer.service.BestMBoardService;
import com.csm.customer.service.BestQBoardService;

import com.csm.customer.service.NoticeBoardService;


@Controller
@RequestMapping("admin/adcustomer/*")
public class AdboardController {
	@Inject
	BestMBoardService bestmService;
	@Inject
	NoticeBoardService notService;
	@Inject
	BestQBoardService bestqService;
	
	@RequestMapping(value="adcuBoardAlllist", method={RequestMethod.GET, RequestMethod.POST})
	public void adcubBoard(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		
		//공지사항 리스트
		List<NoticeVO> notlist =  notService.listSearchCriteria(cri);
		
		model.addAttribute("notlist", notlist);
		
		PageMaker pageMakerNotice = new PageMaker();
		
		pageMakerNotice.setCri(cri);
		pageMakerNotice.getCri().setPerPageNum(5);

		pageMakerNotice.setTotalCount(notService.listSearchCount(cri));
		model.addAttribute("pageMakerNotice", pageMakerNotice);
		
		//1:1 문의 리스트
		List<BestMVO> bestmlist =  bestmService.listSearchCriteria(cri);
		
		model.addAttribute("bestmlist", bestmlist);
		
		PageMaker pageMakerBestM = new PageMaker();
		
		pageMakerBestM.setCri(cri);
		pageMakerBestM.getCri().setPerPageNum(5);

		pageMakerBestM.setTotalCount(bestmService.listSearchCount(cri));
		model.addAttribute("pageMakerBestM", pageMakerBestM);
		
		//베스트퀘스천 리스트
		List<BestQVO> bestqlist =  bestqService.listSearchCriteria(cri);
		
		model.addAttribute("bestqlist", bestqlist);
		
		PageMaker pageMakerBestQ = new PageMaker();
		
		pageMakerBestQ.setCri(cri);
		pageMakerBestQ.getCri().setPerPageNum(5);

		pageMakerBestQ.setTotalCount(bestqService.listSearchCount(cri));
		model.addAttribute("pageMakerBestQ", pageMakerBestQ);
		
	}
	
	//1:1문의
	//상세보기
	@RequestMapping(value="bestmread/{bestm_bno}", method=RequestMethod.GET)
	public ModelAndView bestmread(@PathVariable("bestm_bno") int bno , ModelAndView mav) throws Exception{
		System.out.println("확인");
		BestMVO vo = new BestMVO();
		vo.setBestm_bno(bno);
		mav.addObject("list", bestmService.read(bno));
		mav.setViewName("admin/adcustomer/bestmread");
		return mav;
	}
	//응답확인
	@RequestMapping(value="Answer" , method=RequestMethod.POST)
	public String Answer(BestMVO vo) throws Exception{
		System.out.println("!!!!!!!!!!!!!!!" +vo);
		bestmService.answer(vo);
		
		return "redirect:adcuBoardAlllist" ;
	} 
		
	//1:1문의 영역 끝 
	
	//공지 사항
	
	
	//공지 사항 리스트
	@RequestMapping(value="noticelist", method = {RequestMethod.GET, RequestMethod.POST})
	public void noticelist(Model model) throws Exception{
		model.addAttribute("list", notService.listAll());
	}
	//공지 사항 상세보기
	@RequestMapping(value="noticeread/{notice_bno}", method=RequestMethod.GET)
	public ModelAndView noticeread(@PathVariable("notice_bno") int bno ,  ModelAndView mav) throws Exception{
		System.out.println("확인");
		mav.addObject("list", notService.read(bno));
		mav.setViewName("admin/adcustomer/noticeread");
		return mav;
	}
		
	//공지 사항 삭제하기
	
	@RequestMapping(value = "noticeremove", method = {RequestMethod.GET, RequestMethod.POST})
	public String noticeremove(@RequestParam("bno") int bno, RedirectAttributes rttr) throws Exception{
		System.out.println(bno);
		notService.remove(bno);
		
	    rttr.addFlashAttribute("msg", "SUCCESS");

	    return "redirect:adcuBoardAlllist";
	}
	//공지 사항 글쓰기
	
	@RequestMapping(value="register")
	public void noticewrite() throws Exception{}
	
	//공지 사항 글쓰기(입력)
	@RequestMapping(value = "noticeregister", method = RequestMethod.POST)
	public String registPOST(NoticeVO vo, RedirectAttributes rttr)throws Exception{
		notService.regist(vo);
		
		rttr.addFlashAttribute("msg","SUCCESS");
		
		return "redirect:adcuBoardAlllist";
	}
		
	  @RequestMapping(value = "noticemodify", method = RequestMethod.POST)
	  public String noticemodifyPost(NoticeVO board, RedirectAttributes rttr) throws Exception {
		  System.out.println(board);
		  System.out.println("나옴?");
		  notService.modify(board);
	    
	    rttr.addFlashAttribute("msg", "SUCCESS");

	    return "redirect:/adboard/noticelist";
	  }
	  
	  
	  
	  
	//공지 사항 영역 끝
	
	  
	//자주찾는 
	  
	@RequestMapping(value="bestquestionlist",  method = {RequestMethod.GET, RequestMethod.POST})
	public void bestquestionlist(Model model) throws Exception{
		model.addAttribute("list", bestqService.listAll());
	}
	
	
	@RequestMapping(value="register1")
	public void bestqwrite() throws Exception{}
	
	//자주찾는 글쓰기(입력)
	@RequestMapping(value = "bestquestionwrite", method = RequestMethod.POST)
	public String write(BestQVO vo, RedirectAttributes rttr)throws Exception{
		System.out.println("야호 : " +vo);
		
		bestqService.regist(vo);
		
		rttr.addFlashAttribute("msg","SUCCESS");
		
		return "redirect:adcuBoardAlllist";
	}
	
	@RequestMapping(value="bestquestionwrite")
	public void bestquestionwrite() throws Exception{}
	
	// 02_02. 게시글 작성처리
	@RequestMapping(value = "/bestquestioninsert", method = RequestMethod.POST)
	public String insertFAQ(@ModelAttribute BestQVO vo) throws Exception {
		//bestqService.create(vo);
		return "redirect:bestquestionlist";
	}
	
	
	//공지 사항 상세보기
		
		@RequestMapping(value="bestqread/{bestq_bno}", method=RequestMethod.GET)
		public ModelAndView bestqread(@PathVariable("bestq_bno") int bno ,  ModelAndView mav) throws Exception{
			System.out.println("확인");
			mav.addObject("list", bestqService.read(bno));
			mav.setViewName("admin/adcustomer/bestqread");
			return mav;
		}
			
		//자주찾는 게시판 삭제하기
		
		@RequestMapping(value = "bestqremove", method = {RequestMethod.GET, RequestMethod.POST})
		public String bestqremove(@RequestParam("bno") int bno, RedirectAttributes rttr) throws Exception{
			System.out.println(bno);
			bestqService.remove(bno);
			
		    rttr.addFlashAttribute("msg", "SUCCESS");

		    return "redirect:adcuBoardAlllist";
		}
	
	//자주찾는 끝	
	
}
