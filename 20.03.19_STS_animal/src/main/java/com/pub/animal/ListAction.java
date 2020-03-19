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

@Controller
public class ListAction {	

	@RequestMapping("/list.inc")
	public ModelAndView list() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		URL url = new URL("http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic?bgnde=20140301&endde=20140430&pageNo=1&numOfRows=10&ServiceKey=MUdayHwSmix9x692v%2BYHt7JeWdYwmJHVK6L3gXdk4DamUCIGx9cecu0Rtaq84cibEwuQFWepGH15%2FhTk1LMGHA%3D%3D");	
		
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		
		//연결된 결과는 xml문서이고 그 문서를 document로 로드하기위해 파서 준비
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
		UgiVO vo = null;
		
		int i = 0;
		for(Element e : i_list) {
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
						
		mv.addObject("ar",ar);
		mv.setViewName("list");
		
		return mv;
	}
}
