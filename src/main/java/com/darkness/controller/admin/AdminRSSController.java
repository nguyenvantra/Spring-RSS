package com.darkness.controller.admin;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.darkness.domain.RSS;
import com.darkness.service.RSSService;
import com.darkness.validator.RSSValidator;

@Controller
public class AdminRSSController {
	@Autowired
	RSSService rssService;

	@Autowired
	RSSValidator rssValidator;

	/*
	 * Show pages list rss
	 */
	@GetMapping("/admin/rss")
	public String index(Model model) {
		List<RSS> listRSS = rssService.findAll();

		model.addAttribute("listRSS", listRSS);
		return "rssList";
	}

	/*
	 * Show pages add RSS
	 */
	@GetMapping(value = "/admin/rss/add")
	public String add(Model model) {
		model.addAttribute("rss", new RSS());
		return "rssAdd";
	}

	/*
	 * Add new RSS
	 */
	@PostMapping(value = "/admin/rss/save")
	public String save(@ModelAttribute("rss") @Valid RSS rss, BindingResult result, Model model,
			RedirectAttributes redirect) throws UnsupportedEncodingException {
		rssValidator.validate(rss, result);

		if (result.hasErrors())
			return "rssAdd";

		rssService.create(rss);

		redirect.addFlashAttribute("success", "Saved RSS " + rss.getName() + " successfully!");
		return "redirect:/admin/rss";
	}

	/*
	 * Show pages edit user
	 */
	@GetMapping("/admin/rss/{id}/edit")
	public String edit(@PathVariable int id, Model model) {
		RSS rss = rssService.findOne(id);
		if (rss == null) {
			return "404";
		} else {
			model.addAttribute("rss", rss);
			return "rssEdit";
		}
	}

	/*
	 * Edit user
	 */
	@PostMapping(value = "/admin/rss/update")
	public String update(@ModelAttribute("rss") @Valid RSS rss, BindingResult result, Model model,
			RedirectAttributes redirect) {

		rssValidator.validate(rss, result);
		if (result.hasErrors())
			return "rssEdit";

		rssService.update(rss);

		redirect.addFlashAttribute("success", "Update RSS " + rss.getName() + " successfully!");
		return "redirect:/admin/rss";
	}

	/*
	 * Delete category
	 */
	@GetMapping("/admin/rss/{id}/delete")
	public String delete(@PathVariable int id, RedirectAttributes redirect) {
		RSS rss = rssService.findOne(id);
		if (rss == null) {
			return "404";
		} else {
			if (rss.getId() == 1) {
				redirect.addFlashAttribute("error", "Can not delete this RSS!");
			} else {
				rssService.delete(rss);
				redirect.addFlashAttribute("success", "Delete RSS " + rss.getName() + " successfully!");
			}
			return "redirect:/admin/rss";
		}
	}

}
