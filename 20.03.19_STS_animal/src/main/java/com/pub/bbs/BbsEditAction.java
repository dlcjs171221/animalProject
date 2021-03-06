package com.pub.bbs;

import java.util.HashMap;
import java.util.Map;

import javax.jws.WebParam.Mode;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pub.dao.AniDAO;
import com.pub.vo.AniBbsVO;
import com.pub.vo.UgiVO;

@Controller
public class BbsEditAction {
	
	private String uploadPath = "resources/upload";
	private String imgPath = "resources/editor_img";
	
	@Autowired
	private AniDAO a_dao;
	
	//절대경로를 얻기위해 application얻기
	@Autowired
	ServletContext application;
		
	//ip를 얻기위해 request얻기
	@Autowired
	private HttpServletRequest request;
	
	//유기 수정
	@RequestMapping("/ugiedit.inc")
	public ModelAndView edit(String b_idx, String nowPage) {
		ModelAndView mv = new ModelAndView();
		
		AniBbsVO vo = a_dao.getBbs(b_idx);
		
		mv.addObject("vo", vo);
		mv.addObject("nowPage", nowPage);
		mv.setViewName("ugiedit");
		
		return mv;
	}
	
	@RequestMapping(value = "/ugiedit.inc", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> edit(AniBbsVO vo) {
		Boolean value = false;
		
		value = a_dao.editugi(vo);
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("value", value);
		
		
		return map;
	}
	
	//( 정책, 공지 )수정
	@RequestMapping("/infoedit.inc")
	public ModelAndView bbs_edit(String b_idx, String nowPage) {
		ModelAndView mv = new ModelAndView();
		
		AniBbsVO vo = a_dao.getBbs(b_idx);
		
		mv.addObject("vo", vo);
		mv.addObject("nowPage", nowPage);
		mv.setViewName("infoedit");
		
		return mv;
	}
	
	@RequestMapping(value = "/infoedit.inc", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> bbs_edit(AniBbsVO vo) {
		boolean value = false;
		
		value = a_dao.editbbs(vo);
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("value",value);
					
		return map;
	}
}
