package com.dasho2.pk.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;


import com.dasho2.pk.dao.Product;
import com.dasho2.pk.dao.impl.ProductDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class ProductSearchAction extends ActionSupport{
	
	private Product product;
	
	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@Action(value="productSearch", results={
			@Result(name="OK", location="productedit.jsp"),
			@Result(name="ERROR", location="error.jsp"),
			@Result(name="input", location="listproduct.jsp")
	})
	
	public String execute(){
		
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		
		product = new ProductDAO().searchProductById(request.getParameter("product.id"));
		
		return (product != null ? "OK" : "ERROR");
		
	}
	
}
