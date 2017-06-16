package com.darkness.dao;

import java.util.List;

import com.darkness.domain.RSSLink;

public interface RSSLinkDAO {
	List<RSSLink> findAll();

	RSSLink findOne(String name);

	RSSLink findOne(int id);

	void create(RSSLink rssLink);

	void update(RSSLink rssLink);

	void delete(RSSLink rssLink);

	int count();
}
