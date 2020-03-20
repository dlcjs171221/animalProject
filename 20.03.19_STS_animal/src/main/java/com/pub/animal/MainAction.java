package com.pub.animal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainAction {

	@RequestMapping("main.inc")
	public String main() {
		
		return "main";
	}
}
