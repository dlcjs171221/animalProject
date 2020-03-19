package com.pub.animal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pub.vo.UgiVO;

@Controller
public class ViewAction {
	
	@Autowired
	HttpSession session;

	@RequestMapping("/view.inc")
	public ModelAndView view(String desertionNo, 
			String nowPage) {
		ModelAndView mv = new ModelAndView();
		
		Object obj = session.getAttribute("ar");
		
		UgiVO[] ar = null;
		
		if(obj != null) {
			ar = (UgiVO[]) obj;
			
			for(UgiVO vo : ar) {
				if(	vo.getDesertionNo().equals(desertionNo)) {
					mv.addObject("vo", vo);
					
					mv.setViewName("view");
				}
				
			}
			
		}
		
		
		
	    /*
		
		*/
		
		return mv;
	}
	
}
