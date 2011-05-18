package com.dasho2.pk.dao;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Department {
	@Id
	@GeneratedValue
	private int id;
	private String name;

	private long creationDate;
	private long modificationDate;

	public void setId(int id) {
		this.id = id;
	}
	
	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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
