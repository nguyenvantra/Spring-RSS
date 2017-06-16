package com.darkness.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.darkness.domain.RSSLink;
import com.darkness.service.RSSLinkService;

@Component
public class RSSLinkValidator implements Validator {
	@Autowired
	RSSLinkService rssLinkService;

	@Override
	public boolean supports(Class<?> cls) {
		return RSSLink.class.isAssignableFrom(cls);
	}

	@Override
	public void validate(Object o, Errors errors) {
		RSSLink rssLink = (RSSLink) o;
		
		// Unique category
		RSSLink dbRSSLink = rssLinkService.findOne(rssLink.getName());
        if (dbRSSLink != null && dbRSSLink.getId() != rssLink.getId()) {
            errors.rejectValue("name", "Unique.rsslink.name");
        }
	}
	
}
