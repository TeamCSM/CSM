package com.csm.market.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.csm.market.domain.CartVO;
import com.csm.market.domain.OrderDTO;
import com.csm.market.domain.OrderVO;
import com.csm.market.service.CartService;
import com.csm.market.service.OrderService;
import com.csm.user.domain.LoginDTO;
import com.csm.user.service.UserService;

@Controller
@RequestMapping("market/order/*")
public class OrderController {

	@Inject
	private CartService cartService;

	@Inject
	private UserService userService;

	@Inject
	private OrderService orderService;

	@RequestMapping(value="/orderform", method=RequestMethod.POST)
	public void orderform(OrderDTO orderDTO, HttpSession session, Model model) throws Exception{

		LoginDTO dto = (LoginDTO) session.getAttribute("login");

		List<CartVO> vo = cartService.checkdCartRead(orderDTO, dto.getUser_id());

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

		model.addAttribute("userInfo", userService.userInfo(dto.getUser_id()));

	}

	@RequestMapping(value="/orderInsert", method=RequestMethod.POST)
	public String orderInsert(OrderDTO orderDTO, OrderVO orderVO, HttpSession session, Model model) throws Exception{

		LoginDTO dto = (LoginDTO) session.getAttribute("login");

		orderService.orderInsert(orderDTO, dto.getUser_id(), orderVO);

		return "redirect:/market/order/orderProcessList";
	}

	@RequestMapping(value="/orderProcessList", method=RequestMethod.GET)
	public void orderProcessList(HttpSession session, Model model) throws Exception{

		LoginDTO dto = (LoginDTO) session.getAttribute("login");

		List<OrderVO> list = orderService.orderBaseInfoListRead(dto.getUser_id());
		
		model.addAttribute("orderBaseInfo", list);
	}

	@RequestMapping(value="/orderRead", method=RequestMethod.GET)
	public void orderRead(OrderVO vo, HttpSession session, Model model) throws Exception{

		LoginDTO dto = (LoginDTO) session.getAttribute("login");

		vo.setUser_id(dto.getUser_id());
		
		model.addAttribute("orderItemInfo", orderService.orderItemInfoRead(vo));

		vo = orderService.orderBaseInfoRead(dto.getUser_id(), vo.getOrder_idx());

		model.addAttribute("orderBaseInfo", vo);

		model.addAttribute("orderAddrInfo", orderService.saveAddrRead(vo)) ;

		model.addAttribute("userInfo", userService.userInfo(dto.getUser_id()));

	}

	@RequestMapping(value="/orderCancle", method=RequestMethod.POST)
	public String orderCancle(OrderVO vo, HttpSession session, Model model) throws Exception{

		LoginDTO dto = (LoginDTO) session.getAttribute("login");
		vo.setUser_id(dto.getUser_id());

		orderService.orderCancle(vo);

		return "redirect:/market/order/orderRead?order_idx"+vo.getOrder_idx();
	}

	//내 상품중 오더된 리스트
	@RequestMapping(value="/myOrderItemList", method=RequestMethod.GET)
	public void myOrderItemList(HttpSession session, Model model) throws Exception{
		
		LoginDTO dto = (LoginDTO) session.getAttribute("login");
		
		OrderVO vo = new OrderVO();
		vo.setItem_sellerId(dto.getUser_id());
		model.addAttribute("orderBaseInfo", orderService.orderItemInfoRead(vo));
	}
	
	@RequestMapping(value="/orderProgressChange", method=RequestMethod.GET)
	public String orderProgressChange(OrderVO vo, HttpSession session, Model model) throws Exception{
		
		LoginDTO dto = (LoginDTO) session.getAttribute("login");
		vo.setUser_id(dto.getUser_id());
		orderService.orderProgressChange(vo);
		
		return "redirect:/market/order/myOrderItemList";
	}
	
	@RequestMapping(value="/orderProgressComplete", method=RequestMethod.POST)
	public String orderProgressComplete(OrderDTO orderDTO, OrderVO orderVO, HttpSession session, Model model) throws Exception{
		
		LoginDTO dto = (LoginDTO) session.getAttribute("login");
		
		orderService.orderProgressComplete(orderDTO, dto.getUser_id(), orderVO);
		
		return "redirect:/market/order/orderRead?order_idx="+orderVO.getOrder_idx();
	}
}
