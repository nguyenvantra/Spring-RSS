package com.darkness.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.darkness.dao.CategoryDAO;
import com.darkness.domain.Category;
import com.darkness.domain.CustomUserDetails;
import com.darkness.domain.User;
import com.darkness.util.StringHelper;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryDAO categoryDAO;

	@Override
	public int count() {
		return categoryDAO.count();
	}

	@Override
	public List<Category> findAll() {
		return categoryDAO.findAll();
	}

	@Override
	public Category findOne(String name) {
		return categoryDAO.findOne(name);
	}

	@Override
	public void create(Category category) {
		category.setCreatedAt(new Date());
		category.setUpdatedAt(new Date());
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User currentUser = ((CustomUserDetails) principal).getUser();
        category.setUser(currentUser);
        
        category.setName(StringHelper.convertFromUTF8(category.getName()));
        category.setUnsignedName(StringHelper.slugify(category.getName()));
        
        categoryDAO.create(category);
	}

	@Override
	public Category findOne(int id) {
		return categoryDAO.findOne(id);
	}

	@Override
	public void update(Category category) {
		category.setUpdatedAt(new Date());
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User currentUser = ((CustomUserDetails) principal).getUser();
        category.setUser(currentUser);
        
        category.setName(StringHelper.convertFromUTF8(category.getName()));
        category.setUnsignedName(StringHelper.slugify(category.getName()));
        
		categoryDAO.update(category);
	}

	@Override
	public void delete(Category category) {
		categoryDAO.delete(category);
	}

}
