package com.pub.mem;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pub.dao.MemDAO;
import com.pub.vo.AnimemVO;

@Controller
public class RegAction {


	@Autowired
	private MemDAO ani_dao;

	@RequestMapping("/reg.inc")
	public String registry() {
		System.out.println("dddd");
		return "reg";
	}	
	
	@RequestMapping(value = "/reg.inc", method = RequestMethod.POST)
	public String reg(AnimemVO vo) {
		System.out.println(vo.getS_email());
		ani_dao.addMem(vo);
				
		return "main";
	}
	
	
	
	
	
	
}
