package com.csm.market.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.csm.market.domain.SellItemLogVO;
import com.csm.market.service.MarketService;

@Controller
@RequestMapping("/market/*")
public class MarketController {

	@Inject
	private MarketService marketService;
	
	//마켓홈 가기
	@RequestMapping(value="/marketHome", method=RequestMethod.GET)
	public void marketHome(Model model) throws Exception{
		
		model.addAttribute("bastItem", marketService.BestItemList(""));
		
	}
	
	
	
	
	
	
	
	
}
