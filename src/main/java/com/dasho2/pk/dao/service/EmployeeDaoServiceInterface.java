package com.dasho2.pk.dao.service;

import java.util.List;

import com.dasho2.pk.dao.entity.Employee;

public interface EmployeeDaoServiceInterface {
	public List<Employee> getAll();

	public Employee getById(Integer id);

	public void insert(Employee employee);

	public void update(Employee employee);

	public void delete(Integer id);

	public Employee authenticate(Employee employee);

}
