package com.jm.app.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Hashtable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.jm.app.bean.Payinfo;
import com.jm.app.bean.User;
import com.jm.app.service.PayInfoService;
import com.jm.app.service.PaymentService;
import com.jm.app.util.PayUtil;
import com.jm.app.util.QRCodeUtil;

public class PaymentServlet extends HttpServlet {

	private PaymentService paymentService;
	
	private PayInfoService payInfoService;
	
	private ApplicationContext applicationContext;  
	
	/**
	 * Constructor of the object.
	 */
	public PaymentServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String projectId=request.getParameter("projectId");
		String goodsName=request.getParameter("goodsName");
		goodsName=new String(goodsName.getBytes("iso-8859-1"),"utf-8");
		String amount=request.getParameter("amount");
		String payType=request.getParameter("payType");
		User user=(User)request.getSession().getAttribute("user");
		
		String traceno=PayUtil.generateTraceno(projectId, String.valueOf(user.getId()));
		Payinfo payInfo=payInfoService.getPayinfo();
		String qrText=paymentService.getQRString(goodsName, Integer.valueOf(amount), Integer.valueOf(payType), traceno, payInfo);
        QRCodeUtil.writeToStream(qrText, response.getOutputStream());
        
		
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		 applicationContext = WebApplicationContextUtils.getRequiredWebApplicationContext(this.getServletContext()); 
		 paymentService=(PaymentService)applicationContext.getBean("PaymentService");
		 payInfoService=(PayInfoService)applicationContext.getBean("PayInfoService");
	}

}
