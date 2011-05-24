package com.dasho2.pk.action;

import java.util.List;

import com.dasho2.pk.dao.entity.FinishingReason;
import com.dasho2.pk.dao.service.FinishingReasonDaoServiceHibernate;
import com.dasho2.pk.dao.service.FinishingReasonDaoServiceInterface;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

@SuppressWarnings("serial")
public class FinishingReasonAction extends ActionSupport implements Preparable {
	private List<FinishingReason> finishingReasons;
	private FinishingReason finishingReason;
	private static FinishingReasonDaoServiceInterface service = new FinishingReasonDaoServiceHibernate();

	public void prepare() throws Exception {
		if (finishingReason != null && finishingReason.getId() != null) {
			finishingReason = service.getById(finishingReason.getId());
		}
	}

	public String save() {
		if (finishingReason.getId() == null) {
			finishingReason.updateCreationDate();
			finishingReason.updateModificationDate();
			service.insert(finishingReason);
		} else {
			finishingReason.updateModificationDate();
			service.update(finishingReason);
		}
		return SUCCESS;
	}

	public String delete() {
		service.delete(finishingReason.getId());
		return SUCCESS;
	}

	public String list() {
		finishingReasons = service.getAll();
		return SUCCESS;
	}

	public String input() {
		return INPUT;
	}

	public FinishingReason getFinishingReason() {
		return finishingReason;
	}

	public void setFinishingReason(FinishingReason finishingReason) {
		this.finishingReason = finishingReason;
	}

	public List<FinishingReason> getFinishingReasons() {
		return finishingReasons;
	}

}
