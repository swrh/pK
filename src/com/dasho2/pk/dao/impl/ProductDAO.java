package com.dasho2.pk.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.dasho2.pk.dao.Product;
import com.dasho2.pk.dao.util.HibernateUtil;

public class ProductDAO {
	
	public boolean save(Product p) {
		
		Boolean bResult = false;
		
		try {
			
			Session session = new HibernateUtil().getSession();
			
			session.beginTransaction();
			session.save(p);
			session.getTransaction().commit();
			
			session.close();
			
			bResult = true;
			
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		
		return bResult;
	}
	
	public List<Product> getList() {
		
		Session session = new HibernateUtil().getSession();
		
		Query query = session.createQuery("SELECT p FROM Product as p");
		
		List<Product> lResults = query.list();
		
		session.close();
		
		return lResults;
		
	}
	
	public Product searchProductById(String sId) {
		
		Session session = new HibernateUtil().getSession();
		Product p = (Product) session.get(Product.class, Integer.parseInt(sId));
		
		return p;
		
	}
	
	public boolean update(Product p) {
		
		Boolean bResult = false;
		
		try{
			
			Session session = new HibernateUtil().getSession();
			
			session.beginTransaction();
			session.update(p);
			session.getTransaction().commit();
			
			session.close();
			
			bResult = true;
			
		} catch (Exception ex) {
			System.err.println(ex.getMessage());
		}
		
		return bResult;
	}
	
	public boolean delete(Product p) {
		
		Boolean bResult = false;
		
		try {
			
			Session session = new HibernateUtil().getSession();
			
			session.beginTransaction();
			session.delete(p);
			session.getTransaction().commit();
			
			session.close();
			
			bResult = true;
			
		} catch (Exception ex) {
			System.err.println(ex.getMessage());
		}
		
		return bResult;
	}

}
