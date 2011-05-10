package com.dasho2.pk.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;


import com.dasho2.pk.dao.Representante;
import com.dasho2.pk.dao.impl.RepresentanteDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class RepresentanteDeleteAction extends ActionSupport{
	
	private Representante representante;
	
	public Representante getRepresentante() {
		return representante;
	}

	public void setRepresentante(Representante representante) {
		this.representante = representante;
	}

	@Action(value="representanteDelete", results={
			@Result(name="OK", type="redirectAction", params={"actionName", "representantes"}),
			@Result(name="ERROR", location="error.jsp"),
			@Result(name="input", location="representanteedit.jsp")
	})
	
	public String execute(){
		
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		
		representante = new RepresentanteDAO().searchRepresentanteById(request.getParameter("representante.id"));
		
		return (new RepresentanteDAO().delete(representante) ? "OK" : "ERROR");
		
	}

}
