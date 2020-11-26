package com.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ComBean;
import com.bean.SystemBean;
//import com.sun.org.apache.xalan.internal.xsltc.dom.Filter;
import com.util.Constant;
import com.util.SmartFile;
import com.util.SmartUpload;

public class UploadServlet extends HttpServlet {
	private ServletConfig config;
	/**
	 * Constructor of the object.
	 */
	public UploadServlet() {
		super();
	}
	final public void init(ServletConfig config) throws ServletException
    {
        this.config = config;  
    }

    final public ServletConfig getServletConfig()
    {
        return config;
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

		doPost(request,response);
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

		request.setCharacterEncoding(Constant.CHARACTERENCODING);
		response.setContentType(Constant.CONTENTTYPE);
		String sysdir = new SystemBean().getDir();
		HttpSession session = request.getSession();
		ComBean cb=new ComBean();
				 String method = null;
				 String date2=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
				 
				 SmartUpload mySmartUpload = new SmartUpload();//init
				 int count = 0;
				 try{
					 mySmartUpload.initialize(config,request,response);
		             mySmartUpload.upload(); 
		             method = mySmartUpload.getRequest().getParameter("method").trim();
		            if(method.equals("scFile")){ 
		            	String mc = mySmartUpload.getRequest().getParameter("mc");
						 String teacher=(String)session.getAttribute("user");
							SmartFile file = mySmartUpload.getFiles().getFile(0);
			            	String fileExt=file.getFileExt();	            
			            	String path="/jc";
		                    count = mySmartUpload.save(path);
		                    String adder=(String)session.getAttribute("user"); 
		                    	int flag = cb.comUp("insert into files(mc,url,teacher,sj) values('"+mc+"','"+path+"/"+file.getFileName()+"','"+teacher+"','"+date2+"')");
								if(flag == Constant.SUCCESS){
									request.setAttribute("message", "操作成功！");
									request.getRequestDispatcher(sysdir+"/js/sc.jsp").forward(request, response);
								}
								else{
									request.setAttribute("message", "系统维护中，请稍后再试！");
									request.getRequestDispatcher(sysdir+"/js/sc.jsp").forward(request, response);
								}
							
		            }
		            else  if(method.equals("stuFile")){ 
		            	String mc = mySmartUpload.getRequest().getParameter("mc");
						 String stu=(String)session.getAttribute("id");
							SmartFile file = mySmartUpload.getFiles().getFile(0);
			            	String fileExt=file.getFileExt();	            
			            	String path="/jc";
		                    count = mySmartUpload.save(path);
		                    String adder=(String)session.getAttribute("user"); 
		                    	int flag = cb.comUp("insert into store(mc,url,stu,sj) values('"+mc+"','"+path+"/"+file.getFileName()+"','"+stu+"','"+date2+"')");
								if(flag == Constant.SUCCESS){
									request.setAttribute("message", "操作成功！");
									request.getRequestDispatcher("cc.jsp").forward(request, response);
								}
								else{
									request.setAttribute("message", "系统维护中，请稍后再试！");
									request.getRequestDispatcher("cc.jsp").forward(request, response);
								}
							
		            }
		            else{
		            	request.getRequestDispatcher("error.jsp").forward(request, response);
		            }
		        }catch(Exception ex){
		        	ex.printStackTrace();
		        	request.getRequestDispatcher("error.jsp").forward(request, response);
		        }
	
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occure
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
