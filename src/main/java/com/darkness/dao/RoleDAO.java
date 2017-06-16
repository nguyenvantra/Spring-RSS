package com.darkness.dao;

import com.darkness.domain.Role;

public interface RoleDAO {
	Role findOne(String name);
}
