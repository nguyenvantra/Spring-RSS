package com.darkness.tiles;

import java.util.List;

import org.apache.tiles.Attribute;
import org.apache.tiles.AttributeContext;
import org.apache.tiles.preparer.PreparerException;
import org.apache.tiles.preparer.ViewPreparer;
import org.apache.tiles.request.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.darkness.domain.Category;
import com.darkness.service.CategoryService;

@Component
public class AppViewPreparer implements ViewPreparer {
	@Autowired
	CategoryService categoryService;

	@Override
	public void execute(Request tilesRequest, AttributeContext attributeContext) 
			throws PreparerException {
		
		List<Category> list = categoryService.findAll();
		System.out.println(list.size()+" SIZE");
		
		attributeContext.putAttribute("categories",
				new Attribute(categoryService.findAll()),true);
	}

}
