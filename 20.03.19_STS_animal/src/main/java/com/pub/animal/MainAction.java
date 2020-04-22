package com.pub.animal;

import java.net.HttpURLConnection;
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
public class MainAction {
	
	URL url; 
	UgiVO[] ar = null;
	
	ModelAndView mv = new ModelAndView();

	@RequestMapping("main.inc")
	public ModelAndView main() throws Exception {
			
		url = new URL("http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic?bgnde=&endde=&pageNo=1&numOfRows=6&ServiceKey=MUdayHwSmix9x692v%2BYHt7JeWdYwmJHVK6L3gXdk4DamUCIGx9cecu0Rtaq84cibEwuQFWepGH15%2FhTk1LMGHA%3D%3D");
			
		mv = makeUgiVO(url);
			
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
						//rowTotal = Integer.parseInt(body.getChildText("totalCount"));
						
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
						
						mv.addObject("ar",ar);

						return mv;
	}
	
}

	
	
