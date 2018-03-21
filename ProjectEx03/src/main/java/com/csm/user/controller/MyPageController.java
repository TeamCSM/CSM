package com.csm.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.csm.market.domain.SellItemLogVO;
import com.csm.market.service.MarketService;
import com.csm.market.util.Excel;
import com.csm.matching.service.ResumeService;
import com.csm.user.domain.LoginDTO;
import com.csm.user.domain.UserVO;
import com.csm.user.service.UserService;
import com.csm.user.util.SHA256Util;

@Controller
@RequestMapping("user/myPage/*")
public class MyPageController {
	@Inject
	private UserService uService;

	@Inject
	private ResumeService rService;

	@Inject
	private MarketService mService;

	@RequestMapping(value="/myPageHome", method = RequestMethod.GET)
	public void myPage(HttpSession session, Model model) throws Exception {
		LoginDTO dto = (LoginDTO) session.getAttribute("login");
		model.addAttribute("myPage", uService.userInfo(dto.getUser_id()));
		model.addAttribute("buy", uService.buyList(dto.getUser_id()));
		model.addAttribute("inquiry", uService.itemInquiry(dto.getUser_id()));
		model.addAttribute("review", uService.itemReview(dto.getUser_id()));
		model.addAttribute("message", uService.messageCheck(dto.getUser_id()));
	}

	@RequestMapping(value="/passwordCheck", method = RequestMethod.GET)
	public void passwordCheckGET(Model model, HttpSession session) throws Exception {
		LoginDTO dto = (LoginDTO) session.getAttribute("login");
	}

	@RequestMapping(value="/passwordCheck", method = RequestMethod.POST)
	public String passwordCheckPOST(UserVO vo, Model model) throws Exception {
		SHA256Util sha = new SHA256Util();
		vo.setUser_pass(sha.encryptSHA256(vo.getUser_pass()));

		UserVO check = uService.passwordCheck(vo);

		if(check == null) {
			model.addAttribute("msg", "비밀번호를 확인해주세요.");
			return "redirect:/user/myPage/passwordCheck";
		}

		return "redirect:/user/myPage/userModify";
	}

	@RequestMapping(value="/userModify", method = RequestMethod.GET)
	public void userModifyGET(HttpSession session, Model model) throws Exception {
		LoginDTO dto = (LoginDTO) session.getAttribute("login");
		model.addAttribute("modify", uService.userInfo(dto.getUser_id()));
	}

	@RequestMapping(value="/userModify", method = RequestMethod.POST)
	public String userModifyPOST(UserVO vo, LoginDTO dto, HttpSession session) throws Exception {
		uService.modify(vo);
		//session.setAttribute("login", dto);

		return "redirect:/user/myPage/myPageHome";
	}

	@RequestMapping(value="/passwordModify", method = RequestMethod.GET)
	public void passwordModifyGET(HttpSession session, Model model) throws Exception {
		LoginDTO dto = (LoginDTO) session.getAttribute("login");
		model.addAttribute("modify", uService.userInfo(dto.getUser_id()));
	}

	@RequestMapping(value="/passwordModify", method = RequestMethod.POST)
	public String passwordModifyPOST(UserVO vo, HttpSession session, Model model) throws Exception {
		LoginDTO dto = (LoginDTO) session.getAttribute("login");

		SHA256Util sha = new SHA256Util();
		vo.setUser_pass(sha.encryptSHA256(vo.getUser_pass()));
		vo.setUser_newPass(sha.encryptSHA256(vo.getUser_newPass()));

		if(!(dto.getUser_pass().equals(vo.getUser_pass()))) {
			model.addAttribute("msg", "기존 비밀번호를 확인해주세요.");
			return "redirect:/user/myPage/passwordModify";
		}

		uService.passModify(vo);

		return "redirect:/user/myPage/myPageHome";
	}

	@RequestMapping(value="/delete", method = {RequestMethod.GET, RequestMethod.POST})
	public String delete(HttpSession session) throws Exception {
		LoginDTO dto = (LoginDTO) session.getAttribute("login");
		uService.delete(dto.getUser_id());

		session.removeAttribute("login");

		return "home";
	}

	@RequestMapping(value="/resumeStatistics", method = RequestMethod.GET)
	public String resumeStatistics(Model model, HttpSession session) throws Exception {
		LoginDTO dto = (LoginDTO) session.getAttribute("login");

		model.addAttribute("resume", rService.resumeStatistics(dto.getUser_id()));	
		model.addAttribute("read", rService.readResume(dto.getUser_id()));
		model.addAttribute("contrastResume", rService.contrastStatistics(dto.getUser_id()));
		model.addAttribute("contrastReadResume", rService.contrastReadStatistics(dto.getUser_id()));

		return "/user/myPage/resumeStatistics";
	}

	@RequestMapping(value="/pointPayment", method = RequestMethod.GET)
	public String pointPaymentGET(Model model, HttpSession session) throws Exception {
		LoginDTO dto = (LoginDTO) session.getAttribute("login");
		model.addAttribute("point", uService.userInfo(dto.getUser_id()));

		return "/user/myPage/pointPayment";
	}

	@RequestMapping(value="/pointPayment", method = RequestMethod.POST)
	public String pointPaymentPOST(Model model, UserVO vo) throws Exception {
		uService.pointPayment(vo);
		model.addAttribute("msg", "success");

		return "/user/myPage/pointPayment";
	}

	@RequestMapping(value="/pointWithdraw", method = RequestMethod.GET)
	public String pointWithdrawGET(Model model, HttpSession session) throws Exception {
		LoginDTO dto = (LoginDTO) session.getAttribute("login");
		model.addAttribute("point", uService.userInfo(dto.getUser_id()));

		return "/user//myPage/pointWithdraw";
	}

	@RequestMapping(value="/pointWithdraw", method = RequestMethod.POST)
	public String pointWithdrawPOST(UserVO vo, Model model) throws Exception {
		uService.pointWithdraw(vo);
		model.addAttribute("msg", "success");
		model.addAttribute("pointWithdraw", vo.getUser_point());

		return "/user//myPage/pointWithdraw";
	}

	@RequestMapping(value="/sellStatistics", method = RequestMethod.GET)
	public String sellStatistics(Model model, HttpSession session) throws Exception {
		LoginDTO dto = (LoginDTO) session.getAttribute("login");
		model.addAttribute("sell", uService.sellStatistics(dto.getUser_id()));
		model.addAttribute("price", uService.priceStatistics(dto.getUser_id()));

		return "/user/myPage/sellStatistics";
	}

	@RequestMapping(value="/buyList", method = RequestMethod.GET)
	public String buyList(Model model, HttpSession session) throws Exception {
		LoginDTO dto = (LoginDTO) session.getAttribute("login");
		model.addAttribute("buy", uService.buyList(dto.getUser_id()));

		return "/user/myPage/buyList";
	}

	@RequestMapping(value="/itemInquiry", method = RequestMethod.GET)
	public String itemInquiry(Model model, HttpSession session) throws Exception {
		LoginDTO dto = (LoginDTO) session.getAttribute("login");
		model.addAttribute("inquiry", uService.itemInquiry(dto.getUser_id()));

		return "/user/myPage/itemInquiry";
	}

	@RequestMapping(value="/itemReview", method = RequestMethod.GET)
	public String itemReview(Model model, HttpSession session) throws Exception {
		LoginDTO dto = (LoginDTO) session.getAttribute("login");
		model.addAttribute("review", uService.itemReview(dto.getUser_id()));

		return "/user/myPage/itemReview";
	}

	//판매로그 엑셀
	@RequestMapping(value="/sellingItemExcal", method = RequestMethod.GET)
	public void sellingItemExcal(HttpSession session, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		LoginDTO dto = (LoginDTO) session.getAttribute("login");

		try {
			List<SellItemLogVO> list = mService.sellList(dto);

			if(list != null) {


				Map<String, Object> paramMap = new HashMap<>();

				paramMap.put("list", list);

				Excel excel = new Excel();
				excel.sellingItemDown(paramMap, request, response);

			}


		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
	}
}
