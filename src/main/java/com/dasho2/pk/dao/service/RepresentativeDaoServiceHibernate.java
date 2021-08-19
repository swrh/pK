package com.dasho2.pk.dao.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.dasho2.pk.dao.entity.Representative;
import com.dasho2.pk.dao.util.HibernateUtil;

public class RepresentativeDaoServiceHibernate implements RepresentativeDaoServiceInterface {
	@Override
	public List<Representative> getAll() {
		Session session = new HibernateUtil().getSession();

		Query query = session.createQuery("SELECT representative FROM Representative as representative");
		@SuppressWarnings("unchecked")
		List<Representative> list = query.list();

		session.close();
		
		return list;
	}

	@Override
	public Representative getById(Integer id) {
		Session session = new HibernateUtil().getSession();
		return (Representative)session.get(Representative.class, id);
	}

	@Override
	public void update(Representative representative) {
		Session session = new HibernateUtil().getSession();

		session.beginTransaction();
		session.update(representative);
		session.getTransaction().commit();
		
		session.close();
    }

    public void insert(Representative representative) {
		Session session = new HibernateUtil().getSession();
		
		session.beginTransaction();
		session.save(representative);
		session.getTransaction().commit();
		
		session.close();
    }

    public void delete(Integer id) {
		Session session = new HibernateUtil().getSession();
		
		session.beginTransaction();
		session.delete(getById(id));
		session.getTransaction().commit();
		
		session.close();
    }

}
