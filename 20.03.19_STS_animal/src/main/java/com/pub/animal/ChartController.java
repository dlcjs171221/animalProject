package com.pub.animal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChartController {

		@RequestMapping("stat1.inc")
	public String stat1() {
		return "stat1";
	}
	
}
