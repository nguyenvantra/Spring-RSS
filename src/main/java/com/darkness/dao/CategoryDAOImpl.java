package com.darkness.dao;

import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.darkness.domain.Category;

@Repository
@Transactional
public class CategoryDAOImpl implements CategoryDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public int count() {
		Session session = sessionFactory.getCurrentSession();
    	
    	String hql = "select count(*) " 
    				+ "from "
            	    + Category.class.getSimpleName();
    	
        return ((Number) session
        		.createQuery(hql)
        		.getSingleResult())
        		.intValue();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Category> findAll() {
		Session session = sessionFactory.getCurrentSession();

		String hql = "select distinct c " 
					+ "from " 
					+ Category.class.getSimpleName() 
					+ " c " + "left join fetch c.user";

		return session.createQuery(hql).getResultList();
	}

	@Override
	public Category findOne(String name) {
		Session session = sessionFactory.getCurrentSession();

		String hql = "from " 
					+ Category.class.getSimpleName() 
					+ " where name = :name";

		try {
			return (Category) session.createQuery(hql)
					.setParameter("name", name).getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

	@Override
	public void create(Category category) {
		Session session = sessionFactory.getCurrentSession();
        session.persist(category);
	}

	@Override
	public Category findOne(int id) {
		Session session = sessionFactory.getCurrentSession();
        return session.get(Category.class, id);
	}

	@Override
	public void delete(Category category) {
		Session session = sessionFactory.getCurrentSession();
        session.delete(category);
	}

	@Override
	public void update(Category category) {
		Session session = sessionFactory.getCurrentSession();
        session.update(category);
	}

}
