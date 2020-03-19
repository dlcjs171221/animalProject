package com.pub.animal;

import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pub.vo.UgiVO;

import spring.util.Paging;

@Controller
public class ListAction {	
	
	public final int BLOCK_LIST = 10; //한 페이지 당 보여질 게시물의 수
	
	public final int BLOCK_PAGE = 10; //한 블럭당 보여질 페이지 수
	
	public final int ROW_TOTAL = 12091; //한 블럭당 보여질 페이지 수
	
	
	int nowPage; //현재 페이지 값
	
	String pageCode; //페이징 처리된 HTML코드값


	@RequestMapping("/list.inc")
	public ModelAndView list(String nowPage) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		UgiVO[] ar = null;
		
		if(nowPage != null) {
			ar = makeUgi(nowPage);	
			
		}else {
			ar = makeUgi();
		
		}
		
		mv.addObject("ar",ar);
		mv.addObject("nowPage",this.nowPage);
		mv.addObject("pageCode", pageCode);
		mv.setViewName("list");
		
		return mv;
	}

	private UgiVO[] makeUgi() throws Exception {
		URL url = new URL("http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic?bgnde=20140301&endde=20140430&pageNo=&numOfRows=10&ServiceKey=MUdayHwSmix9x692v%2BYHt7JeWdYwmJHVK6L3gXdk4DamUCIGx9cecu0Rtaq84cibEwuQFWepGH15%2FhTk1LMGHA%3D%3D");	
		
		this.nowPage = 1;
		
		//페이징 처리
		Paging page = new Paging(this.nowPage, ROW_TOTAL, BLOCK_LIST, BLOCK_PAGE);
		
		//생성된 페이지 기법의 html코드를 만들자
		pageCode = page.getSb().toString();
		
		
		//연결된 결과는 xml문서이고 그 문서를 document로 로드하기위해 파서 준비
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
				SAXBuilder builder = new SAXBuilder();
				
				Document doc = builder.build(conn.getInputStream());
				
				//루트 얻기
				Element root = doc.getRootElement();
				
				//루트의 자식들중 body요소
				Element body = root.getChild("body");
				
				//body의 자식들중 items요소를 얻는다
				Element items = body.getChild("items");
				
				//items의 자식들중 item요소들
				List<Element> i_list = items.getChildren("item");
				
				System.out.println(i_list.size());
					

				//List에 있는 요소들을 vo로 만들어서 배열에 저장한다.
				UgiVO[] ar = new UgiVO[i_list.size()];
				
				int i = 0;
				for(Element e : i_list) {
					
					UgiVO vo = null;
					
					vo = new UgiVO();
					vo.setAge(e.getChildText("age"));
					vo.setCareAddr(e.getChildText("carAddr"));
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
				
				return ar;
		
	}
	
	private UgiVO[] makeUgi(String nowPage) throws Exception {
		URL url = new URL("http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic?bgnde=20140301&endde=20140430&pageNo="
				+nowPage+ "&numOfRows=10&ServiceKey=MUdayHwSmix9x692v%2BYHt7JeWdYwmJHVK6L3gXdk4DamUCIGx9cecu0Rtaq84cibEwuQFWepGH15%2FhTk1LMGHA%3D%3D");	
		
		this.nowPage = Integer.parseInt(nowPage);
		
		//페이징 처리
		Paging page = new Paging(this.nowPage, ROW_TOTAL, BLOCK_LIST, BLOCK_PAGE);
		
		//생성된 페이지 기법의 html코드를 만들자
		pageCode = page.getSb().toString();
		
		//연결된 결과는 xml문서이고 그 문서를 document로 로드하기위해 파서 준비
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
				SAXBuilder builder = new SAXBuilder();
				
				Document doc = builder.build(conn.getInputStream());
				
				//루트 얻기
				Element root = doc.getRootElement();
				
				//루트의 자식들중 body요소
				Element body = root.getChild("body");
				
				//body의 자식들중 items요소를 얻는다
				Element items = body.getChild("items");
				
				//items의 자식들중 item요소들
				List<Element> i_list = items.getChildren("item");
				
				System.out.println(i_list.size());
					

				//List에 있는 요소들을 vo로 만들어서 배열에 저장한다.
				UgiVO[] ar = new UgiVO[i_list.size()];
				
				int i = 0;
				for(Element e : i_list) {
					
					UgiVO vo = null;
					
					vo = new UgiVO();
					vo.setAge(e.getChildText("age"));
					vo.setCareAddr(e.getChildText("carAddr"));
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
				
				return ar;
		
	}

	
}
