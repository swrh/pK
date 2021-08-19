package com.dasho2.pk.action;

import java.util.List;

import com.dasho2.pk.dao.entity.ProposalStatus;
import com.dasho2.pk.dao.service.ProposalStatusDaoServiceHibernate;
import com.dasho2.pk.dao.service.ProposalStatusDaoServiceInterface;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

@SuppressWarnings("serial")
public class ProposalStatusAction extends ActionSupport implements Preparable {
	private List<ProposalStatus> proposalStatuss;
	private ProposalStatus proposalStatus;
	private static ProposalStatusDaoServiceInterface service = new ProposalStatusDaoServiceHibernate();

	public void prepare() throws Exception {
		if (proposalStatus != null && proposalStatus.getId() != null) {
			proposalStatus = service.getById(proposalStatus.getId());
		}
	}

	public String save() {
		if (proposalStatus.getId() == null) {
			proposalStatus.updateCreationDate();
			proposalStatus.updateModificationDate();
			service.insert(proposalStatus);
		} else {
			proposalStatus.updateModificationDate();
			service.update(proposalStatus);
		}
		return SUCCESS;
	}

	public String delete() {
		service.delete(proposalStatus.getId());
		return SUCCESS;
	}

	public String list() {
		proposalStatuss = service.getAll();
		return SUCCESS;
	}

	public String input() {
		return INPUT;
	}

	public ProposalStatus getProposalStatus() {
		return proposalStatus;
	}

	public void setProposalStatus(ProposalStatus proposalStatus) {
		this.proposalStatus = proposalStatus;
	}

	public List<ProposalStatus> getProposalStatuss() {
		return proposalStatuss;
	}

}
