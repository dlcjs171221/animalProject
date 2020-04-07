package com.pub.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.pub.vo.ShelterVO;

public class ShelterDAO {
		
	@Autowired
	private SqlSessionTemplate Template;
	
	//전체 게시물의 수를 반환하는 기능 - list.jsp에서 호출
	public int getTotalCount() {
		
		int cnt = Template.selectOne("shelter.totalCount");
				
		return cnt;
	}

	//보호소 전체 보여주기 
	public ShelterVO[]  list (String begin,String end) {
		ShelterVO[] ar = null;
		
		Map<String, String> map = new HashMap<String, String>();
	    map.put("begin",begin);
	    map.put("end",end);
	   
		List<ShelterVO> list = Template.selectList("shelter.list",map);
		
		if(list != null) {
			ar = new ShelterVO[list.size()];
			list.toArray(ar);
		}
		
	 return ar;
	}
	
	//보호소 검색
	public ShelterVO[] searchShelter(String type,String value) {
		ShelterVO[] ar = null;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchType",type);
		map.put("searchValue",value);
		
		List<ShelterVO> list = Template.selectList("shelter.search",map);
		
		if(list != null && !list.isEmpty()) {
			ar = new ShelterVO[list.size()];
			list.toArray(ar);
		}
		return ar;
		
	}
	
	
}
