package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.Article;

@Mapper
public interface ArticleDao {
	
	@Insert("""
			INSERT INTO article
			    SET regDate = NOW()
			        , updateDate = NOW()
			        , title = #{title}
			        , content = #{body}
			""")
	public int writeArticle(String title, String body);

	public List<Article> getArticles();
	
	public Article getArticleById(int id);

	public void modifyArticle(Article article, String title, String body);

	public void deleteArticle(Article article);
}
