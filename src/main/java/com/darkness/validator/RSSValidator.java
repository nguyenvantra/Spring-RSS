package com.darkness.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.darkness.domain.RSS;
import com.darkness.service.RSSService;

@Component
public class RSSValidator implements Validator {
	@Autowired
	RSSService rssService;

	@Override
	public boolean supports(Class<?> cls) {
		return RSS.class.isAssignableFrom(cls);
	}

	@Override
	public void validate(Object o, Errors errors) {
		RSS rss = (RSS) o;
		
		// Unique category
        RSS dbRSS = rssService.findOne(rss.getName());
        if (dbRSS != null && dbRSS.getId() != dbRSS.getId()) {
            errors.rejectValue("name", "Unique.rss.name");
        }
	}

}
