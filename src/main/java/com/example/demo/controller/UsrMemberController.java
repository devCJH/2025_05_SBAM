package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.LoginedMember;
import com.example.demo.dto.Member;
import com.example.demo.dto.Req;
import com.example.demo.dto.ResultData;
import com.example.demo.service.MemberService;
import com.example.demo.util.Util;

@Controller
public class UsrMemberController {
	
	private MemberService memberService;
	private Req req;
	
	public UsrMemberController(MemberService memberService, Req req) {
		this.memberService = memberService;
		this.req = req;
	}
	
	@GetMapping("/usr/member/join")
	public String join() {
		return "usr/member/join";
	}
	
	@PostMapping("/usr/member/doJoin")
	@ResponseBody
	public String doJoin(String loginId, String loginPw, String name) {
		
		this.memberService.joinMember(loginId, Util.encryptSHA256(loginPw), name);
		
		return Util.jsReplace(String.format("[ %s ] 님의 가입이 완료되었습니다", name), "/");
	}
	
	@GetMapping("/usr/member/loginIdDupChk")
	@ResponseBody
	public ResultData loginIdDupChk(String loginId) {
		
		Member member = this.memberService.getMemberByLoginId(loginId);
		
		if (member != null) {
			return ResultData.from("F-1", String.format("[ %s ] 은(는) 이미 사용중인 아이디입니다", loginId));
		}
		
		return ResultData.from("S-1", String.format("[ %s ] 은(는) 사용가능한 아이디입니다", loginId));
	}
	
	@GetMapping("/usr/member/login")
	public String login() {
		return "usr/member/login";
	}
	
	@PostMapping("/usr/member/doLogin")
	@ResponseBody
	public String doLogin(String loginId, String loginPw) {
		
		Member member = this.memberService.getMemberByLoginId(loginId);
		
		if (member == null) {
			return Util.jsReplace(String.format("[ %s ] 은(는) 존재하지 않는 회원입니다", loginId), "login");
		}
		
		if (member.getLoginPw().equals(Util.encryptSHA256(loginPw)) == false) {
			return Util.jsReplace("비밀번호가 일치하지 않습니다", "login");
		}
		
		this.req.login(new LoginedMember(member.getId(), member.getAuthLevel()));
		
		return Util.jsReplace(String.format("[ %s ] 님 환영합니다", member.getLoginId()), "/");
	}
	
	@GetMapping("/usr/member/logout")
	@ResponseBody
	public String logout() {
		
		this.req.logout();
		
		return Util.jsReplace("정상적으로 로그아웃 되었습니다", "/");
	}
	
	@GetMapping("/usr/member/getLoginId")
	@ResponseBody
	public String getLoginId() {
		return this.memberService.getLoginId(this.req.getLoginedMember().getId());
	}
	
	@GetMapping("/usr/member/findLoginId")
	public String findLoginId() {
		return "usr/member/findLoginId";
	}
	
	@GetMapping("/usr/member/doFindLoginId")
	@ResponseBody
	public ResultData doFindLoginId(String name, String email) {
		
		Member member = this.memberService.getMemberByNameAndEmail(name, email);
		
		if (member == null) {
			return ResultData.from("F-1", "입력하신 정보와 일치하는 회원이 없습니다");
		}
		
		return ResultData.from("S-1", String.format("회원님의 아이디는 [ %s ] 입니다", member.getLoginId()));
	}
	
	@GetMapping("/usr/member/findLoginPw")
	public String findLoginPw() {
		return "usr/member/findLoginPw";
	}
	
	@GetMapping("/usr/member/doFindLoginPw")
	@ResponseBody
	public ResultData doFindLoginPw(String loginId, String email) {
		
		Member member = this.memberService.getMemberByLoginId(loginId);
		
		if (member == null) {
			return ResultData.from("F-1", "입력하신 아이디와 일치하는 회원이 없습니다");
		}
		
		if (member.getEmail().equals(email) == false) {
			return ResultData.from("F-2", "이메일이 일치하지 않습니다");
		}
		
		String tempPassword = Util.createTempPassword();
		
		try {
			this.memberService.sendPasswordRecoveryEmail(member, tempPassword);
		} catch (Exception e) {
			return ResultData.from("F-3", "임시 패스워드 발송에 실패했습니다");
		}
		
		this.memberService.modifyPassword(member.getId(), Util.encryptSHA256(tempPassword));
		
		return ResultData.from("S-1", "회원님의 이메일주소로 임시 패스워드가 발송되었습니다");
	}
}