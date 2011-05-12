package com.dasho2.pk.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.dasho2.pk.dao.Product;
import com.dasho2.pk.dao.util.HibernateUtil;

public class ProductDAO {

	public boolean create(Product p) {
		try {
			Session session = new HibernateUtil().getSession();
			
			session.beginTransaction();
			session.save(p);
			session.getTransaction().commit();
			
			session.close();
			
			return true;
		} catch (Exception e) {
			System.err.println(e.getMessage());
			e.printStackTrace(System.err);
		}
		
		return false;
	}
	
	public Product read(int id) {
		Session session = new HibernateUtil().getSession();
		return (Product)session.get(Product.class, id);
	}
	
	public boolean update(Product p) {
		try {
			Session session = new HibernateUtil().getSession();

			session.beginTransaction();
			session.update(p);
			session.getTransaction().commit();
			
			session.close();
			
			return true;
		} catch (Exception e) {
			System.err.println(e.getMessage());
			e.printStackTrace(System.err);
		}
		
		return false;
	}
	
	public boolean delete(Product p) {
		try {
			Session session = new HibernateUtil().getSession();
			
			session.beginTransaction();
			session.delete(p);
			session.getTransaction().commit();
			
			session.close();
			
			return true;
		} catch (Exception e) {
			System.err.println(e.getMessage());
			e.printStackTrace(System.err);
		}
		
		return false;
	}

	public List<Product> getList() {
		Session session = new HibernateUtil().getSession();

		Query query = session.createQuery("SELECT p FROM Product as p");
		@SuppressWarnings("unchecked")
		List<Product> list = query.list();

		session.close();
		
		return list;
	}
	
}
