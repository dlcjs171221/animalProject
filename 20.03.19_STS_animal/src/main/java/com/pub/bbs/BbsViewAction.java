package com.pub.bbs;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pub.dao.AniDAO;
import com.pub.vo.AniBbsVO;

@Controller
public class BbsViewAction {

	@Autowired
	private AniDAO a_dao;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/ugiview.inc")
	public ModelAndView view(String b_idx, String nowPage) {
		ModelAndView mv = new ModelAndView();
		
		Object obj = session.getAttribute("mvo");
		
		if(obj != null) {
			
		AniBbsVO[] ar = a_dao.allList("유기");
		AniBbsVO vo = a_dao.getBbs(b_idx);
		
		mv.addObject("vo", vo);
		mv.addObject("ar", ar);
		mv.addObject("nowPage", nowPage);
		mv.setViewName("ugiview");
		
		}else {
			mv.setViewName("login");
		}
		
		return mv;
		
	}
}
