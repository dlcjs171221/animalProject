package com.pub.animal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;



@Controller
public class MapAction {
	
	
	
	@RequestMapping("/map.inc")
	public ModelAndView map(String careAddr,String nowPage, String desertionNo,String careNm,String careTel) {

		ModelAndView mv = new ModelAndView();
		
		mv.addObject("careTel", careTel);
		mv.addObject("careNm", careNm);
		mv.addObject("careAddr", careAddr);
		mv.addObject("nowPage", nowPage);
		mv.addObject("desertionNo", desertionNo);
		
		mv.setViewName("map");
		
		
		return mv;
	}
	
	
}
