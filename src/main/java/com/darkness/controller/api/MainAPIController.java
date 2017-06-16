package com.darkness.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.darkness.domain.Article;
import com.darkness.service.APIArticleService;

@RestController
public class MainAPIController {
	@Autowired
	APIArticleService apiArticleService;

	@GetMapping("/api/v1/article")
	public ResponseEntity<List<Article>> findAll() {
		List<Article> articles = apiArticleService.findAll();
		if (articles.isEmpty()) {
			return new ResponseEntity<List<Article>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Article>>(articles, HttpStatus.OK);
	}
	
	@GetMapping("/api/v1/article/{first}/{max}")
	public ResponseEntity<List<Article>> findLimit(@PathVariable int first,@PathVariable int max) {
		List<Article> articles = apiArticleService.findByLimit(first, max);
		if (articles.isEmpty()) {
			return new ResponseEntity<List<Article>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Article>>(articles, HttpStatus.OK);
	}
	
	@GetMapping("/api/v1/article/{id}")
	public ResponseEntity<List<Article>> findByCategory(@PathVariable int id) {
		List<Article> articles = apiArticleService.findByCategory(id);
		if (articles.isEmpty()) {
			return new ResponseEntity<List<Article>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Article>>(articles, HttpStatus.OK);
	}
}
