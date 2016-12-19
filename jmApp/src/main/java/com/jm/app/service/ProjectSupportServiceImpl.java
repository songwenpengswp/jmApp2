package com.jm.app.service;

import java.util.List;

import com.jm.app.bean.Project;
import com.jm.app.bean.ProjectSupport;
import com.jm.app.dao.ProjectDAO;
import com.jm.app.dao.ProjectSupportDAO;

public class ProjectSupportServiceImpl implements ProjectSupportService {

	private ProjectSupportDAO projectSupportDao;
	private ProjectDAO projectDao;
	
	@Override
	public List<ProjectSupport> getAll(int proId){
		// TODO Auto-generated method stub
		return projectSupportDao.findByProId(proId);
	}

	@Override
	public void add(ProjectSupport ps) {
		// TODO Auto-generated method stub
		projectSupportDao.save(ps);
	}

	@Override
	public void delete(int id) {
		projectSupportDao.delete(id);

	}

	@Override
	public void UpDate(ProjectSupport ps) {
		// TODO Auto-generated method stub
		projectSupportDao.merge(ps);
	}
	
	@Override
	public Project getProject(int projectId) {
		Project pro=projectDao.findById(projectId);
		return pro;
	}

	public ProjectSupportDAO getProjectSupportDao() {
		return projectSupportDao;
	}

	public void setProjectSupportDao(ProjectSupportDAO projectSupportDao) {
		this.projectSupportDao = projectSupportDao;
	}

	public ProjectDAO getProjectDao() {
		return projectDao;
	}

	public void setProjectDao(ProjectDAO projectDao) {
		this.projectDao = projectDao;
	}


	

}
