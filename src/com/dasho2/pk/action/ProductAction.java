package com.dasho2.pk.action;

import java.util.List;

import com.dasho2.pk.dao.entity.Product;
import com.dasho2.pk.dao.service.ProductDaoServiceHibernate;
import com.dasho2.pk.dao.service.ProductDaoServiceInterface;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

@SuppressWarnings("serial")
public class ProductAction extends ActionSupport implements Preparable {
	private List<Product> products;
	private Product product;
	private static ProductDaoServiceInterface service = new ProductDaoServiceHibernate();

	public void prepare() throws Exception {
		if (product != null && product.getId() != null) {
			product = service.getById(product.getId());
		}
	}

	public String save() {
		if (product.getId() == null) {
			product.updateCreationDate();
			product.updateModificationDate();
			service.insert(product);
		} else {
			product.updateModificationDate();
			service.update(product);
		}
		return SUCCESS;
	}

	public String delete() {
		service.delete(product.getId());
		return SUCCESS;
	}

	public String list() {
		products = service.getAll();
		return SUCCESS;
	}

	public String input() {
		return INPUT;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public List<Product> getProducts() {
		return products;
	}

}
