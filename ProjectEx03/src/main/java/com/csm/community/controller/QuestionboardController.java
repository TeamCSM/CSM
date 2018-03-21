package com.csm.community.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.csm.community.domain.FreeboardVO;
import com.csm.community.domain.PageMake;
import com.csm.community.domain.QuestionboardVO;
import com.csm.community.domain.ReplyVO;
import com.csm.community.domain.UnderPage;
import com.csm.community.domain.UserActionVO;
import com.csm.community.service.QuestionboardService;
import com.csm.community.service.UserActionService;
import com.csm.community.utill.CreateNew;
import com.csm.customer.domain.NoticeVO;
import com.csm.customer.service.NoticeBoardService;
import com.csm.user.domain.LoginDTO;
import com.csm.user.domain.UserVO;

@Controller
@RequestMapping("/community/questionboard/*")
public class QuestionboardController {
	
	@Inject
	private QuestionboardService service;
	@Inject
	private NoticeBoardService service2;
	@Inject
	private UserActionService actionservice;
	
	@RequestMapping(value="/point", method=RequestMethod.POST)
	public ResponseEntity<String> pointPOST(UserVO vo, HttpSession session) throws Exception{
		
		LoginDTO dto = (LoginDTO) session.getAttribute("login");
		
		ResponseEntity<String> entity = null;
		try {
			vo.setUser_id(dto.getUser_id());
			UserVO uservo = service.checkPoint(vo);
			if(uservo != null) {
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
			}
			else {
				entity = new ResponseEntity<String>("fail", HttpStatus.OK);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	/*채택전용 메소드*/
	@RequestMapping(value="/choiceId", method=RequestMethod.POST)
	public ResponseEntity<String> choiceIdPOST(UserVO vo,QuestionboardVO questionboardVO, 
			String choice_writer, Integer choice_bno, HttpSession session) throws Exception{

		LoginDTO logindto = (LoginDTO) session.getAttribute("login");
		questionboardVO.setWriter(logindto.getUser_id());
		
		QuestionboardVO answer = new QuestionboardVO();
		answer.setWriter(choice_writer);
		answer.setBno(choice_bno);
		
		ResponseEntity<String> entity = null;
		try {
				service.updateCheckCount(questionboardVO, answer);
				entity = new ResponseEntity<String>("success", HttpStatus.OK);	
		}
		catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void registerGET() throws Exception{
		
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registerPOST(QuestionboardVO questionboard,UserVO vo,HttpSession session,RedirectAttributes rttr, HttpServletRequest req)throws Exception {
		
		/*포인트 가져오기*/
		LoginDTO logindto = (LoginDTO)session.getAttribute("login");
		vo.setUser_id(logindto.getUser_id());
		vo.setUser_point(questionboard.getPoint());
		
		String ip = req.getRemoteAddr();
		questionboard.setIp(ip);
		service.regist(questionboard, vo);
		
		
		return "redirect:/community/questionboard/listPage";
	}
	
	@RequestMapping(value="/readPage", method=RequestMethod.GET)
	public void read(@RequestParam("bno") int bno, @RequestParam("bgroup") int bgroup,
	@ModelAttribute("pm") PageMake pm,Model model,QuestionboardVO questionboardVO) throws Exception
	{
		service.UpdateViewCount(bno);
		System.out.println(questionboardVO);
		List<QuestionboardVO> answerList = service.AnswerListPage(pm);
		model.addAttribute("boardVO",service.read(bno));
		model.addAttribute("answerList", answerList);
	
		UnderPage underPage = new UnderPage();
		
		underPage.setPm(pm);
		
		underPage.setTotalCount(service.listCountPaging(pm));

		model.addAttribute("questionboardVO", questionboardVO);
		model.addAttribute("UnderPage", underPage);
	}
	
	@RequestMapping(value="/modifyPage", method=RequestMethod.GET)
	public void modifyGET(@RequestParam("bno") int bno, 
			@ModelAttribute("pm") PageMake pm, Model model)throws Exception{
		
		model.addAttribute("boardVO",service.read(bno));
	}
	
	@RequestMapping(value="/modifyPage", method=RequestMethod.POST)
	public String modifyPOST(QuestionboardVO questionboard, 
			PageMake pm, RedirectAttributes rttr)throws Exception{
		
		service.modify(questionboard);
		
		rttr.addFlashAttribute("msg", "modify");
		rttr.addAttribute("page", pm.getPage());
		rttr.addAttribute("perPageNum", pm.getPerPageNum());
		rttr.addAttribute("SearchType",pm.getSearchType());
		rttr.addAttribute("Keyword",pm.getKeyword());
		
		return "redirect:/community/questionboard/listPage";
	}
	
	@RequestMapping(value="/removePage", method=RequestMethod.POST)
	public String remove(QuestionboardVO questionboardVO, PageMake pm,
			RedirectAttributes rttr)throws Exception{
		
		service.remove(questionboardVO);
		
		rttr.addAttribute("page",pm.getPage());
		rttr.addAttribute("perPageNum", pm.getPerPageNum());
		rttr.addAttribute("SearchType",pm.getSearchType());
		rttr.addAttribute("Keyword",pm.getKeyword());
		
		rttr.addFlashAttribute("msg","success");
		
		return "redirect:/community/questionboard/listPage";
	}
	
	@RequestMapping(value="/answerReply", method=RequestMethod.GET)
	public void answerGET(@RequestParam("bno") int bno, 
			@ModelAttribute("pm") PageMake pm, Model model) throws Exception{
		
		model.addAttribute("boardVO",service.read(bno));
	}
	
	@RequestMapping(value="/answerReply", method=RequestMethod.POST)
	public String answerPOST(QuestionboardVO questionboard, 
			@ModelAttribute("pm") PageMake pm, RedirectAttributes rttr) throws Exception{
		
		service.answerRegist(questionboard);
		service.answer(questionboard);
		service.UpdateReplyCount(questionboard.getBgroup());
		
		rttr.addAttribute("page", pm.getPage());
		rttr.addAttribute("perPageNum", pm.getPerPageNum());
		rttr.addAttribute("SearchType",pm.getSearchType());
		rttr.addAttribute("Keyword",pm.getKeyword());
		
		return "redirect:/community/questionboard/listPage";
	}
	
	/*좋아요 관련 메소드*/
	@RequestMapping(value="/likenum",method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> likenum(HttpSession session,UserActionVO useractionVO,QuestionboardVO questionboardVO) throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		
		LoginDTO logindto = (LoginDTO) session.getAttribute("login");
		
		Map<String, Object> paramMap = new HashMap<>();
		
		try {
			
				if(logindto != null) {
					
					useractionVO.setUser_id(logindto.getUser_id());
					useractionVO.setUser_flag(questionboardVO.getBno());
					
					int likecheckaction = actionservice.likeAction(useractionVO);
					if(likecheckaction == 0) {
						
						service.updateLikenum(questionboardVO);
						
						actionservice.insertLike(useractionVO);
						
						paramMap.put("result", "success");
						
						QuestionboardVO vo = service.answerRead(questionboardVO);
						
						paramMap.put("likeNumGain", vo.getLikenum());
					}else {
						paramMap.put("result", "limit");
					}
				}else {
					paramMap.put("result", "fail");
				}
				entity = new ResponseEntity<Map<String, Object>>(paramMap, HttpStatus.OK);
		}
		catch(Exception e) {
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	@RequestMapping(value="/listPage", method=RequestMethod.GET)
	public void listPage(@ModelAttribute("pm") PageMake pm, Model model) throws Exception{
		
		List<QuestionboardVO> list = service.listPage(pm);
		List<NoticeVO> list2 = service2.listAll();
		
		CreateNew createNew = new CreateNew();
		
		for(QuestionboardVO temp : list) {
			String result = createNew.addNew2(temp);
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
