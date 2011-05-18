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
public class CustomerEditAction extends ActionSupport {
	private Customer customer;

	@Action(value = "customer-edit", results = {
		@Result(name = SUCCESS, location = "customer-edit.jsp"),
		@Result(name = INPUT, type = "redirect", location = "customer-list"),
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
		setCustomer(dao.read(id));
		if (getCustomer() == null)
			return ERROR;

		return SUCCESS;
	}

	private void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Customer getCustomer() {
		return customer;
	}

}
