package com.darkness.service;

import java.util.List;

import com.darkness.domain.Article;

public interface APIArticleService {
	List<Article> findAll();

	List<Article> findByLimit(int first, int max);
	
	List<Article> findByCategory(int id);
}
