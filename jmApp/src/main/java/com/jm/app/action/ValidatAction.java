package com.jm.app.action;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.jm.app.bean.User;
import com.jm.app.service.LoginService;
import com.jm.app.service.RegisterService;
import com.jm.app.service.SmService;
import com.jm.app.service.UserService;
import com.jm.app.util.RandomUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ValidatAction extends ActionSupport {
	private UserService userService;
	private SmService smservice;
	private ActionContext context;
	private String tel;
	private String code;
	private Map<String, Boolean> dataMap;
	private RegisterService registerService;
	private Map<String, Object> session;
	private LoginService loginService;
	private Map<String, Object> request;
	private HttpServletRequest request2;
	private String Password;
    private User user;
   
	public String validateTel() {
		dataMap = new HashMap<String, Boolean>();
		if (registerService.validateTel(tel))
			dataMap.put("valid", true);
		else
			dataMap.put("valid", false);
		return SUCCESS;
	}

	public String createCode() {
		String newCode = RandomUtil.randomNum(4);
		context = ActionContext.getContext();
		session = (Map) context.getSession();
		session.put("code", newCode);
		session.put("tel", tel);
		session.put("Password", Password);
		System.out.println(newCode);
		System.out.println(tel);
		smservice.sendMessage(tel, newCode);
		return SUCCESS;
	}

	public String register() {
		request2 = ServletActionContext.getRequest();
		context = ActionContext.getContext();
		session = (Map) context.getSession();
		String orgTel = (String) session.get("tel");
		String orgCode = (String) session.get("code");
		request = (Map) context.get("request");

		if (!orgTel.equals(tel)) {
			request.put("error", 1); // 手机号错误
			return "val_failture";
		}
		if (!orgCode.equals(code)) {
			request.put("error", 2); // 验证码错误
			return "val_failture";
		}
		request.put("success", 0); // 注册成功

		// TODO Auto-generated method stub
		// PrintWriter pw = response.getWriter();
		// 通过用户tel重新查找用户
		 user = userService.findUserByTel(tel);
			HttpSession session = request2.getSession(true);
			session.setAttribute("user", user);
		session.setMaxInactiveInterval(30*60*24);
		return "val_success";

	}
	/*public String register2() {
		User user=(User) session.get("user");
		user.setPassword(Password);
		userService.updatPassw(user);
		return "val_success";
	}*/
	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public ActionContext getContext() {
		return context;
	}

	public void setContext(ActionContext context) {
		this.context = context;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Map<String, Boolean> getDataMap() {
		return dataMap;
	}

	public void setDataMap(Map<String, Boolean> dataMap) {
		this.dataMap = dataMap;
	}

	public RegisterService getRegisterService() {
		return registerService;
	}

	public void setRegisterService(RegisterService registerService) {
		this.registerService = registerService;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public Map<String, Object> getRequest() {
		return request;
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public LoginService getLoginService() {
		return loginService;
	}

	public void setLoginService(LoginService loginService) {
		this.loginService = loginService;
	}

	public SmService getSmservice() {
		return smservice;
	}

	public void setSmservice(SmService smservice) {
		this.smservice = smservice;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

}
