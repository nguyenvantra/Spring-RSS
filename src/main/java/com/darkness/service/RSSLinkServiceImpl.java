package com.darkness.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.darkness.dao.RSSLinkDAO;
import com.darkness.domain.CustomUserDetails;
import com.darkness.domain.RSSLink;
import com.darkness.domain.User;
import com.darkness.util.StringHelper;

@Service
public class RSSLinkServiceImpl implements RSSLinkService {
	@Autowired
	RSSLinkDAO rssLinkDAO;

	@Override
	public List<RSSLink> findAll() {
		return rssLinkDAO.findAll();
	}

	@Override
	public RSSLink findOne(String name) {
		return rssLinkDAO.findOne(name);
	}

	@Override
	public RSSLink findOne(int id) {
		return rssLinkDAO.findOne(id);
	}

	@Override
	public void create(RSSLink rssLink) {
		rssLink.setUpdatedAt(new Date());
		rssLink.setCreatedAt(new Date());
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User currentUser = ((CustomUserDetails) principal).getUser();
        rssLink.setUser(currentUser);
        
        rssLink.setName(StringHelper.convertFromUTF8(rssLink.getName()));
        
		rssLinkDAO.create(rssLink);
	}

	@Override
	public void update(RSSLink rssLink) {
		rssLink.setUpdatedAt(new Date());
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User currentUser = ((CustomUserDetails) principal).getUser();
        rssLink.setUser(currentUser);
        
        rssLink.setName(StringHelper.convertFromUTF8(rssLink.getName()));
		
		rssLinkDAO.update(rssLink);
	}

	@Override
	public void delete(RSSLink rssLink) {
		rssLinkDAO.delete(rssLink);
	}

	@Override
	public int count() {
		return rssLinkDAO.count();
	}

}
