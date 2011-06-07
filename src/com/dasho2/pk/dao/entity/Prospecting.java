package com.dasho2.pk.dao.entity;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;

@Entity
public class Prospecting {
	@Id
	@GeneratedValue
	private Integer id;

	private long visitDate;

	@ManyToOne
	private FinishingReason finishingReason;
	@ManyToOne
	private Employee employee;
	@ManyToOne
	private Operation operation;
	@ManyToOne
	private Indication indication;
	@ManyToOne
	private ProposalStatus proposalStatus;
	@ManyToOne
	private Customer customer;

	@OneToMany
	@OrderBy("time, id")
	private List<History> history;

	private long creationDate;
	private long modificationDate;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public FinishingReason getFinishingReason() {
		return finishingReason;
	}

	public void setFinishingReason(FinishingReason finishingReason) {
		this.finishingReason = finishingReason;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public Operation getOperation() {
		return operation;
	}

	public void setOperation(Operation operation) {
		this.operation = operation;
	}

	public Indication getIndication() {
		return indication;
	}

	public void setIndication(Indication indication) {
		this.indication = indication;
	}

	public ProposalStatus getProposalStatus() {
		return proposalStatus;
	}

	public void setProposalStatus(ProposalStatus proposalStatus) {
		this.proposalStatus = proposalStatus;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public void setHistory(List<History> history) {
		this.history = history;
	}

	public List<History> getHistory() {
		return history;
	}

	public long getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(long creationDate) {
		this.creationDate = creationDate;
	}

	public String getCreationDateString() {
		return new SimpleDateFormat("yyyy/MMM/dd HH:mm").format(new Date(creationDate));
	}

	public void updateCreationDate() {
		creationDate = Calendar.getInstance().getTime().getTime();
	}

	public long getVisitDate() {
		return visitDate;
	}

	public void setVisitDate(long visitDate) {
		this.visitDate = visitDate;
	}

	public String getVisitDateString() {
		return new SimpleDateFormat("yyyy/MMM/dd HH:mm").format(new Date(visitDate));
	}

	public void updateVisitDate() {
		visitDate = Calendar.getInstance().getTime().getTime();
	}

	public long getModificationDate() {
		return modificationDate;
	}

	public void setModificationDate(long modificationDate) {
		this.modificationDate = modificationDate;
	}

	public String getModificationDateString() {
		return new SimpleDateFormat("yyyy/MMM/dd HH:mm").format(new Date(modificationDate));
	}

	public void updateModificationDate() {
		modificationDate = Calendar.getInstance().getTime().getTime();
	}

}
