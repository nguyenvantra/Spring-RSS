package com.darkness.dao;

import java.util.List;

import com.darkness.domain.RSS;

public interface RSSDAO {
	List<RSS> findAll();

	RSS findOne(String name);

	RSS findOne(int id);

	void create(RSS rss);

	void update(RSS rss);

	void delete(RSS rss);

	int count();
}
