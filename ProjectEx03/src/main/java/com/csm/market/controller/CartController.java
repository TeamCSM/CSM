package com.csm.market.controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.csm.market.domain.CartVO;
import com.csm.market.domain.ItemVO;
import com.csm.market.domain.OrderDTO;
import com.csm.market.service.CartService;
import com.csm.market.service.ItemService;
import com.csm.market.util.MimeMediaUtil;
import com.csm.user.domain.LoginDTO;

@Controller
@RequestMapping("market/cart/*")
public class CartController {

	@Inject
	private CartService service;

	@Inject
	private ItemService itemservice;

	@RequestMapping(value="/cartList", method=RequestMethod.GET)
	public void cartList(HttpSession session, Model model) throws Exception {

		LoginDTO dto = (LoginDTO) session.getAttribute("login");

		List<CartVO> vo = service.cartRead(dto.getUser_id());
		if(vo != null) {
			int item_totalPrice = 0;
			for(CartVO temp : vo) {
				temp.setItem_sail((int) (Math.ceil(temp.getItem_price() * ((double)temp.getItem_sail() / 100)) * temp.getItem_amount())); 
				temp.setItem_price((temp.getItem_price() * temp.getItem_amount()));
				temp.setItem_priceResult(temp.getItem_price() - temp.getItem_sail());
				item_totalPrice += temp.getItem_priceResult();
			}

			model.addAttribute("cartItemInfo", vo);
			model.addAttribute("item_totalPrice", item_totalPrice);
		}
	}

	@RequestMapping(value="/cartList", method=RequestMethod.POST)
	public String cartListPost(CartVO vo, HttpSession session, Model model) throws Exception{

		LoginDTO dto = (LoginDTO) session.getAttribute("login");

		vo.setUser_id(dto.getUser_id());

		int overlap = service.cartOverlap(vo);
		if(overlap > 0) {
			model.addAttribute("msg", "이미 장바구니에 존재하는 상품입니다.");
			return "redirect:/market/item/itemReadPage?item_idx="+vo.getItem_idx();
		}else {
			service.cartInsert(vo);
		}
		return "redirect:/market/cart/cartList";
	}

	@RequestMapping(value="/cartDelete", method=RequestMethod.POST)
	public String cartDelete(OrderDTO orderDTO ,HttpSession session) throws Exception{

		System.out.println("카트에서 삭제");
		
		LoginDTO loginDTO = (LoginDTO) session.getAttribute("login");

		service.cartDelete(orderDTO, loginDTO.getUser_id());

		return "redirect:/market/cart/cartList";
	}

	@RequestMapping(value="/cartClean", method=RequestMethod.GET)
	public String cartClean(HttpSession session) throws Exception{

		LoginDTO dto = (LoginDTO) session.getAttribute("login");

		service.cartClean(dto.getUser_id());

		return "redirect:/market/cart/cartList";
	}

	@RequestMapping(value="/cartAmountChange", method=RequestMethod.POST)
	public String cartAmountChange(OrderDTO orderDTO ,HttpSession session, Model model) throws Exception{

		LoginDTO loginDTO = (LoginDTO) session.getAttribute("login");

		ItemVO itemVO = new ItemVO();

		for(CartVO vo : orderDTO.getOrderItems()) {
			if(vo.getItem_check() == 1) {
				itemVO = itemservice.itemBaseInfoRead(vo.getItem_idx());
				if(itemVO.getItem_amount() < vo.getItem_amount()) {
					model.addAttribute("msg", "상품의 갯수보다 많습니다.");
					return "redirect:/market/cart/cartList";
				}
			}
		}

		service.cartAmountChange(orderDTO, loginDTO.getUser_id());

		return "redirect:/market/cart/cartList";
	}

	//퀵메뉴 장바구니
	@RequestMapping(value="/cartListAjax", method=RequestMethod.GET)
	public void cartListAjax(HttpSession session, Model model) throws Exception {


		LoginDTO dto = (LoginDTO) session.getAttribute("login");

		if(dto == null) {
			return;
		}else {
			List<CartVO> vo = service.cartRead(dto.getUser_id());
			if(vo != null) {
				int item_totalPrice = 0;
				for(CartVO temp : vo) {
					temp.setItem_sail((int) (Math.ceil(temp.getItem_price() * ((double)temp.getItem_sail() / 100)) * temp.getItem_amount())); 
					temp.setItem_price((temp.getItem_price() * temp.getItem_amount()));
					temp.setItem_priceResult(temp.getItem_price() - temp.getItem_sail());
					item_totalPrice += temp.getItem_priceResult();
				}

				model.addAttribute("cartItemInfoAjax", vo);
				model.addAttribute("item_totalPriceAjax", item_totalPrice);
			}
		}
	}
	
	//퀵메뉴 장바구니 삭제
	@RequestMapping(value="/cartQuickDelete", method=RequestMethod.POST)
	public ResponseEntity<String> cartQuickDelete(CartVO vo ,HttpSession session) throws Exception{

		ResponseEntity<String> result = null;
		
		LoginDTO loginDTO = (LoginDTO) session.getAttribute("login");

		try {
			vo.setUser_id(loginDTO.getUser_id());
			
			service.cartQuickDelete(vo);
			
			result = new ResponseEntity<String>("success", HttpStatus.OK);
		}catch (Exception e) {
			
			result = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return result;
	}
}
