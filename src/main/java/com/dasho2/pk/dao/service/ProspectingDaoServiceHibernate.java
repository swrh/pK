package com.dasho2.pk.dao.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.dasho2.pk.dao.entity.Prospecting;
import com.dasho2.pk.dao.util.HibernateUtil;

public class ProspectingDaoServiceHibernate implements ProspectingDaoServiceInterface {
	@Override
	public List<Prospecting> getAll() {
		Session session = new HibernateUtil().getSession();

		Query query = session.createQuery("SELECT prospecting FROM Prospecting as prospecting");
		@SuppressWarnings("unchecked")
		List<Prospecting> list = query.list();

		session.close();
		
		return list;
	}

	@Override
	public Prospecting getById(Integer id) {
		Session session = new HibernateUtil().getSession();
		return (Prospecting)session.get(Prospecting.class, id);
	}

	@Override
	public void update(Prospecting prospecting) {
		Session session = new HibernateUtil().getSession();

		session.beginTransaction();
		session.merge(prospecting);
		session.getTransaction().commit();
		
		session.close();
    }

    public void insert(Prospecting prospecting) {
		Session session = new HibernateUtil().getSession();
		
		session.beginTransaction();
		session.save(prospecting);
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
