package com.pub.mem;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pub.vo.AnimemVO;

@Controller
public class CallbackAction {

	@RequestMapping("/callback.inc")
	   public ModelAndView callBack(String code, String state) throws Exception {
	      ModelAndView mv = new ModelAndView();
	      
	      AnimemVO vo = null;
	      
	      String apiUrl = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&client_id=49tXMBLc1F3Q489qLVGl&client_secret=CNq2zpNWMW&code="+code+"&state="+state;
	      
	      // System.out.println(apiUrl);
	      
	      URL url = new URL(apiUrl);
	      HttpURLConnection con = (HttpURLConnection) url.openConnection();
	      con.setRequestMethod("GET");
	      int responseCode = con.getResponseCode();
	      BufferedReader
	      br = null;
	      if(responseCode == 200) { // 정상 호출
	         br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	      }else { // 에러 발생
	         br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	      }
	      
	      String inputLine = "";
	      StringBuffer sb = new StringBuffer();
	      while((inputLine = br.readLine()) != null) {
	         sb.append(inputLine);
	      }
	      br.close();
	      if(responseCode == 200) {
	         JSONParser jsonParse = new JSONParser();
	         
	         // JSONParse에 json데이터를 넣어 파싱한 다음 JSONObject로 변환한다.
	         JSONObject jsonObj = (JSONObject) jsonParse.parse(sb.toString());
	         
	         // System.out.println(jsonObj.get("access_token"));
	         // System.out.println(jsonObj.get("refresh_token"));
	         // System.out.println(jsonObj.get("token_type"));
	         // System.out.println(jsonObj.get("expires_in"));
	         String access_token = (String) jsonObj.get("access_token");
	         String refresh_token = (String) jsonObj.get("refresh_token");
	         String token_type = (String) jsonObj.get("token_type");
	         String expires_in = (String) jsonObj.get("expires_in");
	         
	         String apiUrl2 = "https://openapi.naver.com/v1/nid/me";
	         String header = "Bearer "+access_token;
	         Map<String, String> requestHeaders = new HashMap<String, String>();
	         requestHeaders.put("Authorization", header);
	         
	         String responseBody = get(apiUrl2, requestHeaders);
	         
	         // System.out.println(responseBody);
	         
	         JSONObject jsonObj2 = (JSONObject) jsonParse.parse(responseBody);
	         
	         String resultcode = (String) jsonObj2.get("resultcode");
	         String message = (String) jsonObj2.get("message");
	         
	        
	         
	         if(resultcode.equals("00") && message.equals("success")) {
	        	
	        	 
	            // System.out.println(jsonObj2.get("response"));
	            JSONObject jsonObj3 =  (JSONObject) jsonObj2.get("response");
	            String name = (String) jsonObj3.get("name");
	            String nickname = (String) jsonObj3.get("nickname");
	            String id = (String) jsonObj3.get("id");
	            String email = (String) jsonObj3.get("email");
	            System.out.println(name+"/"+nickname+"/"+id+"/"+email);
	            
	            vo = new AnimemVO();
	            
	            vo.setM_id(id);
	            vo.setM_name(name);
	            vo.setM_email(email);
	            
	            System.out.println(vo.getM_name());
	            System.out.println(vo.getM_id());
	            System.out.println(vo.getM_email());
	         }
	      }
	      
	      mv.setViewName("main");
	      mv.addObject("memvo", vo);
	      return mv;
	   }
	   
	   private static String get(String apiUrl, Map<String, String> requestHeaders){
	        HttpURLConnection con = connect(apiUrl);
	        try {
	            con.setRequestMethod("GET");
	            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
	                con.setRequestProperty(header.getKey(), header.getValue());
	            }

	            int responseCode = con.getResponseCode();
	            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
	                return readBody(con.getInputStream());
	            } else { // 에러 발생
	                return readBody(con.getErrorStream());
	            }
	        } catch (IOException e) {
	            throw new RuntimeException("API 요청과 응답 실패", e);
	        } finally {
	            con.disconnect();
	        }
	    }

	    private static HttpURLConnection connect(String apiUrl){
	        try {
	            URL url = new URL(apiUrl);
	            return (HttpURLConnection)url.openConnection();
	        } catch (MalformedURLException e) {
	            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
	        } catch (IOException e) {
	            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
	        }
	    }

	    private static String readBody(InputStream body){
	        InputStreamReader streamReader = new InputStreamReader(body);

	        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
	            StringBuilder responseBody = new StringBuilder();

	            String line;
	            while ((line = lineReader.readLine()) != null) {
	                responseBody.append(line);
	            }

	            return responseBody.toString();
	        } catch (IOException e) {
	            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
	        }
	    }
}