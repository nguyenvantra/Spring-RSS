package com.darkness.dao;

import java.util.List;

import javax.persistence.NoResultException;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.darkness.domain.RSSLink;

@Repository
@Transactional
public class RSSLinkDAOImpl implements RSSLinkDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<RSSLink> findAll() {
		Session session = sessionFactory.getCurrentSession();

		String hql = "select distinct r " 
				+ "from " + RSSLink.class.getSimpleName() + " r "
				+ "left join fetch r.user" 
				+ " left join fetch r.category";

		return session.createQuery(hql).getResultList();
	}

	@Override
	public RSSLink findOne(String name) {
		Session session = sessionFactory.getCurrentSession();

		String hql = "from " 
					+ RSSLink.class.getSimpleName() 
					+ " where name = :name";

		try {
			return (RSSLink) session.createQuery(hql)
					.setParameter("name", name)
					.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

	@Override
	public RSSLink findOne(int id) {
		Session session = sessionFactory.getCurrentSession();
        return session.get(RSSLink.class, id);
	}

	@Override
	public void create(RSSLink rssLink) {
		Session session = sessionFactory.getCurrentSession();
        session.persist(rssLink);
	}

	@Override
	public void update(RSSLink rssLink) {
		Session session = sessionFactory.getCurrentSession();
        session.update(rssLink);
	}

	@Override
	public void delete(RSSLink rssLink) {
		Session session = sessionFactory.getCurrentSession();
        session.delete(rssLink);
	}

	@Override
	public int count() {
		Session session = sessionFactory.getCurrentSession();
    	
    	String hql = "select count(*) " 
    				+ "from "
            	    + RSSLink.class.getSimpleName();
    	
        return ((Number) session
        		.createQuery(hql)
        		.getSingleResult())
        		.intValue();
	}

}
