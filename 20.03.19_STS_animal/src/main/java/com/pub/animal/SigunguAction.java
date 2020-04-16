package com.pub.animal;

import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pub.vo.SigunguVO;

@Controller
public class SigunguAction {
	
	@RequestMapping(value = "sigungu.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sigungu(String uprcd) throws Exception {
		SigunguVO[] ar = null;
 		
		URL url = new URL("http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/sigungu?upr_cd="+uprcd+"&ServiceKey=RwA9pvklKSFAa%2F6hL4XXwFnH%2FkzO%2F%2FviP25DWWwSI8i8FmOhSHYHB52YkQCeurzcRnItPJ0qoNGHpd0XGPzDNg%3D%3D");
		
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			
			SAXBuilder builder = new SAXBuilder();
			
			Document doc = builder.build(conn.getInputStream());
			
			//루트얻기
			Element root = doc.getRootElement();
			
			//루트의 자식들중 body요소
			Element body = root.getChild("body");
			
			//body의 자식들중 items요소를 얻는다.
			Element items = body.getChild("items");
			
			//items의 자식들중 item요소들
			List<Element> i_list = items.getChildren("item");
			
			//List에 있는 요소들을 vo로 만들어서 배열에 저장한다.
			ar = new SigunguVO[i_list.size()];
			
			int i = 0;
			for(Element e : i_list) {
				
				SigunguVO vo = null;
				
				vo = new SigunguVO();
				vo.setOrgCd(e.getChildText("orgCd"));
				vo.setOrgdownNm(e.getChildText("orgdownNm"));
				
				ar[i++] = vo;
			}
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("ar", ar);
			
		
		return map;
	}
}
