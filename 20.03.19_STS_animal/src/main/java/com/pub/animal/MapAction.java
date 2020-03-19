package com.pub.animal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MapAction {

	@RequestMapping("/map.inc")
	public ModelAndView map(String careAddr,String nowPage) {
		
		System.out.println(careAddr);
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("careAddr",careAddr);
		mv.addObject("nowPage",nowPage);
		
		mv.setViewName("map");
		
		return mv;
	}
}
