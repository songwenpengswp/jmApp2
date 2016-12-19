package com.jm.app.servlet;



import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import org.springframework.context.ApplicationContext;

import org.springframework.web.context.support.WebApplicationContextUtils;

import com.google.gson.Gson;
import com.jm.app.bean.Deliver;
import com.jm.app.bean.Project;
import com.jm.app.bean.UploadState;

import com.jm.app.listener.UploadProgressListener;
import com.jm.app.service.ProjectService;
import com.jm.app.service.ProjectServiceImpl;
import com.jm.app.util.DeCompressUtil;

public class UploadFile extends  HttpServlet {

	private static final long serialVersionUID = 1L;
	private String uploadpath = "upload";// 文件上传地址
	private String unpackpath = "project";
	private long maxSize = 100 * 1024 * 1024;// 最大文件大小100M
	private String limitfile = "zip,rar";// 限制上传类型doc,docx,xls,xlsx,ppt,htm,html,txt,
	private Gson gson = new Gson();
    private Integer delId;
	private Integer proId;
	private  ProjectService p=new ProjectServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
		try {
			req.setCharacterEncoding("UTF-8");
			resp.setContentType("text/html; charset=UTF-8");
			String upid = req.getParameter("upid");
			UploadState state = (UploadState) req.getSession().getAttribute("upstate");
			String s="";
			if (upid!=null&&state != null && upid.equals(state.getId())) {
				s = gson.toJson(state);
			}
			System.out.println(state+"GET："+upid+"_"+s);
			PrintWriter out = resp.getWriter();
			out.write(s);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		try {
			HttpSession session = req.getSession();	
			req.setCharacterEncoding("UTF-8");
			resp.setContentType("text/html; charset=UTF-8");			
			String s="";
			PrintWriter out = resp.getWriter();
			boolean ismulti=ServletFileUpload.isMultipartContent(req);
			if(ismulti){
				
				UploadState us=(UploadState)session.getAttribute("upstate");
				if (us == null) {
					us = new UploadState();
					session.setAttribute("upstate", us);
				}
				us.setTargetfile("");
				us.setErrormsg("");
				us.setTotalsize(0);
				us.setUploadsize(0);
				us.setState(0);// 默认正常状态
				long length = req.getContentLength();
				us.setTotalsize(length);
				if (length > maxSize) {
					setStatusMsg(req, -1, "文件内容超过最大限制!");
					s = gson.toJson(us);
				} else {				
										
					
						processFileUpload(req, out);
					    s = gson.toJson(us);
				}
				
				/*HttpSession session = request.getSession()；*/
				
			}  				
			out.write(s);
			out.flush();
			out.close();	
	
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
	}

	@SuppressWarnings("unchecked")
	public void processFileUpload(HttpServletRequest request, PrintWriter out)
			throws ServletException, IOException {
		String savePath=this.getServletConfig().getServletContext().getRealPath("/")+uploadpath;
		// 临时文件目录
		String tempPath = savePath + "/temp";

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
		String ymd = sdf.format(new Date());
		String path = savePath + "/" + ymd + "/";
		// 创建文件夹
		File dirFile = new File(path);
		if (!dirFile.exists()) {
			dirFile.mkdirs();
		}

		// 创建临时文件夹
		File dirTempFile = new File(tempPath);
		if (!dirTempFile.exists()) {
			dirTempFile.mkdirs();
		}

		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(5 * 1024 * 1024); // 设定使用内存超过5M时，将产生临时文件并存储于临时目录中。
		factory.setRepository(new File(tempPath)); // 设定存储临时文件的目录。

		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setHeaderEncoding("UTF-8");

		// 创建一个进度监听器
		UploadProgressListener progressListener = new UploadProgressListener(
				request);
		upload.setProgressListener(progressListener);
		upload.setFileSizeMax(maxSize);
		try {
			List items = upload.parseRequest(request);
			Iterator itr = items.iterator();
			while (itr.hasNext()) {
				FileItem item = (FileItem) itr.next();
				if (item.isFormField()) {  
					 //如果是普通表单字段  
					  String name = item.getFieldName();
					  if(name!=null&&name.equals("unpkpath")){
						  unpackpath = item.getString().trim();
					  }
				}else{
					String fileName = item.getName();
					long fileSize = item.getSize();
						// 检查文件大小
						if (fileSize > maxSize) {
							setStatusMsg(request, -1, "文件内容超过最大限制!");
							break;
						}
						// 检查扩展名
						String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
						if (limitfile.indexOf(fileExt) < 0) {
							setStatusMsg(request, -1, "上传文件扩展名是不允许的扩展名。只允许"
									+ limitfile + "格式。!");
							return;
						}
						String newFileName = System.currentTimeMillis() + "_"
								+ new Random().nextInt(1000) + "." + fileExt;
						File uploadedFile = new File(path, newFileName);
						try {
							HttpSession session = request.getSession();
							UploadState state = (UploadState) session
									.getAttribute("upstate");
							state.setTargetfile(uploadedFile.getPath());
							OutputStream os = new FileOutputStream(uploadedFile);
							InputStream is = item.getInputStream();
							byte buf[] = new byte[1024];// 可以修改 1024 以提高读取速度
							int length = 0;
							while ((length = is.read(buf)) > 0) {
								os.write(buf, 0, length);
							}
							// 关闭流
							os.flush();
							os.close();
							is.close();
						} catch (Exception e) {
							setStatusMsg(request, -1, "上传失败!");
							return;
						}
						setStatusMsg(request, 1, "上传成功");
						//解压后文件保存到数据库中
						HttpSession session = request.getSession();		
						proId=(Integer) session.getAttribute("proId");
						delId=(Integer) session.getAttribute("delId");
						Project pro=p.findProiverId(proId);
						Deliver del=p.findDeliverId(delId);			
						String a=pro.getCode();
						String b=del.getCode();
						String unpath=this.getServletConfig().getServletContext().getRealPath("/")+unpackpath+"/"+b +"/"+a;						
						File f=new File(unpath);
						if(!f.exists()){
							f.mkdirs();
						}	
						//上传图片
						
					/*	HttpSession session = request.getSession();		
						proId=(Integer) session.getAttribute("proId");
						delId=(Integer) session.getAttribute("delId");
						Project pro=p.findProiverId(proId);
						Deliver del=p.findDeliverId(delId);			
						String a=pro.getCode();
						String b=del.getCode();
							*/					
					
					
						/*DiskFileItemFactory factory2=new DiskFileItemFactory();
						ServletFileUpload sfu=new ServletFileUpload(factory2);*/
						/*//设置文件大小
						upload.setFileSizeMax(-1);
						//缓存输出字节流
						BufferedOutputStream bos=null;
						//缓存输入字节流
						BufferedInputStream bis=null;
						//获取服务在服务器的绝对路径
						//解压后文件保存到数据库中
					
						String contextPathString=this.getServletConfig().getServletContext().getRealPath("/")+unpackpath+"/"+b +"/"+a;						

						
						//创建文件对象
						File parentfile=new File(contextPathString+"/","wx.png ");
						
						List<FileItem> list = upload.parseRequest(request);
							for(FileItem item2:list){
								//获取上传文件的输入流
								InputStream is=item2.getInputStream();
								//设置文件输出的缓存输出流
								bos=new BufferedOutputStream(new FileOutputStream(parentfile));
								//设置文件输入的缓存输入流
								bis=new BufferedInputStream(is);
								//读取输入流的数据存放到输出流中
								byte[] buffer=new byte[1024];
								int len=-1;
								while((len=bis.read(buffer))!=-1){
									bos.write(buffer,0,len);
								}
							}	*/
		
						
						
						//保存到数据库
						if(proId!=null&&delId!=null){						
						pro.setHomepage(del.getCode()+"/"+pro.getCode()+"/homepage/main.html");
						pro.setSafepage(del.getCode()+"/"+pro.getCode()+"/safepage/safe.html");	
						pro.setGrCode(del.getCode()+"/"+pro.getCode()+"/"+"wx.png");
						}										
						try {				
							DeCompressUtil.deCompress(uploadedFile.getPath(), unpath);			
							p.updatePro(pro);
						} catch (Exception e) {
							e.printStackTrace();
						}
//						AntZip.unzip(uploadedFile.getPath(), unpath);//解压
					}
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
		
	}

	private void setStatusMsg(HttpServletRequest request, int error,
			String message) {
		HttpSession session = request.getSession();
		UploadState state = (UploadState) session.getAttribute("upstate");
		state.setState(error);
		state.setErrormsg(message);
		}
	public Integer getDelId() {
		return delId;
	}

	@Override
	public void init() throws ServletException {

		super.init();
		ApplicationContext	 applicationContext = WebApplicationContextUtils.getRequiredWebApplicationContext(this.getServletContext()); 
		p=(ProjectService) applicationContext.getBean("ProjectService");
		
	}
	
	public void setDelId(Integer delId) {
		this.delId = delId;
	}

	public Integer getProId() {
		return proId;
	}

	public void setProId(Integer proId) {
		this.proId = proId;
	}
	
	
	
	
}
