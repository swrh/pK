package com.dasho2.pk.dao.service;

import java.util.List;

import com.dasho2.pk.dao.entity.Prospecting;

public interface ProspectingDaoServiceInterface {
    public List<Prospecting> getAll();
    public Prospecting getById(Integer id);
    public void insert(Prospecting prospecting);
    public void update(Prospecting prospecting);
    public void delete(Integer id);

}
