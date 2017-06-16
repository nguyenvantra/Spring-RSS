package com.darkness.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.darkness.domain.Article;

@Repository
@Transactional
public class APIArticleDAOImpl implements APIArticleDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<Article> findAll() {
		Session session = sessionFactory.getCurrentSession();

		String hql = "select distinct a " + "from " + Article.class.getSimpleName() + " a " + " order by a.id desc";
		return session.createQuery(hql).getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Article> findByLimit(int first, int max) {
		Session session = sessionFactory.getCurrentSession();

		String hql = "select distinct a " + "from " + Article.class.getSimpleName() + " a " + " order by a.id desc";
		return session.createQuery(hql).setFirstResult(first - 1).setMaxResults(max).getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Article> findByCategory(int id) {
		Session session = sessionFactory.getCurrentSession();

		String hql = "select distinct a " + "from " 
				+ Article.class.getSimpleName() 
				+ " a "
				+ " left join fetch a.rssLink" 
				+ "	where a.rssLink.category.id = :id"
				+ "	order by a.id desc";
		;
		
		return session.createQuery(hql)
				.setParameter("id", id)
				.getResultList();
	}

}
