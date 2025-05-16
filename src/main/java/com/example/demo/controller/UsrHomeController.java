package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.dto.ResultData;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UsrHomeController {
	
	@GetMapping("/usr/home/main")
	public String showMain(HttpServletRequest req) {
		HttpSession session = req.getSession();
		
		session.setAttribute("a", "test");
		session.setAttribute("b", 123);
		session.setAttribute("c", ResultData.from("S-1", "테스트용"));
		
		return "usr/home/main";
	}
	
	@GetMapping("/")
	public String showRoot() {
		return "redirect:/usr/home/main";
	}
}