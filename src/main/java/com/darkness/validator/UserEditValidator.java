package com.darkness.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.darkness.domain.User;
import com.darkness.service.UserService;

@Component
public class UserEditValidator implements Validator {

	@Autowired
	private UserService userService;
	
    @Override
    public boolean supports(Class<?> cls) {
        return User.class.isAssignableFrom(cls);
    }

    @Override
    public void validate(Object o, Errors errors) {
    	User user = (User) o;
    	
        // Unique email
        User dbUser = userService.findOne(user.getEmail());
        if (dbUser != null && dbUser.getId() != user.getId()) {
            errors.rejectValue("email", "Unique.user.email");
        }
    }

}
