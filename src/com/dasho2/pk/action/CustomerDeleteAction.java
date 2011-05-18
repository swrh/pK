package com.dasho2.pk.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.dasho2.pk.dao.Customer;
import com.dasho2.pk.dao.impl.CustomerDAO;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class CustomerDeleteAction extends ActionSupport {

	@Action(value = "customer-delete", results = {
		@Result(name = SUCCESS, type = "redirect", location = "customer-list"),
		@Result(name = INPUT, type = "redirect", location = "customer-edit"),
		@Result(name = ERROR, location = "error.jsp")
	})
	public String execute() {
		HttpServletRequest request = (HttpServletRequest)ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

		int id;
		try {
			String s = request.getParameter("customer.id");
			id = Integer.parseInt(s);
		} catch (NumberFormatException e) {
			System.err.println(e.getMessage());
			e.printStackTrace(System.err);
			return ERROR;
		}

		CustomerDAO dao = new CustomerDAO();
		Customer p = dao.read(id);
		if (p == null || !dao.delete(p))
			return ERROR;

		return SUCCESS;
	}

}
