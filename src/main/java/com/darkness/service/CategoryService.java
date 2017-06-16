package com.darkness.service;

import java.util.List;

import com.darkness.domain.Category;

public interface CategoryService {
	List<Category> findAll();

	Category findOne(String name);

	Category findOne(int id);

	void create(Category category);

	void update(Category category);

	void delete(Category category);

	int count();
}
