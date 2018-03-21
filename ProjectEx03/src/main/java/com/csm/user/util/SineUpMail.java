package com.csm.user.util;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;

import org.springframework.mail.javamail.JavaMailSender;

import com.csm.user.util.MailHandler;
import com.csm.user.util.TempKey;

public class SineUpMail {
	
	public String signUp(String email, JavaMailSender mailSender) throws MessagingException, UnsupportedEncodingException {
       
		//System.out.println(mailSender);
		//System.out.println(email);
        String key = new TempKey().getKey(6, false);
      
        MailHandler sendMail = new MailHandler(mailSender);
        sendMail.setSubject("[CSM 이메일 인증]");
        sendMail.setText(new StringBuffer().append("<h1>CSM 이메일 인증 메일 입니다.</h1>")
                .append("인증번호 : ")
                .append("<span style='color:red; font-size: 2em;'>"+key+"</span>")
                .append("을 인증번호란에 입력 해주세요.")
                .toString());
        sendMail.setFrom("csm@naver.com", "CSM member");
        sendMail.setTo(email);
        ///////////////
        sendMail.send();
        
        return key;
    }
}