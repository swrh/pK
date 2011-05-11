package com.dasho2.pk.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;


import com.dasho2.pk.dao.Product;
import com.dasho2.pk.dao.impl.ProductDAO;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.Validations;

@SuppressWarnings("serial")
public class ProductSaveAction extends ActionSupport{
	
	private Product product;
	
	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@Action(value="productSave", results={
			@Result(name="OK", type="redirectAction", params={"actionName", "products"}),
			@Result(name="ERROR", location="error.jsp"),
			@Result(name="input", location="product.jsp")
	})
	
	@Validations(requiredStrings={
			@RequiredStringValidator(fieldName="product.name", message="Preencha o nome.", trim=true),
			@RequiredStringValidator(fieldName="product.code", message="Preencha o código.", trim=true)
	})

	public String execute(){
		
		return (new ProductDAO().save(product) ? "OK" : "ERROR");
		
	}

}
