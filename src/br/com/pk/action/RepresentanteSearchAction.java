package br.com.pk.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import br.com.pk.dao.Representante;
import br.com.pk.dao.impl.RepresentanteDAO;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class RepresentanteSearchAction extends ActionSupport{
	
	private Representante representante;
	
	public Representante getRepresentante() {
		return representante;
	}

	public void setRepresentante(Representante representante) {
		this.representante = representante;
	}

	@Action(value="representanteSearch", results={
			@Result(name="OK", location="representanteedit.jsp"),
			@Result(name="ERROR", location="error.jsp"),
			@Result(name="input", location="listrepresentante.jsp")
	})
	
	public String execute(){
		
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		
		representante = new RepresentanteDAO().searchRepresentanteById(request.getParameter("representante.id"));
		
		return (representante != null ? "OK" : "ERROR");
		
	}
	
}
