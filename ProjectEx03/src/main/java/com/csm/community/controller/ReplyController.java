package com.csm.community.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.csm.community.domain.PageMake;
import com.csm.community.domain.ReplyVO;
import com.csm.community.domain.UnderPage;
import com.csm.community.service.ReplyService;

@RestController
@RequestMapping("/replies/*")
public class ReplyController {
	
	@Inject
	private ReplyService service;
	
	@RequestMapping(value="",method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody ReplyVO vo, HttpServletRequest req){
		
		ResponseEntity<String> entity = null;
		try {

			service.addReply(vo, req);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}
		catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/reply",method=RequestMethod.POST)
	public ResponseEntity<String> registerReply(@RequestBody ReplyVO vo){
		
		ResponseEntity<String> entity = null;
		try {
			
			service.answerReply(vo);
			service.answerRegist(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}
		catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/all/{bno}", method=RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> list(@PathVariable("bno") Integer bno){
		
		ResponseEntity<List<ReplyVO>> entity = null;
		try {
			entity = new ResponseEntity<>(service.listReply(bno), HttpStatus.OK);
		}
		catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value = "/{rno}", method= {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("rno") Integer rno, @RequestBody ReplyVO vo){
		
		ResponseEntity<String> entity = null;
		try {
			vo.setRno(rno);
			service.modifyReply(vo);

			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/{rno}", method=RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("rno") Integer rno){
		ResponseEntity<String> entity =null;
		
		try {
			service.removeReply(rno);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value = "/{bno}/{page}/{typeboard}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPage(@PathVariable("bno") int bno, @PathVariable("page") Integer page, @PathVariable("typeboard") String typeboard){

		ResponseEntity<Map<String, Object>> entity = null;
		
		
		try {
			PageMake pm = new PageMake();
			pm.setPage(page);
			
			UnderPage underPage = new UnderPage();
			underPage.setPm(pm);
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			ReplyVO replyVO = new ReplyVO();
			replyVO.setBno(bno);
			replyVO.setTypeboard(typeboard);
			
			List<ReplyVO> list = service.listReplyPage(replyVO, pm);

			map.put("list", list);

			int replyCount = service.count(bno);
			underPage.setTotalCount(replyCount);

			map.put("UnderPage", underPage);

			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
