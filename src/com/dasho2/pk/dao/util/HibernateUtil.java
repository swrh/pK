package com.dasho2.pk.dao.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

import com.dasho2.pk.dao.Customer;
import com.dasho2.pk.dao.Product;
import com.dasho2.pk.dao.Representante;
import com.dasho2.pk.dao.User;

public class HibernateUtil {
	
	private static SessionFactory factory;
	
	static {
		AnnotationConfiguration cfg = new AnnotationConfiguration();
		cfg.addAnnotatedClass(User.class);
		cfg.addAnnotatedClass(Representante.class);
		cfg.addAnnotatedClass(Product.class);
		cfg.addAnnotatedClass(Customer.class);
		factory = cfg.buildSessionFactory();
	}
	
	public Session getSession(){
		return factory.openSession();
	}

}
