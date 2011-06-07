package com.dasho2.pk.dao.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

import com.dasho2.pk.dao.entity.Customer;
import com.dasho2.pk.dao.entity.Department;
import com.dasho2.pk.dao.entity.Employee;
import com.dasho2.pk.dao.entity.FinishingReason;
import com.dasho2.pk.dao.entity.History;
import com.dasho2.pk.dao.entity.Indication;
import com.dasho2.pk.dao.entity.Operation;
import com.dasho2.pk.dao.entity.Product;
import com.dasho2.pk.dao.entity.ProposalStatus;
import com.dasho2.pk.dao.entity.Prospecting;
import com.dasho2.pk.dao.entity.Representative;

public class HibernateUtil {
	
	private static SessionFactory factory;
	
	static {
		AnnotationConfiguration cfg = new AnnotationConfiguration();
		cfg.addAnnotatedClass(Customer.class);
		cfg.addAnnotatedClass(Department.class);
		cfg.addAnnotatedClass(Employee.class);
		cfg.addAnnotatedClass(FinishingReason.class);
		cfg.addAnnotatedClass(History.class);
		cfg.addAnnotatedClass(Indication.class);
		cfg.addAnnotatedClass(Operation.class);
		cfg.addAnnotatedClass(Product.class);
		cfg.addAnnotatedClass(ProposalStatus.class);
		cfg.addAnnotatedClass(Prospecting.class);
		cfg.addAnnotatedClass(Representative.class);
		factory = cfg.buildSessionFactory();
	}
	
	public Session getSession(){
		return factory.openSession();
	}

}
