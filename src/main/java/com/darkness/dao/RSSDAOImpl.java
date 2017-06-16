package com.darkness.dao;

import java.util.List;

import javax.persistence.NoResultException;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.darkness.domain.RSS;

@Repository
@Transactional
public class RSSDAOImpl implements RSSDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<RSS> findAll() {
		Session session = sessionFactory.getCurrentSession();

		String hql = "select distinct r " 
					+ "from " 
					+ RSS.class.getSimpleName()
					+" r";

		return session.createQuery(hql).getResultList();
	}

	@Override
	public RSS findOne(String name) {
		Session session = sessionFactory.getCurrentSession();

		String hql = "from " 
					+ RSS.class.getSimpleName() 
					+ " where name = :name";

		try {
			return (RSS) session.createQuery(hql)
					.setParameter("name", name)
					.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

	@Override
	public RSS findOne(int id) {
		Session session = sessionFactory.getCurrentSession();
        return session.get(RSS.class, id);
	}

	@Override
	public void create(RSS rss) {
		Session session = sessionFactory.getCurrentSession();
        session.persist(rss);
	}

	@Override
	public void update(RSS rss) {
		Session session = sessionFactory.getCurrentSession();
        session.update(rss);
	}

	@Override
	public void delete(RSS rss) {
		Session session = sessionFactory.getCurrentSession();
        session.delete(rss);
	}

	@Override
	public int count() {
		Session session = sessionFactory.getCurrentSession();
    	
    	String hql = "select count(*) " 
    				+ "from "
            	    + RSS.class.getSimpleName();
    	
        return ((Number) session
        		.createQuery(hql)
        		.getSingleResult())
        		.intValue();
	}

}