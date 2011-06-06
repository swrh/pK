package com.dasho2.pk.action;

import com.dasho2.pk.dao.User;
import com.dasho2.pk.dao.impl.UserDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class AuthenticationAction extends ActionSupport {
	private User user;

	@Override
	public String input() throws Exception {
		return INPUT;
	}

	public String login() {
		UserDAO dao = new UserDAO();

		if (!dao.matchUser(getUser())) {
			addFieldError("user.invalid", "Usuário/senha inválidos.");
			return ERROR;
		}

		ActionContext.getContext().getSession().put("user", getUser());
		return SUCCESS;
	}

	public String logout() {
		setUser(null);
		ActionContext.getContext().getSession().remove("user");
		return SUCCESS;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public User getUser() {
		return user;
	}

}
