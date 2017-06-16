package com.darkness.domain;

import java.io.Serializable;
import java.text.ParseException;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

import com.darkness.util.StringHelper;
import com.darkness.util.TimeUtil;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "Article")
public class Article implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@NotEmpty
	@Column(name = "title")
	private String title;

	@NotEmpty
	@Column(name = "unsigned_title")
	private String unsignedTitle;
	
	@JsonBackReference
	@Transient
	private int idDummy;

	@NotEmpty
	@Column(name = "description")
	private String description;

	@NotEmpty
	@Column(name = "link_article")
	private String linkArticle;

	@NotEmpty
	@Column(name = "img")
	private String linkImage;

	@Column(name = "hot_post")
	private boolean hotPost = false;

	@Column(name = "show_home")
	private boolean showHome = false;

	@Column(name = "views")
	private int views = 0;

	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "dd/MM/yyyy hh:mm:ss")
	@Column(name = "created_at")
	private Date createdAt;

	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "dd/MM/yyyy hh:mm:ss")
	@Column(name = "updated_at")
	private Date updatedAt;
	
	@JsonBackReference
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_user")
	private User user;
	
	@JsonIgnore
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_rsslink")
	private RSSLink rssLink;

	public Article(int id, String title, String unsignedTitle, String description, String linkArticle, String linkImage,
			boolean hotPost, boolean showHome, int views, Date createdAt, Date updatedAt) {
		super();
		this.id = id;
		this.title = title;
		this.unsignedTitle = unsignedTitle;
		this.description = description;
		this.linkArticle = linkArticle;
		this.linkImage = linkImage;
		this.hotPost = hotPost;
		this.showHome = showHome;
		this.views = views;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}

	public Article() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUnsignedTitle() {
		return unsignedTitle;
	}

	public void setUnsignedTitle(String unsignedTitle) {
		this.unsignedTitle = unsignedTitle;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLinkArticle() {
		return linkArticle;
	}

	public void setLinkArticle(String linkArticle) {
		this.linkArticle = linkArticle;
	}

	public String getLinkImage() {
		return linkImage;
	}

	public void setLinkImage(String linkImage) {
		this.linkImage = linkImage;
	}

	public boolean isHotPost() {
		return hotPost;
	}

	public void setHotPost(boolean hotPost) {
		this.hotPost = hotPost;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public RSSLink getRssLink() {
		return rssLink;
	}

	public void setRssLink(RSSLink rssLink) {
		this.rssLink = rssLink;
	}

	public int getIdDummy() {
		return idDummy;
	}
	
	public void setIdDummy(int idDummy) {
		this.idDummy = idDummy;
	}

	public boolean isShowHome() {
		return showHome;
	}

	public void setShowHome(boolean showHome) {
		this.showHome = showHome;
	}

	public String getAgo() throws ParseException {
		return TimeUtil.ago(createdAt);
	}

	public String getSubDes() {
		return StringHelper.getSubDes(description);
	}

}
