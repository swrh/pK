package com.dasho2.pk.dao.service;

import java.util.List;

import com.dasho2.pk.dao.entity.FinishingReason;

public interface FinishingReasonDaoServiceInterface {
    public List<FinishingReason> getAll();
    public FinishingReason getById(Integer id);
    public void insert(FinishingReason finishingReason);
    public void update(FinishingReason finishingReason);
    public void delete(Integer id);

}
