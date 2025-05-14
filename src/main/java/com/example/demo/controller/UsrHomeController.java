package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	public String inputTest() {
		return "usr/home/test";
	}
	
	@PostMapping("/usr/home/test1")
	@ResponseBody
	public String inputTest1(String title, String content) {
		return title + "/" + content;
	}
	
}