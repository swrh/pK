package com.dasho2.pk.dao.service;

import java.util.List;

import com.dasho2.pk.dao.entity.Indication;

public interface IndicationDaoServiceInterface {
    public List<Indication> getAll();
    public Indication getById(Integer id);
    public void insert(Indication indication);
    public void update(Indication indication);
    public void delete(Integer id);

}
