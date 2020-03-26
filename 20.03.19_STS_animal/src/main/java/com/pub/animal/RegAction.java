package com.pub.animal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pub.dao.MemDAO;
import com.pub.vo.AnimemVO;

public class RegAction {


	@Autowired
	private MemDAO ani_dao;

	@RequestMapping("/reg.inc")
	public String registry() {
		return "reg";
	}	
	
	@RequestMapping(value = "/reg.inc", method = RequestMethod.POST)
	@ResponseBody
	public String reg(AnimemVO vo) {
		
		ani_dao.addMem(vo);
				
		return "main";
	}
	
	
	
	
	
	
}
