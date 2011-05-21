package com.dasho2.pk.action;

import java.util.List;

import com.dasho2.pk.dao.entity.Indication;
import com.dasho2.pk.dao.service.IndicationDaoServiceHibernate;
import com.dasho2.pk.dao.service.IndicationDaoServiceInterface;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

@SuppressWarnings("serial")
public class IndicationAction extends ActionSupport implements Preparable {
	private List<Indication> indications;
	private Indication indication;
	private static IndicationDaoServiceInterface service = new IndicationDaoServiceHibernate();

	public void prepare() throws Exception {
		if (indication != null && indication.getId() != null) {
			indication = service.getById(indication.getId());
		}
	}

	public String save() {
		if (indication.getId() == null) {
			service.insert(indication);
		} else {
			service.update(indication);
		}
		return SUCCESS;
	}

	public String delete() {
		service.delete(indication.getId());
		return SUCCESS;
	}

	public String list() {
		indications = service.getAll();
		return SUCCESS;
	}

	public String input() {
		return INPUT;
	}

	public Indication getIndication() {
		return indication;
	}

	public void setIndication(Indication indication) {
		this.indication = indication;
	}

	public List<Indication> getIndications() {
		return indications;
	}

}
