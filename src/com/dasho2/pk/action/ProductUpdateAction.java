package com.dasho2.pk.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.dasho2.pk.dao.Product;
import com.dasho2.pk.dao.impl.ProductDAO;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.Validations;

@SuppressWarnings("serial")
public class ProductUpdateAction extends ActionSupport {
	private Product product;

	@Action(value = "product-update", results = {
		@Result(name = SUCCESS, type = "redirect", location = "product-list"),
		@Result(name = INPUT, location = "product-edit.jsp"),
		@Result(name = ERROR, location = "error.jsp")
	})
	@Validations(requiredStrings = {
		@RequiredStringValidator(fieldName = "product.name", message = "Preencha o nome.", trim = true),
	})
	public String execute() {
		ProductDAO dao = new ProductDAO();

		getProduct().updateModificationDate();
		if (!dao.update(getProduct()))
			return ERROR;

		return SUCCESS;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Product getProduct() {
		return product;
	}

}
