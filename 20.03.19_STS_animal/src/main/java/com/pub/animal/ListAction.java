package com.pub.animal;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pub.vo.UgiVO;

import spring.util.Paging;

@Controller
public class ListAction {	
	
	@Autowired
	HttpSession session;
	
	public final int BLOCK_LIST = 8; //한 페이지 당 보여질 게시물의 수
	
	public final int BLOCK_PAGE = 10; //한 블럭당 보여질 페이지 수
	
	int rowTotal; //전체 게시물 수
	
	
	int nowPage; //현재 페이지 값
	
	String pageCode; //페이징 처리된 HTML코드값
	
	URL url; 
	
	UgiVO[] ar = null; //객체정보가 저장될 배열 준비
	
	ModelAndView mv = new ModelAndView();

	
	@RequestMapping("/list.inc")
	public ModelAndView list(String nowPage) throws Exception {
		//session에 저장된 날짜검색 값 가져오기
		Object obj = session.getAttribute("startdate");
		Object obj2 = session.getAttribute("enddate");
		Object obj3 = session.getAttribute("uprcd");
		Object obj4 = session.getAttribute("orgcd");
		
		String startdate = (String) obj;
		String enddate = (String) obj2;
		String uprcd = (String) obj3;
		String orgcd = (String) obj4;
		
		System.out.println(startdate);
		System.out.println(enddate);
		System.out.println(uprcd);
		System.out.println(orgcd);
	
		//넘어온 페이지 버튼이 있을 때
		if(nowPage != null ) {
			
			//현재 페이지를 넘어온 파라미터 값으로 지정
			this.nowPage = Integer.parseInt(nowPage);
			
			// 조건값 중 아무거나 선택한 경우 
			if(startdate != null || enddate != null) {
				System.out.println("조건값을 선택하고 페이지 버튼을 눌렀습니다.");
			
				url = new URL("http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic?bgnde="
						+startdate+ "&endde="
						+enddate+"&pageNo="
						+nowPage+ "&numOfRows=8&ServiceKey=MUdayHwSmix9x692v%2BYHt7JeWdYwmJHVK6L3gXdk4DamUCIGx9cecu0Rtaq84cibEwuQFWepGH15%2FhTk1LMGHA%3D%3D&upr_cd="
								+uprcd+"&org_cd="+orgcd);
				
				//vo 객체와 paging기법을 생성하는 함수
				mv = makeUgiVO(url);
			
			// 조건 값을 선택하지 않은 경우
			}else {
				System.out.println("조건값없이 페이지 버튼을 눌렀습니다.");
				url = new URL("http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic?bgnde=&endde=&pageNo="
						+nowPage+"&numOfRows=8&ServiceKey=MUdayHwSmix9x692v%2BYHt7JeWdYwmJHVK6L3gXdk4DamUCIGx9cecu0Rtaq84cibEwuQFWepGH15%2FhTk1LMGHA%3D%3D");
				
				mv = makeUgiVO(url);
				mv.setViewName("list");
			}
			
			
		
		}//바깥족 if문의 끝
		
		//처음 접속했을 때(넘어온 페이지 버튼 없음)	
		else {
			System.out.println("처음 접속 하였습니다.");
			session.removeAttribute("startdate");
			session.removeAttribute("enddate");
			session.removeAttribute("uprcd");
			session.removeAttribute("orgcd");
			this.nowPage = 1;
			
			url = new URL("http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic?bgnde=&endde=&pageNo=1&numOfRows=8&ServiceKey=MUdayHwSmix9x692v%2BYHt7JeWdYwmJHVK6L3gXdk4DamUCIGx9cecu0Rtaq84cibEwuQFWepGH15%2FhTk1LMGHA%3D%3D");
							
			mv = makeUgiVO(url);
			mv.setViewName("list");
		}
			
		return mv;
		
	}//list함수의 끝(get방식)
	
	

	@RequestMapping(value = "/list.inc", method = RequestMethod.POST)
	public ModelAndView list(String startdate, String enddate, String uprcd, String orgcd) throws Exception {
		System.out.println("조건 값을 선택 하였습니다.");
		
		this.nowPage = 1;
		
		String[] s1 = startdate.split("-");
		StringBuffer sb = new StringBuffer();
		for(String s : s1)
			sb.append(s);
		String s_date = sb.toString();
		
		String[] s2 = enddate.split("-");
		StringBuffer sb2 = new StringBuffer();
		for(String s : s2)
			sb2.append(s);
		String e_date = sb2.toString();
		
		session.setAttribute("startdate", s_date);
		session.setAttribute("enddate", e_date);
		session.setAttribute("uprcd", uprcd);
		session.setAttribute("orgcd", orgcd);
		
		url = new URL("http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic?bgnde="
				+s_date+"&endde="
				+e_date+"&pageNo=1&numOfRows=8&ServiceKey=MUdayHwSmix9x692v%2BYHt7JeWdYwmJHVK6L3gXdk4DamUCIGx9cecu0Rtaq84cibEwuQFWepGH15%2FhTk1LMGHA%3D%3D&upr_cd="
				+uprcd+"&org_cd="+orgcd);
		
		mv = makeUgiVO(url);
		
		mv.setViewName("list");
		return mv;
		
	}

	private ModelAndView makeUgiVO(URL Url) throws Exception {
		
		//연결된 결과는 xml문서이고 그 문서를 document로 로드하기위해 파서 준비
				HttpURLConnection conn = (HttpURLConnection) Url.openConnection();
					
						SAXBuilder builder = new SAXBuilder();
						
						Document doc = builder.build(conn.getInputStream());
						
						//루트 얻기
						Element root = doc.getRootElement();
						
						//루트의 자식들중 body요소
						Element body = root.getChild("body");
						
						//총게시물의 수 구하기
						rowTotal = Integer.parseInt(body.getChildText("totalCount"));
						
						//body의 자식들중 items요소를 얻는다
						Element items = body.getChild("items");
						
						//items의 자식들중 item요소들
						List<Element> i_list = items.getChildren("item");
													

						//List에 있는 요소들을 vo로 만들어서 배열에 저장한다.
						ar = new UgiVO[i_list.size()];
						
						int i = 0;
						for(Element e : i_list) {
							
							UgiVO vo = null;
							
							vo = new UgiVO();
							vo.setAge(e.getChildText("age"));
							vo.setCareAddr(e.getChildText("careAddr"));
							vo.setCareNm(e.getChildText("careNm"));
							vo.setCareTel(e.getChildText("careTel"));
							vo.setChargeNm(e.getChildText("chargeNm"));
							vo.setColorCd(e.getChildText("colorCd"));
							vo.setDesertionNo(e.getChildText("desertionNo"));
							vo.setFilename(e.getChildText("filename"));
							vo.setHappenDt(e.getChildText("happenDt"));
							vo.setKindCd(e.getChildText("kindCd"));
							vo.setHappenPlace(e.getChildText("happenPlace"));
							vo.setNeuterYn(e.getChildText("neuterYn"));
							vo.setNoticeEdt(e.getChildText("noticeEdt"));
							vo.setNoticeNo(e.getChildText("noticeNo"));
							vo.setNoticeSdt(e.getChildText("noticeSdt"));
							vo.setOfficetel(e.getChildText("officetel"));
							vo.setOrgNm(e.getChildText("orgNm"));
							vo.setPopfile(e.getChildText("popfile"));
							vo.setProcessState(e.getChildText("processState"));
							vo.setSexCd(e.getChildText("sexCd"));
							vo.setSpecialMark(e.getChildText("specialMark"));
							vo.setWeight(e.getChildText("weight"));
					
							ar[i++] = vo;
							
						}
						
						//페이지 처리
						Paging page = new Paging(this.nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE);
						pageCode = page.getSb().toString();
						
						mv.addObject("ar",ar);
						mv.addObject("nowPage",this.nowPage);
						mv.addObject("pageCode", pageCode);
						mv.addObject("rowTotal", rowTotal);
						
						
						session.setAttribute("ar", ar);
						
						return mv;
		
		
	}


	
}
