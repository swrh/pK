package com.dasho2.pk.dao;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Representante {
	@Id
	@GeneratedValue
	private int id;
	private String razaosocial;
	private String contato;
	private String responsavel;
	
	private long creationDate;
	private long modificationDate;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRazaosocial() {
		return razaosocial;
	}
	public void setRazaosocial(String razaosocial) {
		this.razaosocial = razaosocial;
	}
	public String getContato() {
		return contato;
	}
	public void setContato(String contato) {
		this.contato = contato;
	}
	public String getResponsavel() {
		return responsavel;
	}
	public void setResponsavel(String responsavel) {
		this.responsavel = responsavel;
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
