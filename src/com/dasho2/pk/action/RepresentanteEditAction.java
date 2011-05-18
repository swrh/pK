package com.dasho2.pk.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;


import com.dasho2.pk.dao.Representante;
import com.dasho2.pk.dao.impl.RepresentanteDAO;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.Validations;

@SuppressWarnings("serial")
public class RepresentanteEditAction extends ActionSupport{
	
	private Representante representante;
	
	public Representante getRepresentante() {
		return representante;
	}

	public void setRepresentante(Representante representante) {
		this.representante = representante;
	}

	@Action(value="representanteEdit", results={
			@Result(name="OK", type="redirectAction", params={"actionName", "representantes"}),
			@Result(name="ERROR", location="error.jsp"),
			@Result(name="input", location="representanteedit.jsp")
	})
	
	@Validations(requiredStrings={
			@RequiredStringValidator(fieldName="representante.razaosocial", message="Preencha a razão social.", trim=true),
			@RequiredStringValidator(fieldName="representante.contato", message="Preencha o contato.", trim=true),
			@RequiredStringValidator(fieldName="representante.responsavel", message="Preencha o responsável.", trim=true)
	})

	public String execute(){
		
		representante.updateModificationDate();
		return (new RepresentanteDAO().update(representante) ? "OK" : "ERROR");
		
	}
	
}
