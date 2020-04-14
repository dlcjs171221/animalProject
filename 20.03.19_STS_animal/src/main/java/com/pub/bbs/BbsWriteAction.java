package com.pub.bbs;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pub.dao.AniDAO;
import com.pub.vo.AniBbsVO;
import com.pub.vo.AnimemVO;

import spring.util.FileRenameUtil;

@Controller
public class BbsWriteAction {

	private String uploadPath = "resources/upload";
	private String imgPath = "resources/editor_img";
	
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
	
	
	ModelAndView mv = new ModelAndView();
	boolean value = false;
		
	

	
	//분실신고 리스트 창에서 등록하기 버튼을 눌렀을 때
	@RequestMapping("/ugiwrite.inc")
	public ModelAndView ugi_write(String bname) {
			String str = "login";
			
		//session의 저장한 로그인 정보 가져오기
		Object obj = session.getAttribute("mvo");
			
			
		//로그인 이 되어있는 상태
			
		if(obj != null) {
			str = "ugiwrite";
			AnimemVO mvo = (AnimemVO)obj;
			mv.addObject("bname", bname);
			
		}
		
		
		mv.setViewName(str);
		return mv;
		
	}
	
	
	
	//ugiwrite.jsp에서 저장 버튼을 눌렀을 때
	@RequestMapping(value = "/ugiwrite.inc", method = RequestMethod.POST )
	public ModelAndView ugi_write(AniBbsVO vo) throws Exception {
		
		value = saveBbs(vo);

		if(value) {
			mv.addObject("bname", vo.getBname());
			mv.setViewName("redirect:/bbslist.inc");
		}
		else {
			mv.addObject("nowPage", vo.getNowPage());
			mv.setViewName("redirect:/ugiwrite.inc");
			
		}
		return mv;
		
	}
	
	
	//main.jsp에서 공지사항이나 법령 및 정책을 선택했을 때
	@RequestMapping("/infowrite.inc")
	public ModelAndView pubwrite(String bname) {
			String str = "login";
			
		//session의 저장한 로그인 정보 가져오기
		Object obj = session.getAttribute("mvo");
			
			
		//로그인 이 되어있는 상태
			
		if(obj != null) {
			str = "pubwrite";
			AnimemVO mvo = (AnimemVO)obj;
			mv.addObject("bname", bname);
			
		}
		
		
		mv.setViewName(str);
		return mv;
		
	}
	
	@RequestMapping(value = "/infowrite.inc", method = RequestMethod.POST )
	public ModelAndView info_write(AniBbsVO vo) throws Exception {
	
		value = saveBbs(vo);
		
		if(value) {
			mv.setViewName("redirect:/bbslist.inc");
			mv.addObject("bname", vo.getBname());
		}else
			mv.setViewName("redirect:/infowrite.inc");
		
		return mv;
	}
	
	@RequestMapping(value="/saveImage.inc", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> saveImage(AniBbsVO vo)throws Exception {
		
		
		MultipartFile upload = vo.getFile();	
		
		String f_name= null;
		
		//첨부파일이 있는지 판단(파일첨부를 안해도 null값은 아니다 빈게 들어올 뿐)
				if(upload != null && upload.getSize() > 0 ) {
					
					//절대경로
					String path = application.getRealPath(imgPath);
				
					//파일명 얻기
					f_name = upload.getOriginalFilename();
					
					//동일한 파일명이 있다면 f_name을 변경!
					f_name = FileRenameUtil.checkFileName(path, f_name);
					
					//파일올리기
					upload.transferTo(new File(path, f_name));
					
		
				}
				Map<String, String> map = new HashMap<String, String>();
				map.put("url", request.getContextPath()+"/resources/editor_img/"+
							f_name);
				
				return map;
				
				
	}
	

	
	private boolean saveBbs(AniBbsVO vo) throws Exception {
			System.out.println(vo.getBname());
		
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
				
				
				//DB에 저장!
				if(vo.getBname().equals("유기")) {
					value = a_dao.addUgi(vo);
				}else {
					value = a_dao.addInfo(vo);
				}
					return value;
		
	}
	
	
}
