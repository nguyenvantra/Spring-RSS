package com.darkness.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.darkness.dao.RSSDAO;
import com.darkness.domain.CustomUserDetails;
import com.darkness.domain.RSS;
import com.darkness.domain.User;
import com.darkness.util.StringHelper;

@Service
public class RSSServiceImpl implements RSSService {
	@Autowired
	RSSDAO rssDAO;
	
	@Override
	public List<RSS> findAll() {
		return rssDAO.findAll();
	}

	@Override
	public RSS findOne(String name) {
		return rssDAO.findOne(name);
	}

	@Override
	public RSS findOne(int id) {
		return rssDAO.findOne(id);
	}

	@Override
	public void create(RSS rss) {
		rss.setCreatedAt(new Date());
		rss.setUpdatedAt(new Date());
		rss.setName(StringHelper.convertFromUTF8(rss.getName()));
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User currentUser = ((CustomUserDetails) principal).getUser();
        rss.setUser(currentUser);
		
		rssDAO.create(rss);
	}

	@Override
	public void update(RSS rss) {
		rss.setUpdatedAt(new Date());
		rss.setName(StringHelper.convertFromUTF8(rss.getName()));
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User currentUser = ((CustomUserDetails) principal).getUser();
        rss.setUser(currentUser);
		
		rssDAO.update(rss);
	}

	@Override
	public void delete(RSS rss) {
		rssDAO.delete(rss);
	}

	@Override
	public int count() {
		return rssDAO.count();
	}

}
