package com.jm.app.action;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.jm.app.bean.Deliver;
import com.jm.app.bean.Project;
import com.jm.app.dao.DeliverDAO;
import com.jm.app.service.ProjectService;
import com.jm.app.service.ProjectSupportService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AdminAction extends ActionSupport {

	
	private ActionContext context;
	private Map<String, Object> request;
	private ProjectService proService;
	private Map<Integer, String> delMap;// 项目发起者信息
	private Map<Integer, String> proMap;// 项目信息
	private Integer delId;
	private Integer delId2;
	private Deliver del;
	private Project pro;
	private Integer proId;
	private Integer proId2;
	private Integer main_page;
	private Map<String, Object> session;
	private ProjectSupportService pssService;
	private String code;// 编号
	private String title;// 标题
	private String sub_title;// 副标题
	private File pic;// 图片
	private Integer target_money;// 目标金额
	private Float percent;// 转换率
	private Integer cycle;// 回报周期
	private Date start;
	private Date end;
	@Override
	public String execute() throws Exception {
		delMap=  proService.getDelNameWithId();
		if (delId == null) {
			for (Entry<Integer, String> entry : delMap.entrySet()) {
				delId = entry.getKey();
				break;
			}
		}
		del=proService.findDeliverId(delId);
		
		
		proMap = proService.getProNameWithIdByDelId(delId);
		if (proId == null) {
			for (Entry<Integer, String> entry : proMap.entrySet()) {
				proId = entry.getKey();
				break;
			}
		}	
		pro=proService.findProiverId(proId);
		
		return super.execute();
	}
	public String updatePro() throws UnsupportedEncodingException {

		String a = "c_jzm/mvtg2_20161001/project.png";
		String b = "carousel/gy.jpg";
		HttpSession session = ServletActionContext.getRequest().getSession();
		delId2 = (Integer) session.getAttribute("delId");
		proId = (Integer) session.getAttribute("proId");
		Project p2 = proService.findProiverId(proId2);
		Deliver d = proService.findDeliverId(delId2);
		Project p = new Project();
		p.setId(proId2);
		p.setCode(code);
		String titl = new String(title.getBytes("ISO-8859-1"), "UTF-8");
		String subtitl = new String(sub_title.getBytes("ISO-8859-1"), "UTF-8");
		p.setTitle(titl);
		p.setSubtitle(subtitl);
		p.setPicture(a);
		p.setTarget(target_money);
		p.setPeriod(cycle);
		p.setConverted(percent);
		/* String start2=start.toString(); */
		p.setStart(start);
		p.setStop(end);
		p.setCarousel(b);
      
		proService.updateProject(p);
		return "success";
	};

	public String add() throws UnsupportedEncodingException {
		HttpSession session = ServletActionContext.getRequest().getSession();
		String a = "c_jzm/mvtg2_20161001/project.png";
		String b = "carousel/gy.jpg";
		delId2 = (Integer) session.getAttribute("delId");
		Deliver d = proService.findDeliverId(delId2);

		Project p = new Project();
		
		p.setCode(code);
		String titl = new String(title.getBytes("ISO-8859-1"), "UTF-8");
		String subtitl = new String(sub_title.getBytes("ISO-8859-1"), "UTF-8");
		p.setTitle(titl);
		p.setSubtitle(subtitl);
		p.setPicture(a);
		p.setTarget(target_money);
		p.setPeriod(cycle);
		p.setConverted(percent);
		/* String start2=start.toString();*/ 
		p.setStart(start);
		p.setStop(end);
		p.setCarousel(b);
		p.setDeliver(d);
		proService.addPro(p);
		return "success";
	}

	public ProjectService getProService() {
		return proService;
	}

	public void setProService(ProjectService proService) {
		this.proService = proService;
	}


	public Map<Integer, String> getDelMap() {
		return delMap;
	}


	public void setDelMap(Map<Integer, String> delMap) {
		this.delMap = delMap;
	}


	public Integer getDelId() {
		return delId;
	}


	public void setDelId(Integer delId) {
		this.delId = delId;
	}


	public Deliver getDel() {
		return del;
	}


	public void setDel(Deliver del) {
		this.del = del;
	}


	public Map<Integer, String> getProMap() {
		return proMap;
	}


	public void setProMap(Map<Integer, String> proMap) {
		this.proMap = proMap;
	}


	public Project getPro() {
		return pro;
	}


	public void setPro(Project pro) {
		this.pro = pro;
	}


	public Integer getProId() {
		return proId;
	}


	public void setProId(Integer proId) {
		this.proId = proId;
	}
	


	

	
	
}
