package com.csm.admin.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import com.csm.admin.service.AdminUserService;
import com.csm.admin.service.StatisticsService;
import com.csm.user.domain.UserVO;
import com.csm.user.service.UserService;
 
@Controller
@RequestMapping("/admin/*")
public class AdUserController {

	@Inject
	AdminUserService adminUserService;
	
	@Inject
	private StatisticsService service;
	
	
	//메인 메뉴
	@RequestMapping(value="/adminmain", method=RequestMethod.GET)
	public void marketHome(Model model) throws Exception {
		model.addAttribute("sell", service.sellStatistics());
		model.addAttribute("price", service.priceStatistics());
		model.addAttribute("conp", service.contrastPriceStatistics());
		model.addAttribute("cons", service.contrastSellStatistics());
		model.addAttribute("conn", service.connectionStatistics());
		model.addAttribute("conm", service.contrastConnStatistics());
		model.addAttribute("create", service.createStatistics());
		model.addAttribute("createm", service.contrastCreateStatistics());
		model.addAttribute("delete", service.deleteStatistics());
		model.addAttribute("deletem", service.contrastDeleteStatistics());
		model.addAttribute("resume", service.resumeStatistics());
		model.addAttribute("resumem", service.contrastResumeStatistics());
		model.addAttribute("joinCount", service.joinCount());
		model.addAttribute("dailySum", service.dailySum());
		model.addAttribute("dailyCount", service.dailyCount());
		model.addAttribute("dailyResume", service.dailyResume());
	}
	
	//회원 리스트
	/*@RequestMapping(value="aduser/userList")
	public ModelAndView userList(ModelAndView mav) {	
		List<UserVO> userList = adminUserService.userList();	
		mav.addObject("userList", userList);
		mav.setViewName("admin/aduser/userList");
		return mav;
	}*/
	
	//회원 리스트 
	@RequestMapping("aduser/userList")
	public void userList(Model model) {

		List<UserVO> userList = adminUserService.userList();
		model.addAttribute("userList", userList);
		
	}

	//회원 정보 상세보기 
	@RequestMapping("aduser/userDetail/{user_id}")
	public ModelAndView userDetail(@PathVariable("user_id") String user_id, ModelAndView mav) {

		mav.addObject("userDetail", adminUserService.userDetail(user_id));
		mav.setViewName("admin/aduser/userDetail");
		return mav;

	}
	//회원 삭제하기 
	@RequestMapping("aduser/adminuserdelete")
	public String delete(UserVO vo) {
		
			adminUserService.deleteuser(vo);
			return "redirect:userlist";
	}

	@RequestMapping("aduser/adminuserchangeSeller")
	public String changeSeller(UserVO vo) {
		
			adminUserService.changeSeller(vo);
			return "redirect:userlist";
	}
	
	@RequestMapping("aduser/adminuserchangeUser")
	public String adminuserchangeUser(UserVO vo) {
		
		adminUserService.changeUser(vo);
		return "redirect:userlist";
	}
	
}



