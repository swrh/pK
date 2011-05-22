package com.dasho2.pk.dao.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.dasho2.pk.dao.entity.Product;
import com.dasho2.pk.dao.util.HibernateUtil;

public class ProductDaoServiceHibernate implements ProductDaoServiceInterface {
	@Override
	public List<Product> getAll() {
		Session session = new HibernateUtil().getSession();

		Query query = session.createQuery("SELECT product FROM Product as product");
		@SuppressWarnings("unchecked")
		List<Product> list = query.list();

		session.close();
		
		return list;
	}

	@Override
	public Product getById(Integer id) {
		Session session = new HibernateUtil().getSession();
		return (Product)session.get(Product.class, id);
	}

	@Override
	public void update(Product product) {
		Session session = new HibernateUtil().getSession();

		session.beginTransaction();
		session.update(product);
		session.getTransaction().commit();
		
		session.close();
    }

    public void insert(Product product) {
		Session session = new HibernateUtil().getSession();
		
		session.beginTransaction();
		session.save(product);
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
