package br.com.pk.dao.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

import br.com.pk.dao.Usuario;
import br.com.pk.dao.Representante;

public class HibernateUtil {
	
	private static SessionFactory factory;
	
	static {
		AnnotationConfiguration cfg = new AnnotationConfiguration();
		cfg.addAnnotatedClass(Usuario.class);
		cfg.addAnnotatedClass(Representante.class);
		factory = cfg.buildSessionFactory();
	}
	
	public Session getSession(){
		return factory.openSession();
	}

}
