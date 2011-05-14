package com.dasho2.pk.dao;

import javax.persistence.*;

@Entity
public class User {
	@Id
	@GeneratedValue
	private int id;
	private String login;
	private String password;

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

}
