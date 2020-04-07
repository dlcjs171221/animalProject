package com.pub.animal;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pub.dao.ShelterDAO;
import com.pub.vo.ShelterVO;

@Controller
public class ShelterSearchAction {

	@Autowired
	private ShelterDAO s_dao;
	
	@RequestMapping(value="/search.inc",method = RequestMethod.POST)
	@ResponseBody
	public  Map<String, Object> search(String type,String value) {
		
		ShelterVO[] ar = null;

	
		ar = s_dao.searchShelter(type,value);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("type",type);
		map.put("value",value);
		map.put("ar",ar);
		
		return map;
	}
}
