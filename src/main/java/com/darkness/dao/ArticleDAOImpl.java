package com.darkness.dao;

import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.darkness.domain.Article;

@Repository
@Transactional
public class ArticleDAOImpl implements ArticleDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<Article> findAll() {
		Session session = sessionFactory.getCurrentSession();

		String hql = "select distinct a " + "from " 
				+ Article.class.getSimpleName() 
				+ " a " 
				+ "left join fetch a.user"
				+ " left join fetch a.rssLink";
		;

		return session.createQuery(hql).getResultList();
	}

	@Override
	public Article findOne(String title) {
		Session session = sessionFactory.getCurrentSession();

		String hql = "from " + Article.class.getSimpleName() + " where title = :title";

		try {
			return (Article) session.createQuery(hql).setParameter("title", title).getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

	@Override
	public Article findOne(int id) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(Article.class, id);
	}

	@Override
	public void create(Article article) {
		Session session = sessionFactory.getCurrentSession();
		session.persist(article);
	}

	@Override
	public void update(Article article) {
		Session session = sessionFactory.getCurrentSession();
		session.update(article);
	}

	@Override
	public void delete(Article article) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(article);
	}

	@Override
	public int count() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select count(*) " + "from " + Article.class.getSimpleName();
		return ((Number) session.createQuery(hql).getSingleResult()).intValue();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Article> findArticleHome(int first, int max) {
		Session session = sessionFactory.getCurrentSession();

		String hql = "select distinct a " 
				+ "from " + Article.class.getSimpleName() 
				+ " a " 
				+ "left join fetch a.user"
				+ " left join fetch a.rssLink " 
				+ "order by a.showHome desc";
		;

		return session.createQuery(hql).setFirstResult(first - 1).setMaxResults(max).getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Article> findArticleHot(int first, int max) {
		Session session = sessionFactory.getCurrentSession();

		String hql = "select distinct a " + "from " 
				+ Article.class.getSimpleName() 
				+ " a " + "left join fetch a.user"
				+ " left join fetch a.rssLink"
				+ " where a.hotPost = 1"
				+ " order by a.id desc";
		;

		return session.createQuery(hql)
				.setFirstResult(first - 1)
				.setMaxResults(max)
				.getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Article> findArticleByCategory(int id, int first, int max) {
		Session session = sessionFactory.getCurrentSession();

		String hql = "select distinct a " + "from " 
				+ Article.class.getSimpleName() 
				+ " a" 
				+ " left join fetch a.user"
				+ " left join fetch a.rssLink" 
				+ "	where a.rssLink.category.id = :id"
				+ "	order by a.id desc";
		;
		
		return session.createQuery(hql)
				.setFirstResult(first - 1)
				.setMaxResults(max)
				.setParameter("id", id)
				.getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Article> findArticleByCategory(int id) {
		Session session = sessionFactory.getCurrentSession();

		String hql = "select distinct a " + "from " 
				+ Article.class.getSimpleName() 
				+ " a " + "left join fetch a.user"
				+ " left join fetch a.rssLink" 
				+ "	where a.rssLink.category.id = :id"
				+ "	order by a.id desc";
		;
		
		return session.createQuery(hql)
				.setParameter("id", id)
				.getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Article> findArticleByHotCategory(int id, int first, int max) {
		Session session = sessionFactory.getCurrentSession();

		String hql = "select distinct a " + "from " 
				+ Article.class.getSimpleName() 
				+ " a " + "left join fetch a.user"
				+ " left join fetch a.rssLink" 
				+ "	where a.rssLink.category.id = :id"
				+ " and a.hotPost = 1"
				+ "	order by a.id desc";
		;
		
		return session.createQuery(hql)
				.setFirstResult(first - 1)
				.setMaxResults(max)
				.setParameter("id", id)
				.getResultList();
	}

}
