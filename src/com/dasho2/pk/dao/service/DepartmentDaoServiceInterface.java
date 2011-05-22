package com.dasho2.pk.dao.service;

import java.util.List;

import com.dasho2.pk.dao.entity.Department;

public interface DepartmentDaoServiceInterface {
    public List<Department> getAll();
    public Department getById(Integer id);
    public void insert(Department department);
    public void update(Department department);
    public void delete(Integer id);

}
