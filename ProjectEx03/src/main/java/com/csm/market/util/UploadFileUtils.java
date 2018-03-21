package com.csm.market.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {
	
	private static final Logger logger = LoggerFactory.getLogger(UploadFileUtils.class);
	
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception{
		 
		UUID uid = UUID.randomUUID();
		
		String savedName = uid.toString()+"_"+originalName;
		
		//저장될 경로를 계산한다.
		String savedPath = calcPath(uploadPath);
		
		File target = new File(uploadPath+savedPath,savedName);
		
		//원본파일 저장
		FileCopyUtils.copy(fileData, target);
		
		//원본 파일의 확장자
		String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
		
		String uploadedFileName = null;
		
		//이미지 파일이면 썸네일, 아니면 아이콘을 출력
		if(MimeMediaUtil.getMediaType(formatName) != null) {
			uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
		}else {
			uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
		}
		return uploadedFileName;
	}
	//년월일 생성
	public static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		
		String yearPath = "/"+cal.get(Calendar.YEAR);
		
		String monthPath = yearPath + "/"+ new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		
		String datePath = monthPath + "/"+ new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		makeDir(uploadPath, yearPath, monthPath, datePath);
		
		logger.info(datePath);
		
		return datePath;
	}
	//년월일 폴더생성
	private static void makeDir(String uploadPath, String... paths) {
		
		if(new File(uploadPath+paths[paths.length-1]).exists()) {
			return;
		}
		
		for(String path : paths) {
			File dirPath = new File(uploadPath + path);
			
			if(! dirPath.exists()) {
				dirPath.mkdir();
			}
		}
	}
	//썸네일 생성
	private static String makeThumbnail(String uploadPath, String path, String fileName)throws Exception {
		
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath+path, fileName));
		
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_EXACT, 230, 230);
		
		String thumbnailName = uploadPath+path+"/"+"s_"+fileName;
		
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	//아이콘 생성
	private static String makeIcon(String uploadPath, String path, String fileName) throws Exception{
		
		String iconName = uploadPath + path + "/"+fileName;
		
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
}
