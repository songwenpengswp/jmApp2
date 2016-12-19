package com.jm.app.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.jm.app.bean.Deliver;
import com.jm.app.bean.Project;
import com.jm.app.dao.DeliverDAO;
import com.jm.app.dao.ProjectDAO;

public class DeliverServiceImpl implements DeliverService{
	private ProjectDAO proDao;
	
	private DeliverDAO delDao;

	@Override
	public List<Deliver> findDeliverName(String name) {
		// TODO Auto-generated method stub
		return delDao.findByName(name);
	}

	@Override
	public Deliver findDeliverId(int id) {
		// TODO Auto-generated method stub
		return delDao.findDeliverId(id);
	}


}
