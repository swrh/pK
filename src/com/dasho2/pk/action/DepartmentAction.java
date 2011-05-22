package com.dasho2.pk.action;

import java.util.List;

import com.dasho2.pk.dao.entity.Department;
import com.dasho2.pk.dao.service.DepartmentDaoServiceHibernate;
import com.dasho2.pk.dao.service.DepartmentDaoServiceInterface;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

@SuppressWarnings("serial")
public class DepartmentAction extends ActionSupport implements Preparable {
	private List<Department> departments;
	private Department department;
	private static DepartmentDaoServiceInterface service = new DepartmentDaoServiceHibernate();

	public void prepare() throws Exception {
		if (department != null && department.getId() != null) {
			department = service.getById(department.getId());
		}
	}

	public String save() {
		if (department.getId() == null) {
			department.updateCreationDate();
			department.updateModificationDate();
			service.insert(department);
		} else {
			department.updateModificationDate();
			service.update(department);
		}
		return SUCCESS;
	}

	public String delete() {
		service.delete(department.getId());
		return SUCCESS;
	}

	public String list() {
		departments = service.getAll();
		return SUCCESS;
	}

	public String input() {
		return INPUT;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public List<Department> getDepartments() {
		return departments;
	}

}
