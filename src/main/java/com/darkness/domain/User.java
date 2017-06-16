package com.darkness.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

import com.darkness.util.Constant;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "User")
public class User implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@NotEmpty
	@Length(min = 3)
	@Column(name = "name")
	private String name;

	@NotEmpty
	@Email
	@Column(name = "email")
	private String email;

	@Column(name = "password")
	private String password;

	@Transient
	private String confirmPassword;

	@Column(name = "avatar", nullable = true)
	private String avatar = Constant.DEFAULT_AVATAR;

	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "dd/MM/yyyy hh:mm:ss")
	@Column(name = "created_at")
	private Date createdAt;

	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "dd/MM/yyyy hh:mm:ss")
	@Column(name = "updated_at")
	private Date updatedAt;

	@ManyToMany(fetch = FetchType.LAZY)
	@JsonIgnore
	@JoinTable(name = "UserRole", joinColumns = { @JoinColumn(name = "user_id") }, inverseJoinColumns = {
			@JoinColumn(name = "role_id") })
	private Set<Role> roles = new HashSet<>();
	
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	private Set<Category> category = new HashSet<>();
	
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	private Set<RSS> rsses = new HashSet<>();

	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	private Set<RSSLink> rssLinks = new HashSet<>();

	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	private Set<Article> article = new HashSet<>();

	public User() {
		roles.add(new Role(Constant.ROLE_MEMBER));
	}

	public boolean isAdmin() {
		for (Role role : roles) {
			if (role.getName().equals(Constant.ROLE_ADMIN)) {
				return true;
			}
		}
		return false;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
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

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	public Set<Category> getCategory() {
		return category;
	}

	public void setCategory(Set<Category> category) {
		this.category = category;
	}

	public Set<RSSLink> getRssLinks() {
		return rssLinks;
	}

	public void setRssLinks(Set<RSSLink> rssLinks) {
		this.rssLinks = rssLinks;
	}

	public Set<Article> getArticle() {
		return article;
	}

	public void setArticle(Set<Article> article) {
		this.article = article;
	}

	public Set<RSS> getRsses() {
		return rsses;
	}

	public void setRsses(Set<RSS> rsses) {
		this.rsses = rsses;
	}

}
