package com.pub.bbs;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pub.dao.AniDAO;
import com.pub.vo.AniBbsVO;
import com.pub.vo.UgiVO;

@Controller
public class BbsViewAction {

	@Autowired
	private AniDAO a_dao;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/ugiview.inc")
	public ModelAndView view(String b_idx, String nowPage) {
		ModelAndView mv = new ModelAndView();
		
		//한번이라도 읽기를 한 게시물들은 세션에 read_list 라는 이름으로 저장된 ArrayList에 있다.
		Object r_obj = session.getAttribute("read_list");
		
		List<AniBbsVO> r_list = null;
		
		//세션에 읽기를 한 게시물이 있는경우
		if( r_obj != null) 
			r_list = (List<AniBbsVO>) r_obj; //r_list 라는 이름으로 r_obj를 담는다.
		else
			r_list = new ArrayList<AniBbsVO>(); //r_list 라는 이름으로 새로운 ArrayList배열을 생성 
		
		
		Object obj = session.getAttribute("mvo"); 
		
		if(obj != null) {
					
		//AniBbsVO[] ar = a_dao.allList("유기");
		AniBbsVO vo = a_dao.getBbs(b_idx);
		
		//한번이라도 읽었던 게시물인지 아닌지 판단하자.
		boolean chk = false;
		
		for(AniBbsVO avo : r_list) {
			if( vo.getB_idx().equals(avo.getB_idx())) {
				//같은게시물을 찾은경우(한번읽기를 수행한 게시물)
				chk = true;
				break;
			}				
			
			
		}
		if(!chk) {

			//한번도 읽기를 하지않은 게시물
			//hit 증가
			a_dao.hit(b_idx);
			
			String h = vo.getHit();
			int hit = Integer.parseInt(h); //문자열 h를 정수형으로 변환
			++hit ;
			
			vo.setHit(String.valueOf(hit)); //정수형 int를 문자열로 변환
			
			//r_list에 vo저장
			r_list.add(vo);
			session.setAttribute("read_list", r_list); //한번 조회를 했기때문에 더이상 조회수가 올라가지않는다.
		
		}
		
		mv.addObject("vo", vo);
		//mv.addObject("ar", ar);
		mv.addObject("nowPage", nowPage);
		mv.setViewName("ugiview");
		
		}else {
			mv.setViewName("login");
		}
		
		return mv;
		
	}
	
	//정책List에서 제목선택시 Action
 	@RequestMapping("infoview.inc")
 	public ModelAndView pubView(String bname, String nowPage, String b_idx) {
 		ModelAndView mv = new ModelAndView();
 		
 		//한번이라도 읽기를 한 게시물들은 세션에 read_list 라는 이름으로 저장된 ArrayList에 있다.
		Object r_obj = session.getAttribute("read_list");
		
		List<AniBbsVO> r_list = null;
		
		//세션에 읽기를 한 게시물이 있는경우
		if( r_obj != null) 
			r_list = (List<AniBbsVO>) r_obj; //r_list 라는 이름으로 r_obj를 담는다.
		else
			r_list = new ArrayList<AniBbsVO>(); //r_list 라는 이름으로 새로운 ArrayList배열을 생성
		
		
		
			//AniBbsVO[] ar = a_dao.allList("유기");
			AniBbsVO vo = a_dao.getBbs(b_idx);
			
			//한번이라도 읽었던 게시물인지 아닌지 판단하자.
			boolean chk = false;
			
			for(AniBbsVO avo : r_list) {
				if( vo.getB_idx().equals(avo.getB_idx())) {
					//같은게시물을 찾은경우(한번읽기를 수행한 게시물)
					chk = true;
					break;
				}				
				
				
			}
			if(!chk) {

				//한번도 읽기를 하지않은 게시물
				//hit 증가
				a_dao.hit(b_idx);
				
				String h = vo.getHit();
				int hit = Integer.parseInt(h); //문자열 h를 정수형으로 변환
				++hit;
				
				vo.setHit(String.valueOf(hit)); //정수형 int를 문자열로 변환
				
				//r_list에 vo저장
				r_list.add(vo);
				session.setAttribute("read_list", r_list); //한번 조회를 했기때문에 더이상 조회수가 올라가지않는다.
			
			}
			
 		mv.addObject("vo", vo);
 		
 		mv.setViewName("infoView");	
 		
 		return mv;
 	}
}
