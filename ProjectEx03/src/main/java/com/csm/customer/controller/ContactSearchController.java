package com.csm.customer.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.csm.customer.domain.ContactVO;
import com.csm.customer.domain.PageMaker;
import com.csm.customer.domain.SearchCriteria;
import com.csm.customer.service.ContactBoardService;
import com.csm.market.util.MimeMediaUtil;
import com.csm.market.util.UploadFileUtils;

@Controller
@RequestMapping("/customer/sContact/*")
public class ContactSearchController {
	
	private static final Logger logger = LoggerFactory.getLogger(ContactSearchController.class);

	@Inject
	private ContactBoardService service;
	
	private String downPath(HttpServletRequest request) {
		String filePath = File.separator + "resources" + File.separator + "customer" + File.separator + "contact";
		return filePath;
	}

	private String upPath(HttpServletRequest request) {
		String dftFilePath = request.getSession().getServletContext().getRealPath("/"); 
		String filePath = dftFilePath + "resources" + File.separator + "customer" + File.separator + "contact";
		return filePath;
	}
	
	@RequestMapping(value= "register", method = RequestMethod.GET)
	public void registerGet()throws Exception{

		logger.info("register get......");
	}
	
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String registPOST(ContactVO board, RedirectAttributes rttr)throws Exception{
		logger.info("regist post......");
		logger.info(board.toString());

		service.regist(board);
		
		rttr.addFlashAttribute("msg","SUCCESS");

		return "redirect:/customer/sContact/list";
	}
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

		logger.info(cri.toString());

		//model.addAttribute("list", service.listCriteria(cri));
		model.addAttribute("list", service.listSearchCriteria(cri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		//pageMaker.setTotalCount(service.listCountCriteria(cri));
		pageMaker.setTotalCount(service.listSearchCount(cri));

		model.addAttribute("pageMaker", pageMaker);
	}
	@RequestMapping(value = "readPage", method = RequestMethod.GET)
	public void read(@RequestParam("bno") int bno, @ModelAttribute("cri") SearchCriteria cri, Model model)
			throws Exception {

		model.addAttribute("list", service.read(bno));
	}
	@RequestMapping(value = "removePage", method = RequestMethod.POST)
	public String remove(@RequestParam("bno") int bno, SearchCriteria cri, RedirectAttributes rttr) throws Exception {

		service.remove(bno);

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/customer/sContact/list";
	}
	@RequestMapping(value = "modifyPage", method = RequestMethod.GET)
	public void modifyPagingGET(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

		model.addAttribute(service.read(bno));
	}
	@RequestMapping(value = "modifyPage", method = RequestMethod.POST)
	public String modifyPagingPOST(ContactVO board, SearchCriteria cri, RedirectAttributes rttr) throws Exception {

		logger.info(cri.toString());
		service.modify(board);

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("msg", "SUCCESS");

		logger.info(rttr.toString());

		return "redirect:/customer/sQna/list";
	}
	@RequestMapping(value = "listSearch", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listSearch(@ModelAttribute("cri") 
			SearchCriteria cri) {
		
		ResponseEntity<Map<String , Object>> entity = null;
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		logger.info(cri.toString());
		try {
		//model.addAttribute("list", service.listCriteria(cri));
		map.put("list", service.listSearchCriteria(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		//pageMaker.setTotalCount(service.listCountCriteria(cri));
		
		pageMaker.setTotalCount(service.listSearchCount(cri));
		
		map.put("pageMaker", pageMaker);
		entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
		}
		catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value="/itemImgUpload", method=RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadForm(MultipartFile file, Model model, HttpServletRequest request) throws Exception{

		System.out.println("originalName:" + file.getOriginalFilename());
		System.out.println("size : "+ file.getSize());
		System.out.println("contentType:"+ file.getContentType());

		String filePath = upPath(request);
		File fileDir = new File(filePath); 
		if(!fileDir.exists()) { fileDir.mkdirs(); } 

		return new ResponseEntity<>(UploadFileUtils.uploadFile(filePath, file.getOriginalFilename(), file.getBytes()), HttpStatus.CREATED);
	}

	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName, HttpServletRequest request) throws Exception{

		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		String filePath = upPath(request);
		
		System.out.println("File Name : "+ fileName);

		try {
			//선택된 파일이름에서 확장자를 추출
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			//확장자가 이미지타입인지 확인
			MediaType mType = MimeMediaUtil.getMediaType(formatName);

			HttpHeaders headers = new HttpHeaders();

			in = new FileInputStream(filePath+fileName);

			if(mType != null) {
				//이미지 파일인경우 컨텐츠 타입을 이미지파일로 저장
				headers.setContentType(mType);
			}else {
				//이미지가 아닌경우 컨텐츠 타입을 다운로드용으로 지정, 스트림을 열고 인코딩함
				fileName = fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\""+new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
			}
			//IOUtils.toByteArray(in)부분에서 대상파일에서의 데이터를 읽거나, 다운로드시킴
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally {
			in.close();
		}
		return entity;
	}

	@ResponseBody
	@RequestMapping(value="/deleteFile", method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName, HttpServletRequest request){

		System.out.println("delete file : " + fileName);
		String filePath = upPath(request);
		
		//확장자 추출
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);

		//확장자로 이미지인지 다운로드용인지 구분
		MediaType mType = MimeMediaUtil.getMediaType(formatName);

		//확장자가 이미지 파일이라면
		if(mType != null) {
			//썸네일 삭제
			String front = fileName.substring(0, 12);
			String end = fileName.substring(14);
			new File(filePath+(front+end).replace('/', File.separatorChar)).delete();
		}
		//일반파일 삭제
		new File(filePath+fileName.replace('/', File.separatorChar)).delete();

		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
}
