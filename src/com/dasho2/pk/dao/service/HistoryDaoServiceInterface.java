package com.dasho2.pk.dao.service;

import java.util.List;

import com.dasho2.pk.dao.entity.History;

public interface HistoryDaoServiceInterface {
	public List<History> getAll();

	public History getById(Integer id);

	public void insert(History history);

	public void update(History history);

	public void delete(Integer id);

}
