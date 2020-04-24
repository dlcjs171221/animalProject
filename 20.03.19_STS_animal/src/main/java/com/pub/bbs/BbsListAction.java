package com.pub.bbs;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pub.dao.AniDAO;
import com.pub.vo.AniBbsVO;

import spring.util.A_Paging;

@Controller
public class BbsListAction {

	@Autowired
	AniDAO a_dao;
	
	//페이징 기법을 위한 상수들...
	public final int BLOCK_LIST = 8; //한페이지당
			//보여질 게시물의 수
	public final int BLOCK_PAGE = 3; //한 블럭당
			//보여질 페이지 수
	int nowPage; //현재 페이지 값
	int rowTotal; //전체 게시물 수
	String pageCode; //페이징 처리된 HTML코드 값
	
	
	
	@Autowired
	private HttpServletRequest request;
	
	@RequestMapping("/bbslist.inc")
	public ModelAndView list(String bname,String nowPage) 
				throws Exception{
		ModelAndView mv = new ModelAndView();
		
		
		if(nowPage == null)
			this.nowPage = 1;
		else
			this.nowPage = Integer.parseInt(nowPage);
		
		
		
		//총 게시물의 수를 얻는다.
		rowTotal = a_dao.getTotalCount(bname);
		
		//페이징 처리
		A_Paging page = new A_Paging(this.nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE, bname);
		
		//생성된 페이지 기법의 html코드를 만들자
		pageCode = page.getSb().toString();
		
		//jsp에서 표현할 게시물들의 목록
		int begin = page.getBegin();
		int end = page.getEnd();
		
		AniBbsVO[] ar = a_dao.getList(bname, begin, end);
		/*기존
		mv.addObject("ugilist", ar);
		mv.addObject("pageCode", pageCode);
		mv.addObject("nowPage", page.getNowPage());
		mv.addObject("rowTotal", rowTotal);
		mv.addObject("blockList", BLOCK_LIST);
		
		//분실등록 리스트를 클릭했을때
		if(bname.equals("유기")) {
			//jsp에서 사용할 모든 값들을 저장할 객체
			mv.setViewName("ugilist");
		
		//정책및 정보 게시판을 클릭했을때
		}else{
			mv.addObject("bname", bname);
			mv.setViewName("infolist");
			
		}
		
		return mv;
		
		*/
		//도현
		mv.addObject("nowPage", page.getNowPage());
		mv.addObject("rowTotal", rowTotal);
		mv.addObject("blockList", BLOCK_LIST);
		
		//bname에 해당하는 게시판List를 ar에 저장시켜놓은 상태
		//bname을 분별하여 setViewName
		if(bname.equals("유기")) {
			mv.addObject("ugiPageCode", pageCode);
			mv.addObject("ugiList", ar);
			mv.setViewName("ugilist");
		}else if(bname.equals("정책")) {
			mv.addObject("pubPageCode", pageCode);
			mv.addObject("pubList", ar);
			mv.setViewName("pubList");
		}else if(bname.equals("공지")) {
			mv.addObject("noticePageCode", pageCode);
			mv.addObject("noticeList", ar);
			mv.setViewName("noticeList");
		}
		return mv;
	}
	
	
	
	
	
}
