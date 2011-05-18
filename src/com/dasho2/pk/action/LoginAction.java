package com.dasho2.pk.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;


import com.dasho2.pk.dao.User;
import com.dasho2.pk.dao.impl.UserDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.Validations;

@SuppressWarnings("serial")
public class LoginAction extends ActionSupport {
	private User user;
	
	@Action(value = "login", results = {
		@Result(name = SUCCESS, type = "redirect", location = "home"),
		@Result(name = ERROR, location = "login.jsp"),
		@Result(name = INPUT, location = "login.jsp")
	})
	@Validations(requiredStrings = {
		@RequiredStringValidator(fieldName = "user.login", message = "Preencha o login.", trim = true),
		@RequiredStringValidator(fieldName = "user.password", message = "Preencha a senha.", trim = true)
	})
	public String execute() {
		UserDAO dao = new UserDAO();
		
		if (!dao.matchUser(getUser())){
			addFieldError("user.invalid", "Usuário/senha inválidos.");
			return ERROR;
		}
		
		ActionContext.getContext().getSession().put("user", getUser());
		return SUCCESS;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public User getUser() {
		return user;
	}

}
