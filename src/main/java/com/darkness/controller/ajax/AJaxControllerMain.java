package com.darkness.controller.ajax;

import java.io.IOException;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.darkness.domain.Article;
import com.darkness.domain.RSSLink;
import com.darkness.service.ArticleService;
import com.darkness.service.CategoryService;
import com.darkness.service.RSSLinkService;
import com.darkness.util.Constant;
import com.darkness.util.ReadRSS;
import com.sun.syndication.io.FeedException;

@Controller
public class AJaxControllerMain {
	@Autowired
	CategoryService categoryService;

	@Autowired
	RSSLinkService rssLinkService;

	@Autowired
	ArticleService articleService;

	/*
	 * Get rsslink
	 */
	@RequestMapping(value = "/ajax/rsslink/get/{id}", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String ajaxGetRSSLinkById(@PathVariable("id") int id) {
		Set<RSSLink> set = categoryService.findOne(id).getRssLinks();
		String data = null;
		for (RSSLink rssLink : set) {
			data += "<option value=\"" + rssLink.getId() + "\">" + rssLink.getName() + "</option>";
		}
		return data;
	}

	/*
	 * Get Article
	 */

	@GetMapping(value = "/ajax/article/get/{id}")
	public String ajaxGetArticleById(@PathVariable("id") int id, Model model)
			throws IllegalArgumentException, FeedException, IOException {
		String linkRSS = rssLinkService.findOne(id).getLinkRSS();
		List<Article> articles = ReadRSS.Instance().getData(linkRSS, id);

		model.addAttribute("articles", articles);
		return "articleData";
	}

	/*
	 * Add Article
	 */
	@GetMapping(value = "/ajax/article/add")
	public @ResponseBody String addArticle(HttpServletRequest request) {
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String linkArticle = request.getParameter("linkArticle");
		String linkImage = request.getParameter("linkImage");
		int rssLinkId = Integer.parseInt(request.getParameter("rssLinkId"));

		Article article = new Article();
		article.setTitle(title);
		article.setDescription(description);
		article.setHotPost(false);
		article.setShowHome(false);
		article.setLinkArticle(linkArticle);
		article.setLinkImage(linkImage);
		article.setRssLink(rssLinkService.findOne(rssLinkId));

		String ajaxResponse = "";

		Article dbArticle = articleService.findOne(article.getTitle());
		if (dbArticle != null && dbArticle.getId() != article.getId()) {
			ajaxResponse = "ERROR";
		} else {
			articleService.create(article);
			ajaxResponse = "OK";
		}
		return ajaxResponse;
	}

	@GetMapping(value = "/ajax/article/loadmore/{id}/{page}")
	public String ajaxMoreArticleById(@PathVariable("id") int id,
			@PathVariable("page") int page, Model model) {
		if (page != 1) {
            page = (page - 1) * Constant.QUESTION_PER_PAGE + 1;
        }
		
		System.out.println("page "+page+"|"+"id "+id);
		
		List<Article> articles = articleService.
				findArticleByCategory(id,page,Constant.QUESTION_PER_PAGE);
		
		for (Article article : articles) {
			System.out.println(article.getTitle());
		}
		
		model.addAttribute("articles", articles);
		
		return "dataloadmore";
	}

}
