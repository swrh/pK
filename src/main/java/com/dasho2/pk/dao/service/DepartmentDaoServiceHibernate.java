package com.dasho2.pk.dao.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.dasho2.pk.dao.entity.Department;
import com.dasho2.pk.dao.util.HibernateUtil;

public class DepartmentDaoServiceHibernate implements DepartmentDaoServiceInterface {
	@Override
	public List<Department> getAll() {
		Session session = new HibernateUtil().getSession();

		Query query = session.createQuery("SELECT department FROM Department as department");
		@SuppressWarnings("unchecked")
		List<Department> list = query.list();

		session.close();
		
		return list;
	}

	@Override
	public Department getById(Integer id) {
		Session session = new HibernateUtil().getSession();
		return (Department)session.get(Department.class, id);
	}

	@Override
	public void update(Department department) {
		Session session = new HibernateUtil().getSession();

		session.beginTransaction();
		session.update(department);
		session.getTransaction().commit();
		
		session.close();
    }

    public void insert(Department department) {
		Session session = new HibernateUtil().getSession();
		
		session.beginTransaction();
		session.save(department);
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
