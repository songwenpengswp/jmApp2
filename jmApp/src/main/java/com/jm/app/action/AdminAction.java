package com.jm.app.action;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.jm.app.bean.Deliver;
import com.jm.app.bean.Project;
import com.jm.app.bean.ProjectSupport;

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
	private File pic2;

	@Override
	public String execute() throws Exception {
		delMap = proService.getDelNameWithId();
		if (delId == null) {
			for (Entry<Integer, String> entry : delMap.entrySet()) {
				delId = entry.getKey();
				break;
			}
		}
		del = proService.findDeliverId(delId);
		proMap = proService.getProNameWithIdByDelId(delId);

		if (proId == null) {
			for (Entry<Integer, String> entry : proMap.entrySet()) {
				proId = entry.getKey();
				break;
			}
		}
		if (proId != null) {
			pro = proService.findProiverId(proId);
		}
		context = ActionContext.getContext();
		request = (Map) context.get("request");

		List<ProjectSupport> list = pssService.getAll(proId);
		request.put("list", list);
		session = (Map) context.getSession();
		session.put("proId", proId);
		session.put("delId", delId);

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

	public Integer getDelId2() {
		return delId2;
	}

	public void setDelId2(Integer delId2) {
		this.delId2 = delId2;
	}

	public Map<String, Object> getRequest() {
		return request;
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public Integer getMain_page() {
		return main_page;
	}

	public void setMain_page(Integer main_page) {
		this.main_page = main_page;
	}

	public ProjectSupportService getPssService() {
		return pssService;
	}

	public void setPssService(ProjectSupportService pssService) {
		this.pssService = pssService;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSub_title() {
		return sub_title;
	}

	public void setSub_title(String sub_title) {
		this.sub_title = sub_title;
	}

	public File getPic() {
		return pic;
	}

	public void setPic(File pic) {
		this.pic = pic;
	}

	public Integer getTarget_money() {
		return target_money;
	}

	public void setTarget_money(Integer target_money) {
		this.target_money = target_money;
	}

	public Date getStart() {
		return start;
	}

	public void setStart(Date start) {
		this.start = start;
	}

	public Date getEnd() {
		return end;
	}

	public void setEnd(Date end) {
		this.end = end;
	}

	public File getPic2() {
		return pic2;
	}

	public void setPic2(File pic2) {
		this.pic2 = pic2;
	}

	public Integer getProId2() {
		return proId2;
	}

	public void setProId2(Integer proId2) {
		this.proId2 = proId2;
	}

	public Float getPercent() {
		return percent;
	}

	public void setPercent(Float percent) {
		this.percent = percent;
	}

	public Integer getCycle() {
		return cycle;
	}

	public void setCycle(Integer cycle) {
		this.cycle = cycle;
	}

}
