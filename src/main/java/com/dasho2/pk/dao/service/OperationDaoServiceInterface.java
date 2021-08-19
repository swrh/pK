package com.dasho2.pk.dao.service;

import java.util.List;

import com.dasho2.pk.dao.entity.Operation;

public interface OperationDaoServiceInterface {
    public List<Operation> getAll();
    public Operation getById(Integer id);
    public void insert(Operation operation);
    public void update(Operation operation);
    public void delete(Integer id);

}
