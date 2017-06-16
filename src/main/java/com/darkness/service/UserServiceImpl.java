package com.darkness.service;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.darkness.dao.RoleDAO;
import com.darkness.dao.UserDAO;
import com.darkness.domain.Role;
import com.darkness.domain.User;
import com.darkness.util.Constant;
import com.darkness.util.StringHelper;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO userDAO;
	
	@Autowired 
    private RoleDAO roleDAO;
    
    @Autowired
    private PasswordEncoder passwordEncoder;

	@Override
	public List<User> findAll() {
		return userDAO.findAll();
	}

	@Override
	public int count() {
		return userDAO.count();
	}

	@Override
	public void create(User user, String role) {
		user.setName(StringHelper.convertFromUTF8(user.getName()));
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		user.setCreatedAt(new Date());
		user.setUpdatedAt(new Date());

		Set<Role> roles = new HashSet<>();
		switch (role) {
		case "admin":
			roles.add(roleDAO.findOne(Constant.ROLE_ADMIN));
			roles.add(roleDAO.findOne(Constant.ROLE_MEMBER));
			break;
		case "member":
			roles.add(roleDAO.findOne(Constant.ROLE_MEMBER));
			break;
		}
		user.setRoles(roles);

		userDAO.create(user);
	}

	@Override
	public User findOne(String email) {
		return userDAO.findOne(email);
	}

	@Override
	public User findOne(int id) {
		return userDAO.findOne(id);
	}

	@Override
	public void delete(User user) {
		userDAO.delete(user);
	}

	@Override
	public void update(User user, String role) {
		user.setName(StringHelper.convertFromUTF8(user.getName()));
		user.setUpdatedAt(new Date());
		
		Set<Role> roles = new HashSet<>();
    	switch (role) {
    		case "admin":
    			roles.add(roleDAO.findOne("ROLE_ADMIN"));
    			roles.add(roleDAO.findOne("ROLE_MEMBER"));
    			break;
    		case "member":
    			roles.add(roleDAO.findOne("ROLE_MEMBER"));
    			break;
    	}
    	user.setRoles(roles);
    	
        userDAO.update(user);
	}

}
