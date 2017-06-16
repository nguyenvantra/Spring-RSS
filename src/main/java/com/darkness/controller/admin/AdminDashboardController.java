package com.darkness.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.darkness.service.ArticleService;
import com.darkness.service.CategoryService;
import com.darkness.service.RSSLinkService;
import com.darkness.service.RSSService;

@Controller
public class AdminDashboardController {
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	RSSLinkService rssLinkService;
	
	@Autowired
	ArticleService articleService;
	
	@Autowired
	RSSService rssService;
	
	@GetMapping("/admin")
	public String index(Model model){
		model.addAttribute("rssCount", rssService.count());
		model.addAttribute("categoryCount", categoryService.count());
		model.addAttribute("rssLinkCount", rssLinkService.count());
		model.addAttribute("articleCount", articleService.count());
		
		model.addAttribute("listArticle", articleService.findArticleHome(1, 5));
		
		return "dashboard";
	}
}
