package com.dasho2.pk.dao.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.dasho2.pk.dao.entity.Operation;
import com.dasho2.pk.dao.util.HibernateUtil;

public class OperationDaoServiceHibernate implements OperationDaoServiceInterface {
	@Override
	public List<Operation> getAll() {
		Session session = new HibernateUtil().getSession();

		Query query = session.createQuery("SELECT operation FROM Operation as operation");
		@SuppressWarnings("unchecked")
		List<Operation> list = query.list();

		session.close();
		
		return list;
	}

	@Override
	public Operation getById(Integer id) {
		Session session = new HibernateUtil().getSession();
		return (Operation)session.get(Operation.class, id);
	}

	@Override
	public void update(Operation operation) {
		Session session = new HibernateUtil().getSession();

		session.beginTransaction();
		session.update(operation);
		session.getTransaction().commit();
		
		session.close();
    }

    public void insert(Operation operation) {
		Session session = new HibernateUtil().getSession();
		
		session.beginTransaction();
		session.save(operation);
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
