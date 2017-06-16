package com.darkness.dao;

import java.util.List;

import com.darkness.domain.User;

public interface UserDAO {
	List<User> findAll();

	int count();

	void create(User user);

	User findOne(String email);

	User findOne(int id);

	void update(User user);

	void delete(User user);
}
