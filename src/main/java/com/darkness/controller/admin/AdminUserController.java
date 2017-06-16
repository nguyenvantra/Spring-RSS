package com.darkness.controller.admin;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.darkness.domain.User;
import com.darkness.service.UserService;
import com.darkness.validator.UserEditValidator;
import com.darkness.validator.UserValidator;

@Controller
public class AdminUserController {

	@Autowired
	UserService userService;

	@Autowired
	UserValidator userValidator;
	
	@Autowired
	UserEditValidator userEditValidator;

	/*
	 * Show pages list user
	 */
	@GetMapping(value = "/admin/user")
	public String index(Model model) {
		List<User> users = userService.findAll();
		model.addAttribute("users", users);
		return "userList";
	}

	/*
	 * Show pages add user
	 */
	@GetMapping(value = "/admin/user/add")
	public String add(Model model) {
		model.addAttribute("user", new User());
		return "userAdd";
	}

	/*
	 * Add new user
	 */
	@PostMapping(value = "/admin/user/save")
	public String save(@Valid User user, BindingResult result,
			@RequestParam(name = "role", required = false) String role,
			Model model, RedirectAttributes redirect) {
		userValidator.validate(user, result);
		if (result.hasErrors())
			return "userAdd";
		
		userService.create(user, role);
		
		redirect.addFlashAttribute("success", "Saved user " + user.getName() + " successfully!");
		return "redirect:/admin/user";
	}

	/*
	 * Show pages edit user
	 */
	@GetMapping("/admin/user/{id}/edit")
	public String edit(@PathVariable int id, Model model) {
		User user = userService.findOne(id);
		if (user == null) {
			return "404";
		} else {
			model.addAttribute("user", user);
			return "userEdit";
		}
	}
	
	/*
	 * Edit user
	 */
	@PostMapping(value = "/admin/user/update")
	public String update(@ModelAttribute("user") @Valid User user, BindingResult result,
			@RequestParam(name = "role", required = false) String role,
			Model model, RedirectAttributes redirect) {
		
		userEditValidator.validate(user, result); 
		if (result.hasErrors()) return "userEdit";
		
		userService.update(user, role);
		redirect.addFlashAttribute("success", "Update user " + user.getName() + " successfully!");
		return "redirect:/admin/user";
	}

	/*
	 * Reset password user
	 */
	@GetMapping("/admin/user/{id}/resetpass")
	public String resetPass(@PathVariable int id, Model model) {
		User user = userService.findOne(id);
		if (user == null) {
			return "404";
		} else {
			model.addAttribute("idUser", user.getId());
			model.addAttribute("user", new User());
			return "userResetpass";
		}
	}

	/*
	 * Delete user
	 */
	@GetMapping("/admin/user/{id}/delete")
	public String delete(@PathVariable int id, RedirectAttributes redirect) {
		User user = userService.findOne(id);
		if (user == null) {
			return "404";
		} else {
			if (user.getId() == 1) {
				redirect.addFlashAttribute("error", "Can not delete this user!");
			} else {
				userService.delete(user);
				redirect.addFlashAttribute("success", "Delete user " + user.getName() + " successfully!");
			}
			return "redirect:/admin/user";
		}
	}

}
