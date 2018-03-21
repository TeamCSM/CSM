package com.csm.user.controller;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.csm.user.util.SineUpMail;



@Controller
@RequestMapping("/mail/*")
public class MailController {

	@Inject
	private JavaMailSender mailSender;

	@RequestMapping(value="mailCertification", method = RequestMethod.GET)
	public ResponseEntity<String> sineUpMail(@RequestParam("email") String email) {
		
		ResponseEntity<String> entity = null;
		String key = null;
		try {
			SineUpMail mail = new SineUpMail();
			key = mail.signUp(email, mailSender);
			
			entity = new ResponseEntity<>(key, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(key, HttpStatus.BAD_REQUEST);
		}
		System.out.println("메일전송 완료");
		return entity;
		
	}
	
}
