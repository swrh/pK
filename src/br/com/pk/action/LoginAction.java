package br.com.pk.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import br.com.pk.dao.Usuario;
import br.com.pk.dao.impl.UsuarioDAO;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.Validations;

public class LoginAction extends ActionSupport{
	
	private Usuario usuario;
	
	@Action(value="login", results={
			@Result(name="OK", location="menu.jsp"),
			@Result(name="INVALIDO", location="login.jsp"),
			@Result(name="input", location="login.jsp")
	})
	
	@Validations(requiredStrings={
			@RequiredStringValidator(fieldName="usuario.login", message="Preencha o login.", trim=true),
			@RequiredStringValidator(fieldName="usuario.senha", message="Preencha a senha.", trim=true)
	})

	public String execute(){
		
		UsuarioDAO usuarioDAO = new UsuarioDAO();
		
		 if (usuarioDAO.existeUsuario(usuario)){
		 
			ActionContext.getContext().getSession().put("usuarioLogado", usuario);
			return "OK";
		
		 }
		 
		addFieldError("usuario.invalid", "Usuário/senha inválidos.");
		return "INVALIDO";
		
	}
	
	public Usuario getUsuario(){
		return usuario;
	}
	
	public void setUsuario(Usuario usuario){
		this.usuario = usuario;
	}
	
}
