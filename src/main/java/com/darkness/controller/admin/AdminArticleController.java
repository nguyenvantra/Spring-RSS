package com.darkness.controller.admin;

import java.beans.PropertyEditorSupport;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.darkness.domain.Article;
import com.darkness.domain.RSSLink;
import com.darkness.service.ArticleService;
import com.darkness.service.CategoryService;
import com.darkness.service.RSSLinkService;
import com.darkness.validator.ArticleValidator;

@Controller
public class AdminArticleController {
	@Autowired
	ArticleService articleService;

	@Autowired
	CategoryService categoryService;

	@Autowired
	RSSLinkService rssLinkService;

	@Autowired
	ArticleValidator articleValidator;

	/*
	 * Show pages list article
	 */
	@GetMapping("/admin/article")
	public String index(Model model) {
		List<Article> articles = articleService.findAll();
		model.addAttribute("articles", articles);
		return "articleList";
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(RSSLink.class, "rssLink", new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) {
				RSSLink rssLink = rssLinkService.findOne(Integer.parseInt(text));
				setValue(rssLink);
			}
		});
	}

	/*
	 * Show pages add article
	 */
	@GetMapping(value = "/admin/article/add")
	public String add(Model model) {
		model.addAttribute("categories", categoryService.findAll());
		return "articleAdd";
	}

	/*
	 * Edit article
	 */
	@GetMapping(value = "/admin/article/{id}/edit")
	public String edit(@PathVariable int id, Model model) {
		Article article = articleService.findOne(id);
		if (article == null) {
			return "404";
		} else {
			model.addAttribute("rssLinkes", rssLinkService.findAll());
			model.addAttribute("article", article);

			return "articleEdit";
		}
	}

	@PostMapping(value = "/admin/article/update")
	public String update(@ModelAttribute("article") @Valid Article article,
			@RequestParam(name = "type", required = false) String type,
			@RequestParam(name = "display", required = false) String display, BindingResult result,
			RedirectAttributes redirect) {

		articleValidator.validate(article, result);
		if (result.hasErrors())
			return "articleEdit";

		articleService.update(article, type, display);
		redirect.addFlashAttribute("success", "Update article " + article.getTitle() + " successfully!");
		return "redirect:/admin/article";
	}

	/*
	 * Delete article
	 */
	@GetMapping("/admin/article/{id}/delete")
	public String delete(@PathVariable int id, RedirectAttributes redirect) {
		Article article = articleService.findOne(id);
		if (article == null) {
			return "404";
		} else {
			articleService.delete(article);
			redirect.addFlashAttribute("success", "Delete article " + article.getTitle() + " successfully!");
			return "redirect:/admin/article";
		}
	}
	
}
