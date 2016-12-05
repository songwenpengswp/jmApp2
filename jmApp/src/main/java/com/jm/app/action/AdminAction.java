package com.jm.app.action;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.jm.app.bean.Deliver;
import com.jm.app.bean.Project;
import com.jm.app.dao.DeliverDAO;
import com.jm.app.service.ProjectService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AdminAction extends ActionSupport {

	
	private ActionContext context;

	private Map<String, Object> request;

	private ProjectService proService;
	private Map<Integer,String> delMap;//项目发起者信息
	private Map<Integer,String> proMap;//项目信息
	private Integer delId;
	private Deliver del;
	private Project pro;
	private Integer proId;
	@Override
	public String execute() throws Exception {
		delMap=  proService.getDelNameWithId();
		if (delId == null) {
			for (Entry<Integer, String> entry : delMap.entrySet()) {
				delId = entry.getKey();
				break;
			}
		}
		del=proService.findDeliverId(delId);
		
		
		proMap=  proService.getProNameWithId();
		if (proId == null) {
			for (Entry<Integer, String> entry : proMap.entrySet()) {
				proId = entry.getKey();
				break;
			}
		}	
		pro=proService.findProiverId(proId);
		
		return super.execute();
	}


	public ProjectService getProService() {
		return proService;
	}

	public void setProService(ProjectService proService) {
		this.proService = proService;
	}


	public Map<Integer, String> getDelMap() {
		return delMap;
	}


	public void setDelMap(Map<Integer, String> delMap) {
		this.delMap = delMap;
	}


	public Integer getDelId() {
		return delId;
	}


	public void setDelId(Integer delId) {
		this.delId = delId;
	}


	public Deliver getDel() {
		return del;
	}


	public void setDel(Deliver del) {
		this.del = del;
	}


	public Map<Integer, String> getProMap() {
		return proMap;
	}


	public void setProMap(Map<Integer, String> proMap) {
		this.proMap = proMap;
	}


	public Project getPro() {
		return pro;
	}


	public void setPro(Project pro) {
		this.pro = pro;
	}


	public Integer getProId() {
		return proId;
	}


	public void setProId(Integer proId) {
		this.proId = proId;
	}
	


	

	
	
}
