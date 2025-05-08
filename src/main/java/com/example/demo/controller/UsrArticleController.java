package com.example.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.Article;
import com.example.demo.service.ArticleService;

@Controller
public class UsrArticleController {
	
	private ArticleService articleService;
	
	public UsrArticleController(ArticleService articleService) {
		this.articleService = articleService;
	}
	
	@GetMapping("/usr/article/write")
	@ResponseBody
	public String write(String title, String body) {
		
		int id = this.articleService.writeArticle(title, body);
		
		return String.format("%d번 게시물이 생성되었습니다.", id);
	}
	
	@GetMapping("/usr/article/test")
	@ResponseBody
	public List<Article> test() {
		return this.articleService.getArticles();
	}
	
}
