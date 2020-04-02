package com.pub.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.pub.vo.AniBbsVO;

public class AniDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	//전체 게시물의 수를 반환하는 기능 - list.jsp에서 호출
	public int getTotalCount(String bname) {
		
		int cnt = template.selectOne("ani.totalCount", bname);
				
		return cnt;
	}
	
	//원하는 페이지의 게시물들을 목록화면으로
	//표현하기 위해 배열로 반환하는 기능 - list.jsp
	public AniBbsVO[] getList(String bname, int begin, int end) {
		
		AniBbsVO[] ar = null;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("bname", bname);
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));
		
		List<AniBbsVO> list = template.selectList("ani.list", map);
		//각 게시물을 의미하는 객체가 BbsVO이다. 그 안에
		// 댓글들이 들어온 상태다.
		
		//받은 list를 준비된 배열로 변환해야 한다.
		if(list != null) {
			ar = new AniBbsVO[list.size()];
			list.toArray(ar);
		}
		
		
		return ar;
	
	}
	
	//해당 게시판에 전체 게시물들을 배열로 반환하는 기능
	public AniBbsVO[] allList(String bname) {
		
		AniBbsVO[] ar = null;
		
		List<AniBbsVO> list = template.selectList("ani.alllist", bname);
		
		if(list != null) {
			ar = new AniBbsVO[list.size()];
			list.toArray(ar);
		}
		
		return ar;
	}
	
	//유기게시물 저장기능
		public boolean addUgi(AniBbsVO vo) {
			boolean value = false;

			int cnt = template.insert("ani.ugi_add", vo);
			
			if(cnt > 0) {
				value = true;
				
			}
			
			return value;
		}
	
	//인포게시물 저장기능
			public boolean addInfo(AniBbsVO vo) {
				
				boolean value = false;
					
				
				int cnt = template.insert("ani.info_add", vo);
				
				if(cnt > 0) {
					value = true;
				}
				
				return value;
			}
				
	
		
		// b_idx값을 인자로 받아서 bbs.getBbs라는 맵퍼를 호출하는 기능
		// 즉, 보기 기능(view.jsp)에서 호출되는 함수이며 특정 게시물 정보를
		// 반환해야 한다.
		public AniBbsVO getBbs(String b_idx) {
			
			
			AniBbsVO vo = template.selectOne("ani.getBbs", b_idx);
			
			
			return vo;
		}	
		
		//인자로 받은 b_idx의 게시물 hit를 증가하는 기능
		public void hit(String b_idx) {
					
			int cnt = template.update("ani.hit", b_idx);
					
		}
		
	
}
