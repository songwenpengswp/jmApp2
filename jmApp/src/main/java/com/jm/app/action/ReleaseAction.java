package com.jm.app.action;

import java.util.List;

import javax.servlet.http.Cookie;

import com.jm.app.bean.Message;
import com.jm.app.bean.User;
import com.jm.app.bean.UserMessage;
import com.jm.app.dao.MessageDAO;
import com.jm.app.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class ReleaseAction extends ActionSupport {
   
	private UserService us;
	
	private String title;
	
	private String content;
	@Override
	public String execute() throws Exception {
		
		Message m=new Message();
		String titl = new String(title.getBytes("ISO-8859-1"),"UTF-8");
		String content2 = new String(content.getBytes("ISO-8859-1"),"UTF-8");
		m.setTitle(titl);
		m.setContent(content2);
		us.add(m);
	    List<User> list=us.findAll();
		for (User u : list) {
			UserMessage um=new UserMessage();
			um.setMessage(m);
			um.setUser(u);
			us.addUserMessage(um);
		}
		return super.execute();
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public UserService getUs() {
		return us;
	}
	public void setUs(UserService us) {
		this.us = us;
	}


	 
	
	
	
	
}
