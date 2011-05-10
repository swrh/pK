package com.dasho2.pk.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.dasho2.pk.dao.Usuario;
import com.dasho2.pk.dao.util.HibernateUtil;


public class UsuarioDAO {
	
	public boolean existeUsuario(Usuario usuario){
		
		boolean bResult = false;
		
		Session session = new HibernateUtil().getSession();
		
		Query query = session.createQuery("SELECT u FROM Usuario as u WHERE u.login = :userName AND u.senha = :userPassword");
		query.setParameter("userName", usuario.getLogin());
		query.setParameter("userPassword", usuario.getSenha());
		
		List<Usuario> lResults = query.list();
		
		if (lResults.size() > 0)
			bResult = true;
		
		return bResult;
	}

}
