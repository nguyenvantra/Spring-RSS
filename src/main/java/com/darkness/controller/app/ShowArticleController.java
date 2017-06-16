package com.darkness.controller.app;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.darkness.domain.Article;
import com.darkness.domain.Category;
import com.darkness.service.ArticleService;
import com.darkness.service.CategoryService;
import com.darkness.util.Constant;

@Controller
public class ShowArticleController {
	@Autowired
	ArticleService articleService;

	@Autowired
	CategoryService categoryService;

	@GetMapping(value = "/{id}/{unsignedName}")
	public String index(@PathVariable int id, @PathVariable String unsignedName, Model model) {
		Category category = categoryService.findOne(id);
		if (category == null) {
			return "404";
		} else {

			List<Article> hotArticles = articleService.findArticleByHotCategory(id, 1, 5);
			List<Article> articleHome = articleService.findArticleByCategory(id, 1, 6);
			List<Article> articles = articleService.findArticleByCategory(id,1,Constant.QUESTION_PER_PAGE);

			model.addAttribute("hotArticles", hotArticles);
			model.addAttribute("articleHome", articleHome);
			model.addAttribute("articles", articles);
			model.addAttribute("name", unsignedName);
			model.addAttribute("id", id);
		}
		return "articleShow";
	}
}
