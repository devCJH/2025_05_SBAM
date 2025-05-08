package com.example.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.dao.ArticleDao;
import com.example.demo.dto.Article;

@Service
public class ArticleService {

	private ArticleDao articleDao;
	
	public ArticleService(ArticleDao articleDao) {
		this.articleDao = articleDao;
	}

	public int writeArticle(String title, String body) {
		return this.articleDao.writeArticle(title, body);
	}

	public List<Article> getArticles() {
		return this.articleDao.getArticles();
	}
}
