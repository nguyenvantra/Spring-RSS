package com.darkness.controller.admin;

import java.beans.PropertyEditorSupport;
import java.io.UnsupportedEncodingException;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.darkness.domain.Category;
import com.darkness.domain.RSS;
import com.darkness.domain.RSSLink;
import com.darkness.service.CategoryService;
import com.darkness.service.RSSLinkService;
import com.darkness.service.RSSService;
import com.darkness.validator.RSSLinkValidator;

@Controller
public class AdminRSSLinkController {
	@Autowired
	RSSLinkService rssLinkService;
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	RSSService rssService;
	
	@Autowired
	RSSLinkValidator rssLinkValidator;
	
	@GetMapping("/admin/rsslink")
	public String index(Model model) {

		List<RSSLink> rssLinks = rssLinkService.findAll();
		model.addAttribute("rssLinks", rssLinks);

		return "rsslinkList";
	}
	
	/*
	 * Show pages add rss-link
	 */
	@GetMapping(value = "/admin/rsslink/add")
	public String add(Model model) {
		model.addAttribute("categories", categoryService.findAll());
		model.addAttribute("rsses", rssService.findAll());
		model.addAttribute("rssLink", new RSSLink());

		return "rsslinkAdd";
	}
	
	@InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Category.class, "category", new PropertyEditorSupport() {
            @Override
            public void setAsText(String text) {
                Category category = categoryService.findOne(Integer.parseInt(text));
                setValue(category);
            }
        });
        
        binder.registerCustomEditor(RSS.class, "rss", new PropertyEditorSupport() {
            @Override
            public void setAsText(String text) {
                RSS rss = rssService.findOne(Integer.parseInt(text));
                setValue(rss);
            }
        });
	}
	
	/*
	 * Add new sub-category
	 */
	@PostMapping(value = "/admin/rsslink/save")
	public String save(@ModelAttribute("rssLink") @Valid RSSLink rssLink, BindingResult result, Model model, RedirectAttributes redirect)
			throws UnsupportedEncodingException {
		
		rssLinkValidator.validate(rssLink, result);

		if (result.hasErrors()) {
			model.addAttribute("categories", categoryService.findAll());
			model.addAttribute("rsses", rssService.findAll());
			return "rsslinkAdd";
		}

		rssLinkService.create(rssLink);

		redirect.addFlashAttribute("success", "Saved RSS-Link " + rssLink.getName() + " successfully!");
		return "redirect:/admin/rsslink";
	}
	
	/*
	 * Show pages edit sub-category
	 */
	@GetMapping("/admin/rsslink/{id}/edit")
	public String edit(@PathVariable int id, Model model) {
		RSSLink rssLink = rssLinkService.findOne(id);
		if (rssLink == null) {
			return "404";
		} else {			
			model.addAttribute("categories", categoryService.findAll());
			model.addAttribute("rsses", rssService.findAll());
			model.addAttribute("rssLink", rssLink);
			
			return "rsslinkEdit";
		}
	}
	
	/*
	 * Edit sub-category
	 */
	@PostMapping(value = "/admin/rsslink/update")
	public String update(@ModelAttribute("rssLink") @Valid RSSLink rssLink, BindingResult result,
			Model model, RedirectAttributes redirect) {
		
		rssLinkValidator.validate(rssLink, result); 
		if (result.hasErrors()) return "rsslinkEdit";
		
		rssLinkService.update(rssLink);
		
		redirect.addFlashAttribute("success", "Update RSS-Link " + rssLink.getName() + " successfully!");
		return "redirect:/admin/rsslink";
	}
	
	/*
	 * Delete sub-category
	 */
	@GetMapping("/admin/rsslink/{id}/delete")
	public String delete(@PathVariable int id, RedirectAttributes redirect) {
		RSSLink rssLink = rssLinkService.findOne(id);
		if (rssLink == null) {
			return "404";
		} else {
			if (rssLink.getId() == 1) {
				redirect.addFlashAttribute("error", "Can not delete this RSS-Link!");
			} else {
				rssLinkService.delete(rssLink);
				redirect.addFlashAttribute("success", "Delete RSS-Link " + rssLink.getName() + " successfully!");
			}
			return "redirect:/admin/rsslink";
		}
	}
}
