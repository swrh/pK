package br.com.pk.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import br.com.pk.dao.Representante;
import br.com.pk.dao.util.HibernateUtil;

public class RepresentanteDAO {
	
	public boolean save(Representante rep){
		
		Boolean bResult = false;
		
		try{
			
			Session session = new HibernateUtil().getSession();
			
			session.beginTransaction();
			session.save(rep);
			session.getTransaction().commit();
			
			session.close();
			
			bResult = true;
			
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		
		return bResult;
	}
	
	public List<Representante> getLista(){
		
		Session session = new HibernateUtil().getSession();
		
		Query query = session.createQuery("SELECT r FROM Representante as r");
		
		List<Representante> lResults = query.list();
		
		session.close();
		
		return lResults;
		
	}
	
	public Representante searchRepresentanteById(String sId){
		
		Session session = new HibernateUtil().getSession();
		Representante representante = (Representante) session.get(Representante.class, Integer.parseInt(sId));
		
		return representante;
		
	}
	
	public boolean update(Representante rep){
		
		Boolean bResult = false;
		
		try{
			
			Session session = new HibernateUtil().getSession();
			
			session.beginTransaction();
			session.update(rep);
			session.getTransaction().commit();
			
			session.close();
			
			bResult = true;
			
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		
		return bResult;
	}
	
	public boolean delete(Representante rep){
		
		Boolean bResult = false;
		
		try{
			
			Session session = new HibernateUtil().getSession();
			
			session.beginTransaction();
			session.delete(rep);
			session.getTransaction().commit();
			
			session.close();
			
			bResult = true;
			
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		
		return bResult;
	}

}
