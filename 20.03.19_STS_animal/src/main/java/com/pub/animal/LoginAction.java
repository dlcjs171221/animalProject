package com.pub.animal;

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
	private HttpSession session;
	
	@Autowired
	private MemDAO ani_dao;
	
	@RequestMapping("/login.inc")
	public String login() {
		return "login";
	}	
	
	@RequestMapping(value = "/login.inc", method = RequestMethod.POST)
	@ResponseBody
	public String login(AnimemVO vo) {
		
		AnimemVO mvo = ani_dao.login(vo);
		
		session.setAttribute("vo", mvo);
		
		return "main";
	}
	
	
	
	
}
