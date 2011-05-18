package com.dasho2.pk.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.dasho2.pk.dao.Department;
import com.dasho2.pk.dao.impl.DepartmentDAO;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class DepartmentEditAction extends ActionSupport {
	private Department department;

	@Action(value = "department-edit", results = {
		@Result(name = SUCCESS, location = "department-edit.jsp"),
		@Result(name = INPUT, type = "redirect", location = "department-list"),
		@Result(name = ERROR, location = "error.jsp")
	})
	public String execute() {
		HttpServletRequest request = (HttpServletRequest)ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

		int id;
		try {
			String s = request.getParameter("department.id");
			id = Integer.parseInt(s);
		} catch (NumberFormatException e) {
			System.err.println(e.getMessage());
			e.printStackTrace(System.err);
			return ERROR;
		}

		DepartmentDAO dao = new DepartmentDAO();
		setDepartment(dao.read(id));
		if (getDepartment() == null)
			return ERROR;

		return SUCCESS;
	}

	private void setDepartment(Department department) {
		this.department = department;
	}

	public Department getDepartment() {
		return department;
	}

}
