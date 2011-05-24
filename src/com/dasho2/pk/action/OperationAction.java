package com.dasho2.pk.action;

import java.util.List;

import com.dasho2.pk.dao.entity.Operation;
import com.dasho2.pk.dao.service.OperationDaoServiceHibernate;
import com.dasho2.pk.dao.service.OperationDaoServiceInterface;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

@SuppressWarnings("serial")
public class OperationAction extends ActionSupport implements Preparable {
	private List<Operation> operations;
	private Operation operation;
	private static OperationDaoServiceInterface service = new OperationDaoServiceHibernate();

	public void prepare() throws Exception {
		if (operation != null && operation.getId() != null) {
			operation = service.getById(operation.getId());
		}
	}

	public String save() {
		if (operation.getId() == null) {
			operation.updateCreationDate();
			operation.updateModificationDate();
			service.insert(operation);
		} else {
			operation.updateModificationDate();
			service.update(operation);
		}
		return SUCCESS;
	}

	public String delete() {
		service.delete(operation.getId());
		return SUCCESS;
	}

	public String list() {
		operations = service.getAll();
		return SUCCESS;
	}

	public String input() {
		return INPUT;
	}

	public Operation getOperation() {
		return operation;
	}

	public void setOperation(Operation operation) {
		this.operation = operation;
	}

	public List<Operation> getOperations() {
		return operations;
	}

}
