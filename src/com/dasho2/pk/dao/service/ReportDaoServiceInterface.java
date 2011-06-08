package com.dasho2.pk.dao.service;

import java.util.List;

import com.dasho2.pk.dao.entity.Report;

public interface ReportDaoServiceInterface {
    public List<Report> getAll();
    public Report getById(Integer id);
    public void insert(Report report);
    public void update(Report report);
    public void delete(Integer id);

}
