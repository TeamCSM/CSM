package com.csm.market.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.csm.market.domain.InquiryVO;
import com.csm.market.domain.ItemVO;
import com.csm.market.domain.ReviewVO;
import com.csm.market.domain.SellItemLogVO;
import com.csm.market.service.ItemService;
import com.csm.market.service.MarketService;
import com.csm.market.util.CookieUtils;
import com.csm.market.util.MimeMediaUtil;
import com.csm.market.util.UploadFileUtils;
import com.csm.user.domain.LoginDTO;
import com.csm.user.domain.UserLogVO;
import com.csm.user.domain.UserVO;
import com.csm.user.service.UserService;

@Controller
@RequestMapping("market/item/*")
public class ItemController {

	@Inject
	private ItemService service;

	@Inject
	private MarketService marketService;

	@Inject
	private UserService userService;

	private String downPath(HttpServletRequest request) {
		String filePath = File.separator + "resources" + File.separator + "market" + File.separator + "item";
		return filePath;
	}

	private String upPath(HttpServletRequest request) {
		String dftFilePath = request.getSession().getServletContext().getRealPath("/"); 
		String filePath = dftFilePath + "resources" + File.separator + "market" + File.separator + "item";
		return filePath;
	}

	//마켓 아이템 리스트 가기
	@RequestMapping(value="/itListPage", method=RequestMethod.GET)
	public void itListPage(Model model, HttpServletRequest request) throws Exception{

		String area = "it";

		Map<String, Object> paramMap = service.itemListPage(area, null);

		List<ItemVO> list = (List<ItemVO>) paramMap.get("baseInfo");

		for(ItemVO temp : list) {
			if(temp.getItem_photoName()!=null) {
				temp.setItem_photoName(downPath(request)+temp.getItem_photoName());
			}
		}

		model.addAttribute("baseInfo", list);

		model.addAttribute("bastItem", marketService.BestItemList("it"));
	}

	@RequestMapping(value="/bookListPage", method=RequestMethod.GET)
	public void bookListPage(Model model, HttpServletRequest request) throws Exception{

		String area = "book";

		Map<String, Object> paramMap = service.itemListPage(area, null);

		List<ItemVO> list = (List<ItemVO>) paramMap.get("baseInfo");

		for(ItemVO temp : list) {
			if(temp.getItem_photoName()!=null) {
				temp.setItem_photoName(downPath(request)+temp.getItem_photoName());
			}
		}

		model.addAttribute("baseInfo", list);

		model.addAttribute("bastItem", marketService.BestItemList("book"));
	}

	//아이템 읽기
	@RequestMapping(value="/itemReadPage", method=RequestMethod.GET)
	public String itemReadPage(String item_idx, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{

		Map<String, Object> paramMap = service.itemReadPage(item_idx);

		ItemVO list = (ItemVO) paramMap.get("baseInfo");

		if(list.getFiles()!=null) {
			String photoNames[] = list.getFiles();
			for(int i=0; i<photoNames.length ;i++) {

				photoNames[i] = downPath(request)+photoNames[i];
			}
			list.setFiles(photoNames);
		}

		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setItem_idx(item_idx);

		model.addAttribute("itemReview", service.itemReviewList(reviewVO));

		InquiryVO inquiryVO = new InquiryVO();
		inquiryVO.setItem_idx(item_idx);
		inquiryVO.setInquiry_secret(0);

		model.addAttribute("itemInquriy", service.itemInquriyList(inquiryVO));

		model.addAttribute("baseInfo", list);

		/////////////////////////////////////
		//오늘본상품 관련 쿠키등록
		
		CookieUtils cookie = new CookieUtils();

		cookie.setCookie("pageCookie", item_idx, 1, request, response);

		List<String> temp = cookie.getValueList("pageCookie", request);
				
		return "/market/item/itemReadPage";
		////////////////////////////////////
	}




	//아이템 등록
	@RequestMapping(value="/itemRegister", method=RequestMethod.GET)
	public void itemRegister() {}

	@RequestMapping(value="/itemRegister", method=RequestMethod.POST)
	public String itemRegisterPost(ItemVO vo) throws Exception{

		service.itemRegister(vo);

		System.out.println(vo);

		if(vo.getItem_area().equals("book")) {
			return "redirect:bookListPage";
		}else {
			return "redirect:itListPage";
		}

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
	public ResponseEntity<String> deleteFile(String fileName, HttpServletRequest request) throws Exception{

		service.subItemDelete(fileName);

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

	//내 상품 리스트
	@RequestMapping(value="/myItemList", method=RequestMethod.GET)
	public void myItemList(HttpServletRequest request, HttpSession session, Model model) throws Exception{

		LoginDTO dto = (LoginDTO) session.getAttribute("login");

		Map<String, Object> paramMap = service.itemListPage(null, dto.getUser_id());

		model.addAttribute("myItemInfo", paramMap.get("baseInfo"));
	}

	//상품 삭제
	@RequestMapping(value="/itemDelete", method=RequestMethod.GET)
	public String itemDelete(String item_idx, Model model) throws Exception{

		service.itemDelete(item_idx);

		return "redirect:myItemList";
	}

	//내상품 수정
	@RequestMapping(value="/itemModifyPage", method=RequestMethod.GET)
	public void itemModifyPage(String item_idx, HttpServletRequest request ,HttpSession session, Model model) throws Exception{

		Map<String, Object> paramMap = service.itemReadPage(item_idx);

		ItemVO list = (ItemVO) paramMap.get("baseInfo");

		if(list.getFiles()!=null) {
			String photoNames[] = list.getFiles();
			for(int i=0; i<photoNames.length ;i++) {

				photoNames[i] = downPath(request)+photoNames[i];
			}
			list.setFiles(photoNames);
		}

		model.addAttribute("baseInfo", list);
	}

	@RequestMapping(value="/itemModifyPage", method=RequestMethod.POST)
	public String itemModifyPagePost(ItemVO vo) throws Exception{

		service.itemModify(vo);

		return "redirect:/market/item/myItemList";
	}

	// 상품수정폼 포토
	@RequestMapping(value="/itemPhoto/{item_idx}")
	@ResponseBody
	public List<String> itemPhoto(@PathVariable("item_idx")Integer item_idx) throws Exception{

		return service.getItemPhoto(item_idx);
	}

	//리뷰
	@RequestMapping(value="/itemReviewPopUp", method=RequestMethod.GET)
	public void itemReviewPopUp() throws Exception{

	}

	@RequestMapping(value="/itemReviewPopUp", method=RequestMethod.POST)
	public void itemReviewPopUpPost(ReviewVO vo, HttpSession session, Model model) throws Exception{

		LoginDTO dto = (LoginDTO) session.getAttribute("login");
		vo.setUser_id(dto.getUser_id());

		service.itemReviewRegister(vo);

		model.addAttribute("msg", "success");
	}

	//문의
	@RequestMapping(value="/itemInquiryPopUp", method=RequestMethod.GET)
	public void itemInquiryPopUp() throws Exception{

	}

	@RequestMapping(value="/itemInquiryPopUp", method=RequestMethod.POST)
	public void itemInquiryPopUpPost(InquiryVO vo, HttpSession session, Model model) throws Exception{

		LoginDTO dto = (LoginDTO) session.getAttribute("login");
		vo.setUser_id(dto.getUser_id());

		service.itemInquiryRegister(vo);

		model.addAttribute("msg", "success");
	}

	//판매자 권한신청홈
	@RequestMapping(value="/itemSellorGainHome", method=RequestMethod.GET)
	public void itemSellorGainHome() throws Exception{ }

	//판매자 권한신청
	@RequestMapping(value="/itemSellorGain", method=RequestMethod.POST)
	public void itemSellorGain(HttpSession session, HttpServletResponse response) throws Exception{

		LoginDTO dto = (LoginDTO) session.getAttribute("login");

		UserLogVO vo = new UserLogVO();
		vo.setUser_id(dto.getUser_id());
		vo.setLog_action("SC");
		userService.logInsert(vo);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('판매자 신청을 완료하였습니다. 검토를 거쳐 판단하겠습니다.'); location.href='/market/marketHome';</script>");
		out.flush();
	}

	//오늘본상품
	@RequestMapping(value="/dayListAjax", method=RequestMethod.GET)
	public void dayList(HttpServletRequest request, Model model) throws Exception{
		
		CookieUtils cookie = new CookieUtils();

		List<String> temp = cookie.getValueList("pageCookie", request);
		
		if(temp == null) {
			return;
		}
		
		List<ItemVO> list = new ArrayList<>();
	
		for(String tmp: temp) {
			Map<String, Object> paramMap = service.itemReadPage(tmp);
			ItemVO listTemp = (ItemVO) paramMap.get("baseInfo");
			
			if(listTemp.getFiles()!=null) {
				String photoNames[] = listTemp.getFiles();
				for(int i=0; i<photoNames.length ;i++) {

					photoNames[i] = downPath(request)+photoNames[i];
				}
				listTemp.setFiles(photoNames);
			}
			list.add(listTemp);
		}
		
		model.addAttribute("baseInfo", list);

		

		
	}

}
