package com.dasho2.pk.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.dasho2.pk.dao.Customer;
import com.dasho2.pk.dao.impl.CustomerDAO;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.Validations;

@SuppressWarnings("serial")
public class CustomerCreateAction extends ActionSupport{
	private Customer customer;

	@Action(value = "customer-create", results = {
		@Result(name = SUCCESS, type = "redirect", location = "customer-list"),
		@Result(name = INPUT, location = "customer-new.jsp"),
		@Result(name = ERROR, location = "error.jsp")
	})
	@Validations(requiredStrings = {
		@RequiredStringValidator(fieldName = "customer.name", message = "Preencha o nome.", trim = true),
		@RequiredStringValidator(fieldName = "customer.reason", message = "Preencha a razão social.", trim = true),
		@RequiredStringValidator(fieldName = "customer.cnpj", message = "Preencha o CNPJ.", trim = true),
		@RequiredStringValidator(fieldName = "customer.ie", message = "Preencha a inscrição estadual.", trim = true),
		@RequiredStringValidator(fieldName = "customer.email", message = "Preencha o e-mail.", trim = true),
		@RequiredStringValidator(fieldName = "customer.phone", message = "Preencha o telefone.", trim = true),
		@RequiredStringValidator(fieldName = "customer.mobile", message = "Preencha o celular.", trim = true),
		@RequiredStringValidator(fieldName = "customer.fax", message = "Preencha o FAX.", trim = true),
		@RequiredStringValidator(fieldName = "customer.address", message = "Preencha a rua.", trim = true),
		@RequiredStringValidator(fieldName = "customer.neighborhood", message = "Preencha o bairro.", trim = true),
		@RequiredStringValidator(fieldName = "customer.city", message = "Preencha a cidade.", trim = true),
		@RequiredStringValidator(fieldName = "customer.state", message = "Preencha o estado.", trim = true),
		@RequiredStringValidator(fieldName = "customer.country", message = "Preencha o país.", trim = true),
		@RequiredStringValidator(fieldName = "customer.zipCode", message = "Preencha o CEP.", trim = true)
	})
	public String execute(){
		CustomerDAO dao = new CustomerDAO();

		getCustomer().updateCreationDate();
		getCustomer().updateModificationDate();
		if (!dao.create(getCustomer()))
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
