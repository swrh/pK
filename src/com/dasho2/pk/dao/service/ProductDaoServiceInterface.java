package com.dasho2.pk.dao.service;

import java.util.List;

import com.dasho2.pk.dao.entity.Product;

public interface ProductDaoServiceInterface {
    public List<Product> getAll();
    public Product getById(Integer id);
    public void insert(Product product);
    public void update(Product product);
    public void delete(Integer id);

}
