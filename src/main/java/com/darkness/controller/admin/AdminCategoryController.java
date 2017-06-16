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

import com.darkness.domain.Category;
import com.darkness.service.CategoryService;
import com.darkness.validator.CategoryValidator;

@Controller
public class AdminCategoryController {
	@Autowired
	CategoryService categoryService;

	@Autowired
	CategoryValidator categoryValidator;

	/*
	 * Show pages list category
	 */
	@GetMapping("/admin/category")
	public String index(Model model) {
		List<Category> categories = categoryService.findAll();

		model.addAttribute("categories", categories);
		return "categoryList";
	}

	/*
	 * Show pages add category
	 */
	@GetMapping(value = "/admin/category/add")
	public String add(Model model) {
		model.addAttribute("category", new Category());
		return "categoryAdd";
	}

	/*
	 * Add new category
	 */
	@PostMapping(value = "/admin/category/save")
	public String save(@Valid Category category, BindingResult result, Model model,
			RedirectAttributes redirect) throws UnsupportedEncodingException {
		categoryValidator.validate(category, result);

		if (result.hasErrors())
			return "categoryAdd";
		
		categoryService.create(category);
		
		redirect.addFlashAttribute("success", "Saved category " + category.getName() + " successfully!");
		return "redirect:/admin/category";
	}
	
	/*
	 * Show pages edit user
	 */
	@GetMapping("/admin/category/{id}/edit")
	public String edit(@PathVariable int id, Model model) {
		Category category = categoryService.findOne(id);
		if (category == null) {
			return "404";
		} else {
			model.addAttribute("category", category);
			return "categoryEdit";
		}
	}
	
	/*
	 * Edit user
	 */
	@PostMapping(value = "/admin/category/update")
	public String update(@ModelAttribute("category") @Valid Category category, BindingResult result,
			Model model, RedirectAttributes redirect) {
		
		categoryValidator.validate(category, result); 
		if (result.hasErrors()) return "categoryEdit";
		
		categoryService.update(category);
		
		redirect.addFlashAttribute("success", "Update category " + category.getName() + " successfully!");
		return "redirect:/admin/category";
	}
	
	/*
	 * Delete category
	 */
	@GetMapping("/admin/category/{id}/delete")
	public String delete(@PathVariable int id, RedirectAttributes redirect) {
		Category category = categoryService.findOne(id);
		if (category == null) {
			return "404";
		} else {
			if (category.getId() == 1) {
				redirect.addFlashAttribute("error", "Can not delete this category!");
			} else {
				categoryService.delete(category);
				redirect.addFlashAttribute("success", "Delete category " + category.getName() + " successfully!");
			}
			return "redirect:/admin/category";
		}
	}
	
}
