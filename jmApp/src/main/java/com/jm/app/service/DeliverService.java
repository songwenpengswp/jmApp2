package com.jm.app.service;

import java.util.List;

import com.jm.app.bean.Deliver;
import com.jm.app.bean.Project;

public interface DeliverService {
	
	/**
	 * 通过DeliverId获取Deliver
	 * @param id
	 * @return
	 */
	List<Deliver> findDeliverName(String name);
	
	Deliver findDeliverId(int id);

}
