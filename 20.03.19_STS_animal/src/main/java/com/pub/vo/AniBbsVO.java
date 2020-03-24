package com.pub.vo;

import org.springframework.web.multipart.MultipartFile;

public class AniBbsVO {

	private String b_idx,
			subject,
			writer,
			write_date,
			content,
			hit,
			file_name,
			ori_name,
			ip,
			bname,
			kind,
			email,
			phone,
			lose_date,
			m_id;
	
	//첨부파일
	private MultipartFile file;
	
}
