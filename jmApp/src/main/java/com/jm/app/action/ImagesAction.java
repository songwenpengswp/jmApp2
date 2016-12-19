package com.jm.app.action;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.jm.app.bean.Project;
import com.jm.app.bean.User;
import com.jm.app.service.ProjectService;
import com.opensymphony.xwork2.ActionSupport;

public class ImagesAction extends ActionSupport implements ServletRequestAware{
	private HttpServletRequest request;
	private ProjectService proService;
	private String imageFileName;//   上传输入域FileName  文件名
	private String imageContentType;// 上传文件的MIME类型
	private Map<String,String> uploadMap; //文件上传返回信息
	private File picture;

	@Override
	public String execute() throws Exception {

		HttpSession session=ServletActionContext.getRequest().getSession();
		Project pro=(Project)session.getAttribute("pro");
		//获取服务在服务器的绝对路径
		String contextPathString = session.getServletContext().getRealPath("/");  
		//创建文件对象
		File savefile = new File(contextPathString+"/project/c_jzm/mvtg1_20160901","project"+".png"); 
		try {
			FileUtils.copyFile(picture, savefile);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String imgurl="/jmApp/project/c_jzm/mvtg1_20160901/"+"project"+".png";
		uploadMap=new HashMap<String,String>();
		uploadMap.put("imageUrl", imgurl);
		proService.updateProPic(pro.getId(),imgurl);
		pro.setPicture(imgurl);
		return super.execute();
	}
	

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		this.request=arg0;
		
	}

	public File getPicture() {
		return picture;
	}

	public void setPicture(File picture) {
		this.picture = picture;
	}


	public ProjectService getProService() {
		return proService;
	}


	public void setProService(ProjectService proService) {
		this.proService = proService;
	}


	public Map<String, String> getUploadMap() {
		return uploadMap;
	}


	public void setUploadMap(Map<String, String> uploadMap) {
		this.uploadMap = uploadMap;
	}


	public String getImageFileName() {
		return imageFileName;
	}


	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}


	public String getImageContentType() {
		return imageContentType;
	}


	public void setImageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}
	
	

}
