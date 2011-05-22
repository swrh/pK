package com.dasho2.pk.dao.service;

import java.util.List;

import com.dasho2.pk.dao.entity.Representative;

public interface RepresentativeDaoServiceInterface {
    public List<Representative> getAll();
    public Representative getById(Integer id);
    public void insert(Representative representative);
    public void update(Representative representative);
    public void delete(Integer id);

}
