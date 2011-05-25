package com.dasho2.pk.action;

import java.util.List;

import com.dasho2.pk.dao.entity.Customer;
import com.dasho2.pk.dao.entity.Employee;
import com.dasho2.pk.dao.entity.FinishingReason;
import com.dasho2.pk.dao.entity.Indication;
import com.dasho2.pk.dao.entity.Operation;
import com.dasho2.pk.dao.entity.ProposalStatus;
import com.dasho2.pk.dao.entity.Prospecting;
import com.dasho2.pk.dao.service.CustomerDaoServiceHibernate;
import com.dasho2.pk.dao.service.CustomerDaoServiceInterface;
import com.dasho2.pk.dao.service.EmployeeDaoServiceHibernate;
import com.dasho2.pk.dao.service.EmployeeDaoServiceInterface;
import com.dasho2.pk.dao.service.FinishingReasonDaoServiceHibernate;
import com.dasho2.pk.dao.service.FinishingReasonDaoServiceInterface;
import com.dasho2.pk.dao.service.IndicationDaoServiceHibernate;
import com.dasho2.pk.dao.service.IndicationDaoServiceInterface;
import com.dasho2.pk.dao.service.OperationDaoServiceHibernate;
import com.dasho2.pk.dao.service.OperationDaoServiceInterface;
import com.dasho2.pk.dao.service.ProposalStatusDaoServiceHibernate;
import com.dasho2.pk.dao.service.ProposalStatusDaoServiceInterface;
import com.dasho2.pk.dao.service.ProspectingDaoServiceHibernate;
import com.dasho2.pk.dao.service.ProspectingDaoServiceInterface;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

@SuppressWarnings("serial")
public class ProspectingAction extends ActionSupport implements Preparable {
	private static FinishingReasonDaoServiceInterface finishingReasonDaoService = new FinishingReasonDaoServiceHibernate();
	private List<FinishingReason> finishingReasons;

	private static EmployeeDaoServiceInterface employeeDaoService = new EmployeeDaoServiceHibernate();
	private List<Employee> employees;

	private static OperationDaoServiceInterface operationDaoService = new OperationDaoServiceHibernate();
	private List<Operation> operations;

	private static IndicationDaoServiceInterface indicationDaoService = new IndicationDaoServiceHibernate();
	private List<Indication> indications;

	private static ProposalStatusDaoServiceInterface proposalStatusDaoService = new ProposalStatusDaoServiceHibernate();
	private List<ProposalStatus> proposalStatuss;

	private static CustomerDaoServiceInterface customerDaoService = new CustomerDaoServiceHibernate();
	private List<Customer> customers;

	private static ProspectingDaoServiceInterface service = new ProspectingDaoServiceHibernate();
	private List<Prospecting> prospectings;

	private Prospecting prospecting;

	public void prepare() throws Exception {
		finishingReasons = finishingReasonDaoService.getAll();
		employees = employeeDaoService.getAll();
		operations = operationDaoService.getAll();
		indications = indicationDaoService.getAll();
		proposalStatuss = proposalStatusDaoService.getAll();
		customers = customerDaoService.getAll();
		if (prospecting != null && prospecting.getId() != null) {
			prospecting = service.getById(prospecting.getId());
		}
	}

	public String save() {
		if (prospecting.getId() == null) {
			prospecting.updateCreationDate();
			prospecting.updateModificationDate();
			service.insert(prospecting);
		} else {
			prospecting.updateModificationDate();
			service.update(prospecting);
		}
		return SUCCESS;
	}

	public String delete() {
		service.delete(prospecting.getId());
		return SUCCESS;
	}

	public String list() {
		prospectings = service.getAll();
		return SUCCESS;
	}

	public String input() {
		return INPUT;
	}

	public List<FinishingReason> getFinishingReasons() {
		return finishingReasons;
	}

	public List<Employee> getEmployees() {
		return employees;
	}

	public List<Operation> getOperations() {
		return operations;
	}

	public List<Indication> getIndications() {
		return indications;
	}

	public List<ProposalStatus> getProposalStatuss() {
		return proposalStatuss;
	}

	public List<Customer> getCustomers() {
		return customers;
	}

	public List<Prospecting> getProspectings() {
		return prospectings;
	}

	public Prospecting getProspecting() {
		return prospecting;
	}

	public void setProspecting(Prospecting prospecting) {
		this.prospecting = prospecting;
	}

}
