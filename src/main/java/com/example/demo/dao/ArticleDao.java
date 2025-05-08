package com.example.demo.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.example.demo.dto.Article;

@Component
public class ArticleDao {
	private List<Article> articles;
	private int lastArticleId;
	
	public ArticleDao() {
		this.articles = new ArrayList<>();
		this.lastArticleId = 0;
	}

	public int writeArticle(String title, String body) {
		this.articles.add(new Article(++lastArticleId, title, body));
		return lastArticleId;
	}

	public List<Article> getArticles() {
		return this.articles;
	}
}
