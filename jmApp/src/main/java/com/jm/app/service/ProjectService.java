package com.jm.app.service;

import java.util.List;
import java.util.Map;

import com.jm.app.bean.Deliver;
import com.jm.app.bean.Project;

public interface ProjectService {
	
	/**
	 * 通过项目类型获取项目
	 * @param type null-所有的项目 0-财富项目 1-梦想项目
	 * @param status null-全部 0-即将开始 1-正在众筹 2-众筹结束 3-完成兑付
	 * @return
	 */
	List<Project> getProByType(Integer type,Integer status);

	List<Project> findByDeliverId(int id);
	
	Deliver findDeliverId(int id);
	List<Deliver> findAll();
	
	List<Project> getAll();
	
	Map<Integer, String> getProNameWithId();
	Map<Integer, String> getDelNameWithId();
	Project findProiverId(int id);
}
