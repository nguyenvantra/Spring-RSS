package com.darkness.util;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.jsoup.Jsoup;

import com.darkness.domain.Article;
import com.sun.syndication.feed.synd.SyndEntry;
import com.sun.syndication.feed.synd.SyndFeed;
import com.sun.syndication.io.FeedException;
import com.sun.syndication.io.SyndFeedInput;
import com.sun.syndication.io.XmlReader;

public class ReadRSS {
	private static ReadRSS instance = null;

	private ReadRSS() {

	}

	public static ReadRSS Instance() {
		if(instance==null){
			instance = new ReadRSS();
		}
		return instance;
	}
	
	public List<Article> getData (String linkRSS, int id) throws IllegalArgumentException, FeedException, IOException{
		List<Article> articles = new ArrayList<>();
		
		URL url = new URL(linkRSS);
		HttpURLConnection httpcon = (HttpURLConnection)url.openConnection();
		// Reading the feed
		SyndFeedInput input = new SyndFeedInput();
		SyndFeed feed = input.build(new XmlReader(httpcon));
		List entries = feed.getEntries();
		Iterator itEntries = entries.iterator();
		
		while (itEntries.hasNext()) {
			SyndEntry entry = (SyndEntry) itEntries.next();
			
			Article article = new Article();
			article.setTitle(entry.getTitle());
			article.setLinkArticle(entry.getLink());
			article.setDescription(Jsoup.parse(entry.getDescription().getValue()).text());
			article.setLinkImage(Jsoup.parse(entry.getDescription().getValue()).select("img").attr("src"));
			article.setIdDummy(id);
			
			articles.add(article);
		}
		
		return articles;
	}
}
