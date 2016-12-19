package com.jm.app.action;

import java.util.Iterator;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.jm.app.bean.Project;
import com.jm.app.bean.ProjectSupport;
import com.jm.app.service.ProjectSupportService;
import com.opensymphony.xwork2.ActionSupport;

public class ProjectSupportOptAction extends ActionSupport {

	private Integer proId;
	private Integer psId;
	private ProjectSupportService pssService;
	private ProjectSupport projectSupport=new ProjectSupport(); 

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return super.execute();
	}

	public String add() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		proId=(Integer) session.getAttribute("proId");
	Project project=new Project();
		project.setId(proId);
		projectSupport.setProject(project);
	    pssService.add(projectSupport);
		return "success";
	}
	public String edit(){
		HttpSession session = ServletActionContext.getRequest().getSession();
		proId=(Integer) session.getAttribute("proId");
	    Project project=new Project();
		project.setId(proId);
		projectSupport.setProject(project);
        pssService.UpDate(projectSupport);
		return "success";
	}
	public String del(){
		HttpSession session = ServletActionContext.getRequest().getSession();
		proId=(Integer) session.getAttribute("proId");
		
		Project pro=pssService.getProject(proId);
		Iterator<ProjectSupport> it=pro.getProjectSupports().iterator();
		while(it.hasNext()){
			ProjectSupport pt=it.next();
			if(pt.getId().equals(projectSupport.getId())){
			pssService.delete(pt.getId());
				it.remove();
			}
		}
		return "success";
	}

	public Integer getProId() {
		return proId;
	}

	public void setProId(Integer proId) {
		this.proId = proId;
	}

	public ProjectSupportService getPssService() {
		return pssService;
	}

	public void setPssService(ProjectSupportService pssService) {
		this.pssService = pssService;
	}

	public ProjectSupport getProjectSupport() {
		return projectSupport;
	}

	public void setProjectSupport(ProjectSupport projectSupport) {
		this.projectSupport = projectSupport;
	}

	public Integer getPsId() {
		return psId;
	}

	public void setPsId(Integer psId) {
		this.psId = psId;
	}
	

}
