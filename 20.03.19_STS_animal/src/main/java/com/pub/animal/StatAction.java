package com.pub.animal;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pub.vo.ShelterVO;

@Controller
public class StatAction {

	@RequestMapping("/stat.inc")
	public String search() {
		return "stat";
	}
}
