package br.com.pk.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import br.com.pk.dao.Representante;
import br.com.pk.dao.impl.RepresentanteDAO;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.Validations;

@SuppressWarnings("serial")
public class RepresentanteSaveAction extends ActionSupport{
	
	private Representante representante;
	
	public Representante getRepresentante() {
		return representante;
	}

	public void setRepresentante(Representante representante) {
		this.representante = representante;
	}

	@Action(value="representanteSave", results={
			@Result(name="OK", type="redirectAction", params={"actionName", "representantes"}),
			@Result(name="ERROR", location="error.jsp"),
			@Result(name="input", location="representante.jsp")
	})
	
	@Validations(requiredStrings={
			@RequiredStringValidator(fieldName="representante.razaosocial", message="Preencha a razão social.", trim=true),
			@RequiredStringValidator(fieldName="representante.contato", message="Preencha o contato.", trim=true),
			@RequiredStringValidator(fieldName="representante.responsavel", message="Preencha o responsável.", trim=true)
	})

	public String execute(){
		
		return (new RepresentanteDAO().save(representante) ? "OK" : "ERROR");
		
	}

}
