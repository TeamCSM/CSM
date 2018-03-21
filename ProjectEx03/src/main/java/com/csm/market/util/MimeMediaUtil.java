package com.csm.market.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;

public class MimeMediaUtil {
	
	private static Map<String, MediaType> mediaMap;
		//이미지 타입판단
	static {
		 
		mediaMap = new HashMap<String, MediaType>();
		mediaMap.put("JPG", MediaType.IMAGE_JPEG);
		mediaMap.put("GIF", MediaType.IMAGE_GIF);
		mediaMap.put("PNG", MediaType.IMAGE_PNG);
	}
	
	public static MediaType getMediaType(String type) {
		return mediaMap.get(type.toUpperCase());
	}
}
