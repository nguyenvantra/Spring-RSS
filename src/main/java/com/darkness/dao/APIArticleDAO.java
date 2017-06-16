package com.darkness.dao;

import java.util.List;

import com.darkness.domain.Article;

public interface APIArticleDAO {
	List<Article> findAll();

	List<Article> findByLimit(int first, int max);

	List<Article> findByCategory(int id);
}
