package com.dasho2.pk.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.dasho2.pk.dao.Department;
import com.dasho2.pk.dao.impl.DepartmentDAO;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.Validations;

@SuppressWarnings("serial")
public class DepartmentCreateAction extends ActionSupport{
	private Department department;

	@Action(value = "department-create", results = {
		@Result(name = SUCCESS, type = "redirect", location = "department-list"),
		@Result(name = INPUT, location = "department-new.jsp"),
		@Result(name = ERROR, location = "error.jsp")
	})
	@Validations(requiredStrings = {
		@RequiredStringValidator(fieldName = "department.name", message = "Preencha o nome.", trim = true)
	})
	public String execute(){
		DepartmentDAO dao = new DepartmentDAO();

		getDepartment().updateCreationDate();
		getDepartment().updateModificationDate();
		if (!dao.create(getDepartment()))
			return ERROR;

		return SUCCESS;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public Department getDepartment() {
		return department;
	}

}
