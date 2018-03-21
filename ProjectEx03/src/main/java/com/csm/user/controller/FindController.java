package com.csm.user.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.csm.user.domain.UserVO;
import com.csm.user.service.UserService;
import com.csm.user.util.SHA256Util;

@Controller
@RequestMapping("user/find/*")
public class FindController {

	@Inject
	private UserService service;
	
	//아이디 찾기
	@RequestMapping(value="/idFind", method=RequestMethod.GET)
	public void idFind() {}
	
	//이메일로 아이디찾기
	@RequestMapping(value="/idFindConfirm", method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> idFindConfirm(UserVO vo) {
		
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			UserVO result = service.idFindConfirm(vo);
			
			if(result != null) {
				map.put("user_id", result.getUser_id());
				map.put("result", true);
				entity = new ResponseEntity<>(map, HttpStatus.OK);
			}else {
				map.put("result", false);
				entity = new ResponseEntity<>(map, HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value="/idFindResult", method=RequestMethod.GET)
	public void idFindResult(UserVO vo, Model model) throws Exception {
		
		UserVO result = service.idFindConfirm(vo);
				
		model.addAttribute("userInfo",result);
		
	}
	
	@RequestMapping(value="/realIdFind", method=RequestMethod.GET)
	public ResponseEntity<UserVO> realIdFind(UserVO vo) {
		
		ResponseEntity<UserVO> entity = null;
		
		try {
			UserVO result = service.realIdFind(vo);
			
			entity = new ResponseEntity<>(result, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	
	//비밀번호 찾기
	@RequestMapping(value="/passFind", method=RequestMethod.GET)
	public void passFind() {}
	
	@RequestMapping(value="/passFindConfirm", method=RequestMethod.GET)
	public String passFindConfirm(UserVO vo, Model model) {
		
		try {
			UserVO result = service.passFindConfirm(vo);
			
			if(result.getUser_email() == null) {
				model.addAttribute("result", false);
			}else {
				model.addAttribute("result", true);
				model.addAttribute("userInfo", result);
			}			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/user/find/passFindCertification";
	}
	
	@RequestMapping(value="/newPass", method=RequestMethod.GET)
	public String newPass(UserVO vo, Model model) {
		
		model.addAttribute("userInfo", vo);
		
		return "/user/find/newPass";
	}
	
	@RequestMapping(value="/newPassSave", method=RequestMethod.GET)
	public ResponseEntity<Boolean> newPassSave(UserVO vo) {
		
		ResponseEntity<Boolean> entity = null;
		
		//암호화
		SHA256Util sha = new SHA256Util();
		vo.setUser_pass(sha.encryptSHA256(vo.getUser_pass()));
		try {
			int usePass = service.usePassConfirm(vo);
			
			if(usePass > 0) {
				entity = new ResponseEntity<>(false, HttpStatus.OK);
			}else {
				int result = service.newPassSave(vo);
				
				if(result>0) {
					entity = new ResponseEntity<>(true, HttpStatus.OK);
				}else {
					entity = new ResponseEntity<>(false, HttpStatus.OK);
				}
			}
	
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
