package com.darkness.service;

import java.util.List;

import com.darkness.domain.User;

public interface UserService {
	List<User> findAll();

	int count();

	void create(User user, String role);

	User findOne(String email);

	User findOne(int id);
	
	void update(User user, String role);
	
	void delete(User user);
}
