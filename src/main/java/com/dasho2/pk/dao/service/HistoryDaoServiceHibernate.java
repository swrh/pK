package com.dasho2.pk.dao.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.dasho2.pk.dao.entity.History;
import com.dasho2.pk.dao.util.HibernateUtil;

public class HistoryDaoServiceHibernate implements HistoryDaoServiceInterface {
	@Override
	public List<History> getAll() {
		Session session = new HibernateUtil().getSession();

		Query query = session.createQuery("SELECT history FROM History as history");
		@SuppressWarnings("unchecked")
		List<History> list = query.list();

		session.close();

		return list;
	}

	@Override
	public History getById(Integer id) {
		Session session = new HibernateUtil().getSession();
		return (History)session.get(History.class, id);
	}

	@Override
	public void update(History history) {
		Session session = new HibernateUtil().getSession();

		session.beginTransaction();
		session.update(history);
		session.getTransaction().commit();

		session.close();
	}

	public void insert(History history) {
		Session session = new HibernateUtil().getSession();

		session.beginTransaction();
		session.save(history);
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
