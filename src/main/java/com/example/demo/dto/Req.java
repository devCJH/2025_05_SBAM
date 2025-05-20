package com.example.demo.dto;

import java.io.IOException;

import com.example.demo.util.Util;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.Getter;

public class Req {
	
	@Getter
	private int loginedMemberId;
	private HttpServletResponse resp;
	
	public Req(HttpServletRequest req, HttpServletResponse resp) {
		
		this.resp = resp;
		
		HttpSession session = req.getSession();
		
		int loginedMemberId = -1;
		
		if (session.getAttribute("loginedMemberId") != null) {
			loginedMemberId = (int) session.getAttribute("loginedMemberId");
		}
		
		this.loginedMemberId = loginedMemberId;
	}
	
	public void jsPrintReplace(String msg, String uri) {
		this.resp.setContentType("text/html; charset=UTF-8;");
		
		try {
			this.resp.getWriter().append(Util.jsReplace(msg, uri));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
