package com.jm.app.service;

public class SmServiceImpl implements SmService {

	private String url; //短信发送的url地址
	
	private String account; //短信平台账号
	
	private String password; //短信平台密码
	
	
	@Override
	public void sendMessage(String tel, String content) {
		// TODO Auto-generated method stub

	}



	public String getUrl() {
		return url;
	}



	public void setUrl(String url) {
		this.url = url;
	}



	public String getAccount() {
		return account;
	}



	public void setAccount(String account) {
		this.account = account;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}

	
}
