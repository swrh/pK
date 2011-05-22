package com.dasho2.pk.action;

import java.util.List;

import com.dasho2.pk.dao.entity.Customer;
import com.dasho2.pk.dao.service.CustomerDaoServiceHibernate;
import com.dasho2.pk.dao.service.CustomerDaoServiceInterface;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

@SuppressWarnings("serial")
public class CustomerAction extends ActionSupport implements Preparable {
	private List<Customer> customers;
	private Customer customer;
	private static CustomerDaoServiceInterface service = new CustomerDaoServiceHibernate();

	public void prepare() throws Exception {
		if (customer != null && customer.getId() != null) {
			customer = service.getById(customer.getId());
		}
	}

	public String save() {
		if (customer.getId() == null) {
			customer.updateCreationDate();
			customer.updateModificationDate();
			service.insert(customer);
		} else {
			customer.updateModificationDate();
			service.update(customer);
		}
		return SUCCESS;
	}

	public String delete() {
		service.delete(customer.getId());
		return SUCCESS;
	}

	public String list() {
		customers = service.getAll();
		return SUCCESS;
	}

	public String input() {
		return INPUT;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public List<Customer> getCustomers() {
		return customers;
	}

}
