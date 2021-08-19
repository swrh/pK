package com.dasho2.pk.dao.entity;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class History {
	@Id
	@GeneratedValue
	private Integer id;

	private String text;

	@ManyToOne
	private Employee employee;

	private long time;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public Employee getEmployee() {
		return employee;
	}

	public long getTime() {
		return time;
	}

	public void setTime(long time) {
		this.time = time;
	}

	public String getTimeString() {
		return new SimpleDateFormat("yyyy/MMM/dd HH:mm").format(new Date(time));
	}

	public void updateTime() {
		time = Calendar.getInstance().getTime().getTime();
	}

}
