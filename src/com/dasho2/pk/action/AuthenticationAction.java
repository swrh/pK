package com.dasho2.pk.action;

import com.dasho2.pk.dao.entity.Employee;
import com.dasho2.pk.dao.service.EmployeeDaoServiceHibernate;
import com.dasho2.pk.dao.service.EmployeeDaoServiceInterface;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class AuthenticationAction extends ActionSupport {
	private Employee employee;

	@Override
	public String input() throws Exception {
		return INPUT;
	}

	public String login() {
		EmployeeDaoServiceInterface dao = new EmployeeDaoServiceHibernate();

		setEmployee(dao.authenticate(getEmployee()));
		if (getEmployee() == null) {
			addFieldError("employee.invalid", "Usuário/senha inválidos.");
			return ERROR;
		}

		ActionContext.getContext().getSession().put("employee", getEmployee());
		return SUCCESS;
	}

	public String logout() {
		setEmployee(null);
		ActionContext.getContext().getSession().remove("employee");
		return SUCCESS;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public Employee getEmployee() {
		return employee;
	}

}
