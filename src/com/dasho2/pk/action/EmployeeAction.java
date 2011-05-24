package com.dasho2.pk.action;

import java.util.List;

import com.dasho2.pk.dao.entity.Department;
import com.dasho2.pk.dao.entity.Employee;
import com.dasho2.pk.dao.entity.Representative;
import com.dasho2.pk.dao.service.DepartmentDaoServiceHibernate;
import com.dasho2.pk.dao.service.DepartmentDaoServiceInterface;
import com.dasho2.pk.dao.service.EmployeeDaoServiceHibernate;
import com.dasho2.pk.dao.service.EmployeeDaoServiceInterface;
import com.dasho2.pk.dao.service.RepresentativeDaoServiceHibernate;
import com.dasho2.pk.dao.service.RepresentativeDaoServiceInterface;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

@SuppressWarnings("serial")
public class EmployeeAction extends ActionSupport implements Preparable {
	private List<Employee> employees;
	private List<Department> departments;
	private List<Representative> representatives;
	private Employee employee;
	private String changePassword, confirmChangePassword;
	private static EmployeeDaoServiceInterface service = new EmployeeDaoServiceHibernate();
	private static DepartmentDaoServiceInterface departmentService = new DepartmentDaoServiceHibernate();
	private static RepresentativeDaoServiceInterface representativeService = new RepresentativeDaoServiceHibernate();

	public void prepare() throws Exception {
		departments = departmentService.getAll();
		representatives = representativeService.getAll();
		if (employee != null && employee.getId() != null) {
			employee = service.getById(employee.getId());
		}
	}

	public String save() {
		if (employee.getId() == null) {
			employee.updateCreationDate();
			employee.updateModificationDate();
			service.insert(employee);
		} else {
			employee.updateModificationDate();
			service.update(employee);
		}
		return SUCCESS;
	}

	public String delete() {
		service.delete(employee.getId());
		return SUCCESS;
	}

	public String list() {
		employees = service.getAll();
		return SUCCESS;
	}

	public String input() {
		return INPUT;
	}

	public String password() {
		return INPUT;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public String getChangePassword() {
		return changePassword;
	}

	public void setChangePassword(String changePassword) {
		this.changePassword = changePassword;
	}

	public String getConfirmChangePassword() {
		return confirmChangePassword;
	}

	public void setConfirmChangePassword(String confirmChangePassword) {
		this.confirmChangePassword = confirmChangePassword;
	}

	public List<Employee> getEmployees() {
		return employees;
	}

	public List<Department> getDepartments() {
		return departments;
	}

	public List<Representative> getRepresentatives() {
		return representatives;
	}

}
