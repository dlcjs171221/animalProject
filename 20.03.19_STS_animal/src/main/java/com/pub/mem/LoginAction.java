package com.pub.mem;

import java.math.BigInteger;
import java.security.SecureRandom;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pub.dao.MemDAO;
import com.pub.vo.AnimemVO;
@Controller
public class LoginAction {

		@Autowired
		private MemDAO ani_dao;
		
		@Autowired
		private HttpSession session;
		
		//main에서 로그인 버튼을 눌렀을 때
		@RequestMapping("/login.inc")
		public ModelAndView login() {
					 
			ModelAndView mv = new ModelAndView();
			
			String state = new BigInteger(130, new SecureRandom()).toString();
		      
		    String url = "https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=49tXMBLc1F3Q489qLVGl&state="+state+"&redirect_uri=http://localhost:9090/animal/callback.inc";
		      
		    mv.addObject("url", url);
		    mv.setViewName("login");
		    
			return mv;
		}
		
	   @RequestMapping(value = "/login.inc", method = RequestMethod.POST)
	   @ResponseBody
	   public String naverLogin(AnimemVO vo) {
	     // ModelAndView mv =  new ModelAndView();
	     // String state = new BigInteger(130, new SecureRandom()).toString();
	      
	     // String url = "https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=49tXMBLc1F3Q489qLVGl&state="+state+"&redirect_uri=http://localhost:9090/ugi/callback.inc";
	      
	      AnimemVO mvo = ani_dao.login(vo);
	      
	      session.setAttribute("vo", mvo);
	      
	      
	     //  mv.addObject("url", url);
	     //  mv.setViewName("main");
	      
	      return "main";
	   }
}
