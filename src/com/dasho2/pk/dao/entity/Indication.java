package com.dasho2.pk.dao.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Indication {
	@Id
	@GeneratedValue
	private Integer id;
	private String partner;
	private String region;

	public Indication() {
	}

	public Indication(Integer id, String partner, String region) {
		this.id = id;
		this.partner = partner;
		this.region = region;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPartner() {
		return partner;
	}

	public void setPartner(String partner) {
		this.partner = partner;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

}
