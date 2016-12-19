package com.jm.app.service;

import java.util.List;

import com.jm.app.bean.Project;
import com.jm.app.bean.ProjectSupport;

public interface ProjectSupportService {

	/**
	 * 显示所有数据
	 * @return
	 */
	List<ProjectSupport> getAll(int proId);
	/**
	 * 添加
	 * @param ps
	 */
	void add(ProjectSupport ps);
	/**
	 * 删除
	 * @param psId
	 */
	void delete(int id);
	/**
	 * 更新
	 * @param ps
	 */
	void UpDate(ProjectSupport ps);
	/**
	 * 通过项目的id获取某个项目对象
	 * @param projectId
	 * @return
	 */
	Project getProject(int projectId);
}
