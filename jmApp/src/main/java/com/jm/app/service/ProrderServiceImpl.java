package com.jm.app.service;

import com.jm.app.bean.Prorder;
import com.jm.app.dao.ProrderDAO;

public class ProrderServiceImpl implements ProrderService {
    
	private ProrderDAO prorderDao;
	
	@Override
	public void save(Prorder prorder) {
		// TODO Auto-generated method stub
        prorderDao.save(prorder);
	}

	public ProrderDAO getProrderDao() {
		return prorderDao;
	}

	public void setProrderDao(ProrderDAO prorderDao) {
		this.prorderDao = prorderDao;
	}

	
}
