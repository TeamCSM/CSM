package com.csm.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/community/homepage/*")
public class HomepageController {
	
	@RequestMapping(value="/homepage", method=RequestMethod.GET)
	public void homepageGET()throws Exception{
		
	}
	
	@RequestMapping(value="/pricing", method=RequestMethod.GET)
	public void pricingGET()throws Exception{
		
	}
}
