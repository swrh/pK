package com.dasho2.pk.dao.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.dasho2.pk.dao.entity.Customer;
import com.dasho2.pk.dao.util.HibernateUtil;

public class CustomerDaoServiceHibernate implements CustomerDaoServiceInterface {
	@Override
	public List<Customer> getAll() {
		Session session = new HibernateUtil().getSession();

		Query query = session.createQuery("SELECT customer FROM Customer as customer");
		@SuppressWarnings("unchecked")
		List<Customer> list = query.list();

		session.close();
		
		return list;
	}

	@Override
	public Customer getById(Integer id) {
		Session session = new HibernateUtil().getSession();
		return (Customer)session.get(Customer.class, id);
	}

	@Override
	public void update(Customer customer) {
		Session session = new HibernateUtil().getSession();

		session.beginTransaction();
		session.update(customer);
		session.getTransaction().commit();
		
		session.close();
    }

    public void insert(Customer customer) {
		Session session = new HibernateUtil().getSession();
		
		session.beginTransaction();
		session.save(customer);
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
