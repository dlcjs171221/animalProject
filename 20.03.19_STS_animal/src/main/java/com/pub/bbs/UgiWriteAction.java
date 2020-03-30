package com.pub.bbs;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pub.dao.AniDAO;
import com.pub.vo.AniBbsVO;
import com.pub.vo.AnimemVO;

import spring.util.FileRenameUtil;

@Controller
public class UgiWriteAction {

	private String uploadPath = "resources/upload";
	
	@Autowired
	AniDAO a_dao;
	
	//절대경로를 얻기위해 application얻기
	@Autowired
	ServletContext application;
	
	//ip를 얻기위해 request얻기
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private HttpSession session;
	
	//session의 저장한 로그인 정보중에 m_id값 가져오기
	AnimemVO mvo = (AnimemVO)session.getAttribute("mvo");
	
	
		
	

	
	//main.jsp에서 분실등록 이나 분실신고 리스트 창에서 글쓰기 버튼을
	//눌렀을 때
	@RequestMapping("/ugiwrite.inc")
	public String ugi_write(String nowPage, String m_name, String bname) {
		
		return "ugiwrite";
	}
	
	ModelAndView mv = new ModelAndView();
	boolean value = false;
	
	//ugiwrite.jsp에서 저장 버튼을 눌렀을 때
	@RequestMapping(value = "/ugiwrite.inc", method = RequestMethod.POST )
	public ModelAndView ugi_write(AniBbsVO vo) throws Exception {
		
		//vo에 bname을 제외한 멤버변수 저장!
		value = saveBbs(vo);

		if(value)
			mv.setViewName("redirect:ugilist.inc");
		else
			mv.setViewName("redirect:/ugiwrite.inc?nowPage="+vo.getNowpage());
		
		return mv;
		
	}
	
	

	@RequestMapping("/infowrite.inc")
	public String info_write(String nowPage, String m_name, String bname) {
		
		return "infowrite";
	}
	
	@RequestMapping(value = "/infowrite.inc", method = RequestMethod.POST )
	public ModelAndView info_write(AniBbsVO vo) throws Exception {
		//vo에 bname을 제외한 멤버변수 저장!
		value = saveBbs(vo);
		
		if(value)
			mv.setViewName("redirect:infolist.inc");
		else
			mv.setViewName("redirect:/infowrite.inc?nowPage="+vo.getNowpage());
		
		return mv;
	}
	

	
	private boolean saveBbs(AniBbsVO vo) throws Exception {
			
		
			//첨부파일은 이미 vo에 저장되어 있다.
				MultipartFile mf = vo.getFile();
				
				//첨부파일이 있는지 판단
				if(mf != null && mf.getSize() > 0) {
					
					//절대경로 얻기
					String path = application.getRealPath(uploadPath);
					
					//오리지널 파일명을 vo에 저장
					vo.setOri_name(mf.getOriginalFilename());
					
					//파일명 얻기
					String f_name = mf.getOriginalFilename();
					
					//동일한 파일명이 있다면 f_name을 변경!
					f_name = FileRenameUtil.checkFileName(path, f_name);
					
					//파일올리기
					mf.transferTo(new File(path, f_name));
					
					//DB에 저장하기 전에 파일명 저장
					vo.setFile_name(f_name);
						
				}else {
					vo.setOri_name("");
					vo.setFile_name("");
				}
				
				//ip저장
				vo.setIp(request.getRemoteAddr());
				
				//session에 저장된 m_id값을 vo에 저장(bbs테이블에 참조키)
				vo.setM_id(mvo.getM_id());
				
				value = a_dao.addUgi(vo);
				
				//DB에 저장! 
				return value;
		
	}
	
	
}
