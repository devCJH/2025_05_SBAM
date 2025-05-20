package com.example.demo.dto;

import java.io.IOException;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;

import com.example.demo.util.Util;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.Getter;

@Component
@Scope(value = "request", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class Req {
	
	@Getter
	private int loginedMemberId;
	private HttpServletResponse resp;
	private HttpSession session;
	
	public Req(HttpServletRequest request, HttpServletResponse resp) {
		
		this.resp = resp;
		
		this.session = request.getSession();
		
		int loginedMemberId = -1;
		
		if (this.session.getAttribute("loginedMemberId") != null) {
			loginedMemberId = (int) session.getAttribute("loginedMemberId");
		}
		
		this.loginedMemberId = loginedMemberId;
		
		request.setAttribute("req", this);
	}
	
	public void init() {
	}
	
	public void login(int loginedMemberId) {
		this.session.setAttribute("loginedMemberId", loginedMemberId);
	}

	public void logout() {
		this.session.removeAttribute("loginedMemberId");
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
