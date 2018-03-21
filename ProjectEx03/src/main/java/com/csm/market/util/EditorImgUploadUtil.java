package com.csm.market.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public class EditorImgUploadUtil {

	public static void editorUpload(Model model) {
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest request = (HttpServletRequest) paramMap.get("request");
		HttpServletResponse response = (HttpServletResponse) paramMap.get("response");
		
		try { 
			//파일정보 
			String sFileInfo = ""; 
			//파일명을 받는다 - 일반 원본파일명 
			String filename = request.getHeader("file-name"); 
			//파일 확장자 
			String filename_ext = filename.substring(filename.lastIndexOf(".")+1); 
			//확장자를소문자로 변경 
			filename_ext = filename_ext.toLowerCase(); 
			//이미지 검증 배열변수 
			String[] allow_file = {"jpg","png","bmp","gif"}; 
			//돌리면서 확장자가 이미지인지 
			int cnt = 0; 
			for(int i=0; i<allow_file.length; i++) {
				if(filename_ext.equals(allow_file[i])){ cnt++; } 
			} 
			//이미지가 아님 
			if(cnt == 0) {
				PrintWriter print = response.getWriter(); 
				print.print("NOTALLOW_"+filename); 
				print.flush(); 
				print.close();
			} else {
				//이미지이므로 신규 파일로 디렉토리 설정 및 업로드
				//파일 기본경로 
				String dftFilePath = request.getSession().getServletContext().getRealPath("/"); 
				//파일 기본경로 _ 상세경로 
				/*String filePath = dftFilePath + "resources" + File.separator + "editor" + File.separator +"multiupload" + File.separator;*/
				String filePath = dftFilePath + "resources" + "/" + "editor";
				String uploadPath = UploadFileUtils.calcPath(filePath) + "/";
				String fileRealPath = filePath + uploadPath;
				File file = new File(fileRealPath); 
				if(!file.exists()) { file.mkdirs(); } 
				String realFileNm = ""; 
				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
				String today= formatter.format(new java.util.Date());
				realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf(".")); 
				String rlFileNm = fileRealPath + realFileNm;
				///////////////// 서버에 파일쓰기 ///////////////// 
				InputStream is = request.getInputStream();
				OutputStream os=new FileOutputStream(rlFileNm);
				int numRead; byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))]; 
				while((numRead = is.read(b,0,b.length)) != -1){ os.write(b,0,numRead); } if(is != null) { is.close(); }
				os.flush(); os.close(); 
				///////////////// 서버에 파일쓰기 /////////////////
				// 정보 출력 
				sFileInfo += "&bNewLine=true"; 
				// img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함 
				sFileInfo += "&sFileName="+ filename;
				sFileInfo += "&sFileURL="+"/resources/editor"+uploadPath+realFileNm; 
				PrintWriter print = response.getWriter(); print.print(sFileInfo); print.flush(); print.close(); 
			}	
		} catch (Exception e) { 
			e.printStackTrace(); 
		}
	}
}
