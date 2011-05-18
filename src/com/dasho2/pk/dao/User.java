package com.dasho2.pk.dao;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.persistence.*;

@Entity
public class User {
	@Id
	@GeneratedValue
	private int id;
	private String login;
	private String password;

	private long creationDate;
	private long modificationDate;

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return id;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getLogin() {
		return login;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword() {
		return password;
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
