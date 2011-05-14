package com.dasho2.pk.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.dasho2.pk.dao.User;
import com.dasho2.pk.dao.util.HibernateUtil;

public class UserDAO {

	public boolean matchUser(User user) {
		Session session = new HibernateUtil().getSession();
		
		Query query = session.createQuery("SELECT u FROM User as u WHERE u.login = :login AND u.password = :password");
		query.setParameter("login", user.getLogin());
		query.setParameter("password", user.getPassword());

		@SuppressWarnings("unchecked")
		List<User> list = query.list();
		
		if (list.size() <= 0)
			return false;

		return true;
	}

}
