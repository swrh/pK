package com.dasho2.pk.dao.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.dasho2.pk.dao.entity.Employee;
import com.dasho2.pk.dao.util.HibernateUtil;

public class EmployeeDaoServiceHibernate implements EmployeeDaoServiceInterface {
	@Override
	public List<Employee> getAll() {
		Session session = new HibernateUtil().getSession();

		Query query = session.createQuery("SELECT employee FROM Employee as employee");
		@SuppressWarnings("unchecked")
		List<Employee> list = query.list();

		session.close();
		
		return list;
	}

	@Override
	public Employee getById(Integer id) {
		Session session = new HibernateUtil().getSession();
		return (Employee)session.get(Employee.class, id);
	}

	@Override
	public void update(Employee employee) {
		Session session = new HibernateUtil().getSession();

		session.beginTransaction();
		session.update(employee);
		session.getTransaction().commit();
		
		session.close();
    }

    public void insert(Employee employee) {
		Session session = new HibernateUtil().getSession();
		
		session.beginTransaction();
		session.save(employee);
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
