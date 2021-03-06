package com.darkness.service;

import java.util.List;

import com.darkness.domain.Article;

public interface ArticleService {
	List<Article> findAll();

	List<Article> findArticleHome(int first, int max);

	List<Article> findArticleHot(int first, int max);

	List<Article> findArticleByCategory(int id, int first, int max);

	List<Article> findArticleByCategory(int id);

	List<Article> findArticleByHotCategory(int id, int first, int max);

	Article findOne(String title);

	Article findOne(int id);

	void create(Article article);

	void update(Article article, String type, String display);

	void delete(Article article);

	int count();
}
