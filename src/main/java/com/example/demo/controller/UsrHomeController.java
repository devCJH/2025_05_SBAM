package com.example.demo.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UsrHomeController {
	
	@GetMapping("/usr/home/main")
	public String showMain() {
		return "usr/home/main";
	}
	
	@GetMapping("/")
	public String showRoot() {
		return "redirect:/usr/home/main";
	}
	
	@GetMapping("/usr/home/test")
	@ResponseBody
	public Map<String, Object> ajaxTest(String test1, int test2) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("a", test1);
		map.put("b", test2);
		
		return map;
	}
}