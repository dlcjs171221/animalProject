package com.pub.animal;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pub.dao.ShelterDAO;
import com.pub.vo.ShelterVO;

import spring.util.care_Paging;

@Controller
public class ShelterAction {
	

	public final int BLOCK_LIST = 10; //한 페이지 당 보여질 게시물의 수
	
	public final int BLOCK_PAGE = 3; //한 블럭당 보여질 페이지 수
	
	int rowTotal; //전체 게시물 수
	
	
	int nowPage; //현재 페이지 값
	
	String pageCode; //페이징 처리된 HTML코드값
	

	@Autowired
	private ShelterDAO s_dao;
	
	@RequestMapping("/shelter.inc")
	public ModelAndView shelter1(String nowPage) throws Exception{
		
		ModelAndView mv = new ModelAndView();

		if(nowPage == null)
			this.nowPage = 1;
		else
			this.nowPage = Integer.parseInt(nowPage);
		
		//총 게시물의 수를 얻는다.
		rowTotal = s_dao.getTotalCount();
		
		//페이징 처리
		care_Paging page = new care_Paging(this.nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE);
		
		//생성된 페이지 기법의 html코드를 만들자
		pageCode = page.getSb().toString();
		
		//jsp에서 표현할 게시물들의 목록
		int begin = page.getBegin();
		int end = page.getEnd();
	    String Begin = String.valueOf(begin);
	    String End = String.valueOf(end);
	
		ShelterVO[] ar = s_dao.list(Begin,End);

		mv.addObject("list", ar);
		mv.addObject("pageCode", pageCode);
		mv.addObject("nowPage", page.getNowPage());
		mv.addObject("rowTotal", rowTotal);
		mv.addObject("blockList", BLOCK_LIST);
		
		mv.setViewName("shelter");
		return mv;
	}
		
}
