package com.dasho2.pk.dao.entity;

import java.text.ParseException;
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

import com.dasho2.pk.util.StrutsSucks;

@Entity
public class Prospecting {
	@Id
	@GeneratedValue
	private Integer id;

	private Date visitDateTime;

	private String productValue;

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
	@ManyToOne
	private Product product;

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

	public void setProduct(Product product) {
		this.product = product;
	}

	public Product getProduct() {
		return product;
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

	public Date getVisitDateTime() {
		return visitDateTime;
	}

	public void setVisitDateTime(Date visitDateTime) {
		this.visitDateTime = visitDateTime;
	}

	public String getVisitDate() {
		if (getVisitDateTime() == null)
			return "";
		return new SimpleDateFormat("dd/MM/yy").format(getVisitDateTime());
	}

	public void setVisitDate(String visitDate) {
		try {
			Date date = StrutsSucks.parseRFC3339Date(visitDate);
			Date time = getVisitDateTime();
			if (time == null)
				time = date;
			Date newDate = new Date(date.getYear(), date.getMonth(), date.getDate(), time.getHours(), time.getMinutes(), time.getSeconds());
			setVisitDateTime(newDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IndexOutOfBoundsException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public String getVisitTime() {
		if (getVisitDateTime() == null)
			return "";
		return new SimpleDateFormat("HH:mm").format(getVisitDateTime());
	}

	public void setVisitTime(String visitTime) {
		try {
			Date date = getVisitDateTime();
			Date time = StrutsSucks.parseRFC3339Date(visitTime);
			if (date == null)
				date = time;
			Date newDate = new Date(date.getYear(), date.getMonth(), date.getDate(), time.getHours(), time.getMinutes(), time.getSeconds());
			setVisitDateTime(newDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IndexOutOfBoundsException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void setProductValue(String productValue) {
		this.productValue = productValue;
	}

	public String getProductValue() {
		return productValue;
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
