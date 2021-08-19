package com.dasho2.pk.dao.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.dasho2.pk.dao.entity.Report;
import com.dasho2.pk.dao.util.HibernateUtil;

public class ReportDaoServiceHibernate implements ReportDaoServiceInterface {
	@Override
	public List<Report> getAll() {
		Session session = new HibernateUtil().getSession();

		Query query = session.createQuery("SELECT report FROM Report as report");
		@SuppressWarnings("unchecked")
		List<Report> list = query.list();

		session.close();
		
		return list;
	}

	@Override
	public Report getById(Integer id) {
		Session session = new HibernateUtil().getSession();
		return (Report)session.get(Report.class, id);
	}

	@Override
	public void update(Report report) {
		Session session = new HibernateUtil().getSession();

		session.beginTransaction();
		session.update(report);
		session.getTransaction().commit();
		
		session.close();
    }

    public void insert(Report report) {
		Session session = new HibernateUtil().getSession();
		
		session.beginTransaction();
		session.save(report);
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
