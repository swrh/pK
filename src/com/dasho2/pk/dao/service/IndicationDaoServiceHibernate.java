package com.dasho2.pk.dao.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.dasho2.pk.dao.entity.Indication;
import com.dasho2.pk.dao.util.HibernateUtil;

public class IndicationDaoServiceHibernate implements IndicationDaoServiceInterface {
	@Override
	public List<Indication> getAll() {
		Session session = new HibernateUtil().getSession();

		Query query = session.createQuery("SELECT i FROM Indication as i");
		@SuppressWarnings("unchecked")
		List<Indication> list = query.list();

		session.close();
		
		return list;
	}

	@Override
	public Indication getById(Integer id) {
		Session session = new HibernateUtil().getSession();
		return (Indication)session.get(Indication.class, id);
	}

	@Override
	public void update(Indication indication) {
		Session session = new HibernateUtil().getSession();

		session.beginTransaction();
		session.update(indication);
		session.getTransaction().commit();
		
		session.close();
    }

    public void insert(Indication indication) {
		Session session = new HibernateUtil().getSession();
		
		session.beginTransaction();
		session.save(indication);
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
