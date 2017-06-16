package com.darkness.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.darkness.domain.Article;
import com.darkness.service.ArticleService;

@Component
public class ArticleValidator implements Validator {
	@Autowired
	ArticleService articleService;

	@Override
	public boolean supports(Class<?> cls) {
		return Article.class.isAssignableFrom(cls);
	}

	@Override
	public void validate(Object o, Errors errors) {
		Article article = (Article) o;

		// Unique category
		Article dbArticle = articleService.findOne(article.getTitle());
		if (dbArticle != null && dbArticle.getId() != article.getId()) {
			errors.rejectValue("title", "Unique.article.title");
		}
	}

}
