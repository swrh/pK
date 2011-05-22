package com.dasho2.pk.action;

import java.util.List;

import com.dasho2.pk.dao.entity.Representative;
import com.dasho2.pk.dao.service.RepresentativeDaoServiceHibernate;
import com.dasho2.pk.dao.service.RepresentativeDaoServiceInterface;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

@SuppressWarnings("serial")
public class RepresentativeAction extends ActionSupport implements Preparable {
	private List<Representative> representatives;
	private Representative representative;
	private static RepresentativeDaoServiceInterface service = new RepresentativeDaoServiceHibernate();

	public void prepare() throws Exception {
		if (representative != null && representative.getId() != null) {
			representative = service.getById(representative.getId());
		}
	}

	public String save() {
		if (representative.getId() == null) {
			representative.updateCreationDate();
			representative.updateModificationDate();
			service.insert(representative);
		} else {
			representative.updateModificationDate();
			service.update(representative);
		}
		return SUCCESS;
	}

	public String delete() {
		service.delete(representative.getId());
		return SUCCESS;
	}

	public String list() {
		representatives = service.getAll();
		return SUCCESS;
	}

	public String input() {
		return INPUT;
	}

	public Representative getRepresentative() {
		return representative;
	}

	public void setRepresentative(Representative representative) {
		this.representative = representative;
	}

	public List<Representative> getRepresentatives() {
		return representatives;
	}

}
