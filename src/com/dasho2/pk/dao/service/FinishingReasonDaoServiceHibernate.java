package com.dasho2.pk.dao.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.dasho2.pk.dao.entity.FinishingReason;
import com.dasho2.pk.dao.util.HibernateUtil;

public class FinishingReasonDaoServiceHibernate implements FinishingReasonDaoServiceInterface {
	@Override
	public List<FinishingReason> getAll() {
		Session session = new HibernateUtil().getSession();

		Query query = session.createQuery("SELECT finishingReason FROM FinishingReason as finishingReason");
		@SuppressWarnings("unchecked")
		List<FinishingReason> list = query.list();

		session.close();
		
		return list;
	}

	@Override
	public FinishingReason getById(Integer id) {
		Session session = new HibernateUtil().getSession();
		return (FinishingReason)session.get(FinishingReason.class, id);
	}

	@Override
	public void update(FinishingReason finishingReason) {
		Session session = new HibernateUtil().getSession();

		session.beginTransaction();
		session.update(finishingReason);
		session.getTransaction().commit();
		
		session.close();
    }

    public void insert(FinishingReason finishingReason) {
		Session session = new HibernateUtil().getSession();
		
		session.beginTransaction();
		session.save(finishingReason);
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
