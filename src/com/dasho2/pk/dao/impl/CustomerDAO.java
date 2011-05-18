package com.dasho2.pk.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.dasho2.pk.dao.Customer;
import com.dasho2.pk.dao.util.HibernateUtil;

public class CustomerDAO {

	public boolean create(Customer c) {
		try {
			Session session = new HibernateUtil().getSession();
			
			session.beginTransaction();
			session.save(c);
			session.getTransaction().commit();
			
			session.close();
			
			return true;
		} catch (Exception e) {
			System.err.println(e.getMessage());
			e.printStackTrace(System.err);
		}
		
		return false;
	}
	
	public Customer read(int id) {
		Session session = new HibernateUtil().getSession();
		return (Customer)session.get(Customer.class, id);
	}
	
	public boolean update(Customer c) {
		try {
			Session session = new HibernateUtil().getSession();

			session.beginTransaction();
			session.update(c);
			session.getTransaction().commit();
			
			session.close();
			
			return true;
		} catch (Exception e) {
			System.err.println(e.getMessage());
			e.printStackTrace(System.err);
		}
		
		return false;
	}
	
	public boolean delete(Customer c) {
		try {
			Session session = new HibernateUtil().getSession();
			
			session.beginTransaction();
			session.delete(c);
			session.getTransaction().commit();
			
			session.close();
			
			return true;
		} catch (Exception e) {
			System.err.println(e.getMessage());
			e.printStackTrace(System.err);
		}
		
		return false;
	}

	public List<Customer> getList() {
		Session session = new HibernateUtil().getSession();

		Query query = session.createQuery("SELECT c FROM Customer as c");
		@SuppressWarnings("unchecked")
		List<Customer> list = query.list();

		session.close();
		
		return list;
	}
	
}
