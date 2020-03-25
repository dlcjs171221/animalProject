package com.pub.bbs;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.pub.dao.AniDAO;
import com.pub.vo.AniBbsVO;

import spring.util.A_Paging;

@Controller
public class BbsListAction {

	@Autowired
	AniDAO a_dao;
	
	//페이징 기법을 위한 상수들...
	public final int BLOCK_LIST = 10; //한페이지당
			//보여질 게시물의 수
	public final int BLOCK_PAGE = 3; //한 블럭당
			//보여질 페이지 수
	int nowPage; //현재 페이지 값
	int rowTotal; //전체 게시물 수
	String pagecode; //페이징 처리된 HTML코드 값
	
	@Autowired
	private HttpServletRequest request;
	
	public ModelAndView list(String bname, String nowPage) 
				throws Exception{
		ModelAndView mv = new ModelAndView();
		
		if(nowPage == null)
			this.nowPage = 1;
		else
			this.nowPage = Integer.parseInt(nowPage);
		
		//총 게시물의 수를 얻는다.
		rowTotal = a_dao.getTotalCount(bname);
		
		//페이징 처리
		A_Paging page = new A_Paging(this.nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE);
		
		//생성된 페이지 기법의 html코드를 만들자
		pagecode = page.getSb().toString();
		
		//jsp에서 표현할 게시물들의 목록
		int begin = page.getBegin();
		int end = page.getEnd();
		
		AniBbsVO[] ar = a_dao.getList(bname, begin, end);
		  
		
		if(bname.equals("유기") ) {
			
			
			
		}
		
		
		
		return mv;
		
		
	}
	
	
	
	
	
}
