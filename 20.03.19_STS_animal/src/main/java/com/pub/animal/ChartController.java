package com.pub.animal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChartController {

		@RequestMapping("stat1.inc")
	public ModelAndView stat1(String num) {
			
		ModelAndView mv = new ModelAndView();
		mv.addObject("num",num);
		mv.setViewName("stat1");
		
		return mv;
	}
	
}
