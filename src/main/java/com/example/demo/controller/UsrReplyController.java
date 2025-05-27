package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.Req;
import com.example.demo.service.ReplyService;

@Controller
public class UsrReplyController {

	private ReplyService replyService;
	private Req req;

	public UsrReplyController(ReplyService replyService, Req req) {
		this.replyService = replyService;
		this.req = req;
	}

	@PostMapping("/usr/reply/doWrite")
	@ResponseBody
	public String doWrite(String relTypeCode, int relId, String content) {
		
		this.replyService.writeReply(req.getLoginedMember().getId(), relTypeCode, relId, content);
		
		return "댓글 작성 완료";
	}
}
