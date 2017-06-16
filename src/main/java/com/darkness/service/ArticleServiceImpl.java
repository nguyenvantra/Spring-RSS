package com.darkness.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.darkness.dao.ArticleDAO;
import com.darkness.domain.Article;
import com.darkness.domain.CustomUserDetails;
import com.darkness.domain.User;
import com.darkness.util.StringHelper;

@Service
public class ArticleServiceImpl implements ArticleService {
	@Autowired
	ArticleDAO articleDAO;

	@Override
	public List<Article> findAll() {
		return articleDAO.findAll();
	}

	@Override
	public Article findOne(String title) {
		return articleDAO.findOne(title);
	}

	@Override
	public Article findOne(int id) {
		return articleDAO.findOne(id);
	}

	@Override
	public void create(Article article) {
		article.setCreatedAt(new Date());
		article.setUpdatedAt(new Date());

		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User currentUser = ((CustomUserDetails) principal).getUser();
		article.setUser(currentUser);

		article.setUnsignedTitle(StringHelper.getUnsigned(article.getTitle()));

		articleDAO.create(article);

	}

	@Override
	public void update(Article article, String type, String display) {
		article.setUpdatedAt(new Date());

		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User currentUser = ((CustomUserDetails) principal).getUser();
		article.setUser(currentUser);

		article.setUnsignedTitle(StringHelper.getUnsigned(article.getTitle()));
		article.setTitle(StringHelper.convertFromUTF8(article.getTitle()));
		article.setDescription(StringHelper.convertFromUTF8(article.getDescription()));

		switch (type) {
		case "normal":
			article.setHotPost(false);
			break;
		case "hotpost":
			article.setHotPost(true);
			break;
		}
		
		switch (display) {
		case "show":
			article.setShowHome(true);
			break;
		case "hide":
			article.setShowHome(false);
			break;
		}
		
		articleDAO.update(article);
	}

	@Override
	public void delete(Article article) {
		articleDAO.delete(article);
	}

	@Override
	public int count() {
		return articleDAO.count();
	}

	@Override
	public List<Article> findArticleHome(int first, int max) {
		return articleDAO.findArticleHome(first, max);
	}

	@Override
	public List<Article> findArticleHot(int first, int max) {
		return articleDAO.findArticleHot(first, max);
	}

	@Override
	public List<Article> findArticleByCategory(int id, int first, int max) {
		return articleDAO.findArticleByCategory(id, first, max);
	}

	@Override
	public List<Article> findArticleByCategory(int id) {
		return articleDAO.findArticleByCategory(id);
	}

	@Override
	public List<Article> findArticleByHotCategory(int id, int first, int max) {
		return articleDAO.findArticleByHotCategory(id, first, max);
	}

}
