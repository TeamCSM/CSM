package com.csm.user.controller;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.csm.user.domain.UserVO;
import com.csm.user.service.UserService;
import com.csm.user.util.AES256Util;
import com.csm.user.util.SHA256Util;

@Controller
@RequestMapping("user/join/*")
public class JoinController {

	@Inject
	UserService service;
	

	
	//회원가입
	@RequestMapping(value="/signUpTerms", method=RequestMethod.GET)
	public void sineUpTerms() {}
	
	@RequestMapping(value="/signUp", method=RequestMethod.POST)
	public void sineUp(UserVO vo, Model model) {
		
		model.addAttribute("userTerms", vo);
	}
	
	//회원가입 등록
	@RequestMapping(value="/signUpRegister", method=RequestMethod.POST)
	public String signUpRegister(UserVO vo) throws Exception{
		
		//암호화 코드
		/*AES256Util aes1 = new AES256Util("aes256-csm-passkey");
		vo.setUser_pass(aes1.encrypt(vo.getUser_pass()));*/
		
		SHA256Util sha = new SHA256Util();
		vo.setUser_pass(sha.encryptSHA256(vo.getUser_pass()));
		
		service.sineUpBase(vo);
		
		return "redirect:/user/login";
	}
	
}
