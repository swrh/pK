package com.dasho2.pk.action;

import com.dasho2.pk.dao.entity.Employee;
import com.dasho2.pk.dao.service.EmployeeDaoServiceHibernate;
import com.dasho2.pk.dao.service.EmployeeDaoServiceInterface;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

@SuppressWarnings("serial")
public class EmployeePasswordAction extends ActionSupport implements Preparable {
	private Employee employee;
	private String newPassword, confirmPassword;
	private static EmployeeDaoServiceInterface service = new EmployeeDaoServiceHibernate();

	public void prepare() throws Exception {
		if (employee != null && employee.getId() != null) {
			employee = service.getById(employee.getId());
		}
	}

	public String save() {
		if (employee.getId() == null)
			return ERROR;

		employee.updateModificationDate();
		employee.setPassword(newPassword);
		service.update(employee);

		return SUCCESS;
	}

	public String input() {
		return INPUT;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

}
