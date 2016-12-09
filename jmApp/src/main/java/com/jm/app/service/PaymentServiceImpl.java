package com.jm.app.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import net.sf.json.JSONObject;

import com.jm.app.bean.Payinfo;
import com.jm.app.bean.Project;
import com.jm.app.bean.Prorder;
import com.jm.app.bean.User;
import com.jm.app.dao.ProjectDAO;
import com.jm.app.dao.ProrderDAO;
import com.jm.app.dao.UserDAO;
import com.jm.app.util.PayUtil;

public class PaymentServiceImpl implements PaymentService {

	private String pay_url;  //支付平台url地址
	
	private String notify_url; //支付通知url地址 
	
	private ProrderDAO prorderDao; 
	
	private UserDAO userDao;
	
	private ProjectDAO projectDao;
	
	@Override
	public String getQRString(String goodsName, int amount, int payType,
			String traceno, Payinfo payInfo) {
		
		Map<String, String> param = PayUtil.buildRequestParam(false);
		param.put("merchno", payInfo.getMerchNo());
		param.put("amount", String.valueOf(amount));
		param.put("traceno", traceno);
		param.put("payType", String.valueOf(payType));
		param.put("goodsName", goodsName);
		param.put("notifyUrl", notify_url);
		param.put("settleType", "1");
		
		param.put("certno", payInfo.getCertNo());
		param.put("mobile", payInfo.getMobile());
		param.put("accountno", payInfo.getAccountNo());
		param.put("accountName", payInfo.getAccountName());
		param.put("bankno", payInfo.getBankNo());
		param.put("bankName", payInfo.getBankName());
		param.put("bankType", payInfo.getBankType());
		param.put("fee", String.valueOf(payInfo.getFee()));
		
		Map<String, String> reqParam = new HashMap<String, String>();
		Set<String> keySet = param.keySet();
		Iterator<String> iter = keySet.iterator();
		while (iter.hasNext()) {
			String key = iter.next();
			reqParam.put(key, param.get(key));
		}
		try {
			reqParam.put("signature",
					PayUtil.signature(reqParam, "0123456789ABCDEF0123456789ABCDEF"));
			String url = PayUtil.buildUrl(pay_url,"passivePay", reqParam);
			String result = PayUtil.receiveBySend(url, "GBK");
			JSONObject jsonObject = JSONObject.fromObject( result ); 
			if(jsonObject.getString("respCode").equals("00"))
				return jsonObject.getString("barCode");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public void saveProrder(Prorder prorder) {
		// TODO Auto-generated method stub
        prorderDao.save(prorder);
	}

	public String getPay_url() {
		return pay_url;
	}

	public void setPay_url(String pay_url) {
		this.pay_url = pay_url;
	}

	public ProrderDAO getProrderDao() {
		return prorderDao;
	}

	public void setProrderDao(ProrderDAO prorderDao) {
		this.prorderDao = prorderDao;
	}

	public String getNotify_url() {
		return notify_url;
	}

	public void setNotify_url(String notify_url) {
		this.notify_url = notify_url;
	}

	@Override
	public User getUser(int userId) {
		// TODO Auto-generated method stub
		return userDao.findById(userId);
	}

	@Override
	public Project getProject(int projectId) {
		// TODO Auto-generated method stub
		return projectDao.findById(projectId);
	}

	public UserDAO getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDAO userDao) {
		this.userDao = userDao;
	}

	public ProjectDAO getProjectDao() {
		return projectDao;
	}

	public void setProjectDao(ProjectDAO projectDao) {
		this.projectDao = projectDao;
	}

	
	
}
