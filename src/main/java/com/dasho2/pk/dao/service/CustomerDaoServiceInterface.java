package com.dasho2.pk.dao.service;

import java.util.List;

import com.dasho2.pk.dao.entity.Customer;

public interface CustomerDaoServiceInterface {
    public List<Customer> getAll();
    public Customer getById(Integer id);
    public void insert(Customer customer);
    public void update(Customer customer);
    public void delete(Integer id);

}
