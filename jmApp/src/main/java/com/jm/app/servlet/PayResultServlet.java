package com.jm.app.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.jm.app.bean.Project;
import com.jm.app.bean.Prorder;
import com.jm.app.bean.User;
import com.jm.app.service.PaymentService;

public class PayResultServlet extends HttpServlet {

	private PaymentService paymentService;
	
	private ApplicationContext applicationContext;  
	/**
	 * Constructor of the object.
	 */
	public PayResultServlet() {
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
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
      String amount=request.getParameter("amount");
      String traceno=request.getParameter("traceno");
      String[] traceinfo=traceno.split("_");
      String payType=request.getParameter("payType");
      String orderno=request.getParameter("orderno");
      String payStatus=request.getParameter("status");
	  
      User user=paymentService.getUser(Integer.valueOf(traceinfo[2]));
      Project project=paymentService.getProject(Integer.valueOf(traceinfo[1]));
      Prorder prorder=new Prorder();
      prorder.setUser(user);
      prorder.setProject(project);
      int amountV=Integer.valueOf(amount);
      prorder.setInvestment(amountV);
      prorder.setIncome(amountV*(1+project.getConverted()*0.01f));
      prorder.setOrderno(orderno);
      prorder.setPayType(Integer.valueOf(payType));
      prorder.setBuyDate(new Date());
      Calendar calendar=Calendar.getInstance();
      calendar.setTime(project.getStart());
      calendar.add(Calendar.MONTH, project.getPeriod());
      prorder.setReportDate(calendar.getTime());
      prorder.setStatuses(0);
      prorder.setPayStatus(Integer.valueOf(payStatus));
      prorder.setTraceno(traceno);
      paymentService.saveProrder(prorder);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		 applicationContext = WebApplicationContextUtils.getRequiredWebApplicationContext(this.getServletContext()); 
		 paymentService=(PaymentService)applicationContext.getBean("PaymentService");
	}

	
}
