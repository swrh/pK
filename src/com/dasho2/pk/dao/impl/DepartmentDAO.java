package com.dasho2.pk.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.dasho2.pk.dao.Department;
import com.dasho2.pk.dao.util.HibernateUtil;

public class DepartmentDAO {

	public boolean create(Department c) {
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
	
	public Department read(int id) {
		Session session = new HibernateUtil().getSession();
		return (Department)session.get(Department.class, id);
	}
	
	public boolean update(Department c) {
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
	
	public boolean delete(Department c) {
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

	public List<Department> getList() {
		Session session = new HibernateUtil().getSession();

		Query query = session.createQuery("SELECT c FROM Department as c");
		@SuppressWarnings("unchecked")
		List<Department> list = query.list();

		session.close();
		
		return list;
	}
	
}
