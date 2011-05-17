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
public class ProductEditAction extends ActionSupport {
	private Product product;

	@Action(value = "product-edit", results = {
		@Result(name = SUCCESS, location = "product-edit.jsp"),
		@Result(name = INPUT, type = "redirect", location = "product-list"),
		@Result(name = ERROR, location = "error.jsp")
	})
	public String execute() {
		HttpServletRequest request = (HttpServletRequest)ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

		int id;
		try {
			String s = request.getParameter("product.id");
			id = Integer.parseInt(s);
		} catch (NumberFormatException e) {
			System.err.println(e.getMessage());
			e.printStackTrace(System.err);
			return ERROR;
		}

		ProductDAO dao = new ProductDAO();
		setProduct(dao.read(id));
		if (getProduct() == null)
			return ERROR;

		return SUCCESS;
	}

	private void setProduct(Product product) {
		this.product = product;
	}

	public Product getProduct() {
		return product;
	}

}
