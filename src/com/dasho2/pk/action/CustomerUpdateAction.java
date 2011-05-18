package com.dasho2.pk.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.dasho2.pk.dao.Customer;
import com.dasho2.pk.dao.impl.CustomerDAO;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.Validations;

@SuppressWarnings("serial")
public class CustomerUpdateAction extends ActionSupport {
	private Customer customer;

	@Action(value = "customer-update", results = {
		@Result(name = SUCCESS, type = "redirect", location = "customer-list"),
		@Result(name = INPUT, location = "customer-edit.jsp"),
		@Result(name = ERROR, location = "error.jsp")
	})
//	@Validations(requiredStrings = {
//		@RequiredStringValidator(fieldName = "customer.name", message = "Preencha o nome.", trim = true),
//		@RequiredStringValidator(fieldName = "customer.code", message = "Preencha o código.", trim = true)
//	})
	public String execute() {
		CustomerDAO dao = new CustomerDAO();

		if (!dao.update(getCustomer()))
			return ERROR;

		return SUCCESS;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Customer getCustomer() {
		return customer;
	}

}
