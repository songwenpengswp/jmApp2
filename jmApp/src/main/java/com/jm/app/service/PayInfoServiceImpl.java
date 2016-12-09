package com.jm.app.service;

import com.jm.app.bean.Payinfo;
import com.jm.app.dao.PayinfoDAO;

public class PayInfoServiceImpl implements PayInfoService {

	private PayinfoDAO payInfoDao;
	
	@Override
	public Payinfo getPayinfo() {
		// TODO Auto-generated method stub
		return payInfoDao.getUniquePayInfo();
	}

	public PayinfoDAO getPayInfoDao() {
		return payInfoDao;
	}

	public void setPayInfoDao(PayinfoDAO payInfoDao) {
		this.payInfoDao = payInfoDao;
	}

	
}
