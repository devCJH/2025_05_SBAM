package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UsrHomeController {
	
	@GetMapping("/usr/home/main")
	public String showMain(Model model) {
		
		model.addAttribute("a", 789);
		model.addAttribute("b", 456);
		model.addAttribute("c", 123);
		
		return "usr/home/main";
	}
	
}