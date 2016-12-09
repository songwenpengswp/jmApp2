package com.jm.app.service;

import com.jm.app.bean.Payinfo;
import com.jm.app.bean.Project;
import com.jm.app.bean.Prorder;
import com.jm.app.bean.User;

/**
 * 微信、支付宝二维码扫描服务
 * @author songwp 2016-12-08
 *
 */
public interface PaymentService {
	
	/**
	 * 获取支付的二维码字符串
	 * @param goodsName 商品名称
	 * @param amount  总价
	 * @param payType  支付类型 0-支付宝 1-微信
	 * @param traceno 订单流水号
	 * @param payInfo  商户账户信息
	 * @return 二维码字符串
	 */
	String getQRString(String goodsName,int amount,int payType,String traceno,Payinfo payInfo);
	
	/**
	 * 保存订单信息
	 * @param prorder
	 */
    void saveProrder(Prorder prorder);
	
    /**
     * 通过用户的id获取用户对象
     * @param id
     * @return
     */
	User getUser(int userId);
	
	Project getProject(int projectId);

}
