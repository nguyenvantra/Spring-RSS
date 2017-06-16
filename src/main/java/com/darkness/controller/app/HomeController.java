package com.darkness.controller.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.darkness.service.ArticleService;
import com.darkness.util.Constant;

@Controller
public class HomeController {
	@Autowired
	ArticleService articleService;

	@GetMapping(value = "/home")
	public String index(Model model) {

		model.addAttribute("listArticleHome", articleService.findArticleHome(1, 5));
		model.addAttribute("listArticleHotPost", articleService.findArticleHot(1, 7));
		model.addAttribute("home", "home");

		model.addAttribute("listArticleXahoi", articleService
				.findArticleByCategory(Constant.XAHOI, 1, 3));
		model.addAttribute("listArticleThegioi", articleService
				.findArticleByCategory(Constant.THEGIOI, 1, 3));
		model.addAttribute("listArticleVanhoa", articleService
				.findArticleByCategory(Constant.VANHOA, 1, 3));
		model.addAttribute("listArticleKinhte", articleService
				.findArticleByCategory(Constant.KINHTE, 1, 3));
		model.addAttribute("listArticleGiaoduc", articleService
				.findArticleByCategory(Constant.GIAODUC, 1, 3));
		model.addAttribute("listArticlePhapluat", articleService
				.findArticleByCategory(Constant.PHAPLUAT, 1, 3));
		model.addAttribute("listArticleThethao", articleService
				.findArticleByCategory(Constant.THETHAO, 1, 3));
		model.addAttribute("listArticleGiaitri", articleService
				.findArticleByCategory(Constant.GIAITRI, 1, 3));
		model.addAttribute("listArticleXeco", articleService
				.findArticleByCategory(Constant.XECO, 1, 3));
		
		return "home";
	}
}
