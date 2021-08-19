package com.dasho2.pk.dao.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.dasho2.pk.dao.entity.ProposalStatus;
import com.dasho2.pk.dao.util.HibernateUtil;

public class ProposalStatusDaoServiceHibernate implements ProposalStatusDaoServiceInterface {
	@Override
	public List<ProposalStatus> getAll() {
		Session session = new HibernateUtil().getSession();

		Query query = session.createQuery("SELECT proposalStatus FROM ProposalStatus as proposalStatus");
		@SuppressWarnings("unchecked")
		List<ProposalStatus> list = query.list();

		session.close();
		
		return list;
	}

	@Override
	public ProposalStatus getById(Integer id) {
		Session session = new HibernateUtil().getSession();
		return (ProposalStatus)session.get(ProposalStatus.class, id);
	}

	@Override
	public void update(ProposalStatus proposalStatus) {
		Session session = new HibernateUtil().getSession();

		session.beginTransaction();
		session.update(proposalStatus);
		session.getTransaction().commit();
		
		session.close();
    }

    public void insert(ProposalStatus proposalStatus) {
		Session session = new HibernateUtil().getSession();
		
		session.beginTransaction();
		session.save(proposalStatus);
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
