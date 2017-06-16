package com.darkness.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.darkness.dao.APIArticleDAO;
import com.darkness.domain.Article;

@Service
public class APIArticleServiceImpl implements APIArticleService {
	@Autowired
	APIArticleDAO apiArticleDAO;

	@Override
	public List<Article> findAll() {
		return apiArticleDAO.findAll();
	}

	@Override
	public List<Article> findByLimit(int first, int max) {
		return apiArticleDAO.findByLimit(first, max);
	}

	@Override
	public List<Article> findByCategory(int id) {
		return apiArticleDAO.findByCategory(id);
	}

}
