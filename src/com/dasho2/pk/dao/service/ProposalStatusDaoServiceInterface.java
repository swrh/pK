package com.dasho2.pk.dao.service;

import java.util.List;

import com.dasho2.pk.dao.entity.ProposalStatus;

public interface ProposalStatusDaoServiceInterface {
    public List<ProposalStatus> getAll();
    public ProposalStatus getById(Integer id);
    public void insert(ProposalStatus proposalStatus);
    public void update(ProposalStatus proposalStatus);
    public void delete(Integer id);

}
