package com.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ComBean;
import com.util.Constant;

public class ComServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ComServlet() {
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

		response.setContentType(Constant.CONTENTTYPE);
		request.setCharacterEncoding(Constant.CHARACTERENCODING);
		HttpSession session = request.getSession();
		ComBean cBean = new ComBean();
		String date2=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		String method = request.getParameter("method");
		if(method.equals("addJs")){  //add teacher
			 String username = request.getParameter("username");
			 String password = request.getParameter("password");
			 String realname = request.getParameter("realname");
			 String email = request.getParameter("email");
			 String zc = request.getParameter("zc");
			 String nl = request.getParameter("nl");
			 String zy = request.getParameter("zy");
			 String dw = request.getParameter("dw");
			 String cf=cBean.getString("select * from teacher where username='"+username+"'");
			 if(cf==null){
				 int flag = cBean.comUp("insert into teacher(username, password, realname,email,zc,nl,zy,dw,ifuse) " +
							"values('"+username+"', '"+password+"', '"+realname+"',	'"+email+"','"+zc+"','"+nl+"','"+zy+"','"+dw+"', '在用')");
					if(flag == Constant.SUCCESS){ 
						request.setAttribute("message", "操作成功！");
						request.getRequestDispatcher("admin/js/index.jsp").forward(request, response); 
					}
					else { 
						request.setAttribute("message", "操作失败！");
						request.getRequestDispatcher("admin/js/index.jsp").forward(request, response); 
					}
			 }
			 else{
				 request.setAttribute("message", "登录名重复！");
					request.getRequestDispatcher("admin/js/index.jsp").forward(request, response); 
			 }
		}
		else if(method.equals("upJs")){ ///update teacher
			String id = request.getParameter("id");
			 String username = request.getParameter("username");
			 String password = request.getParameter("password");
			 String realname = request.getParameter("realname");
			 String email = request.getParameter("email");
			 String zc = request.getParameter("zc");
			 String nl = request.getParameter("nl");
			 String zy = request.getParameter("zy");
			 String dw = request.getParameter("dw");
			int flag = cBean.comUp("update teacher set username='"+username+"', password='"+password+"', realname='"+realname+"',	email='"+email+"'," +
					"zc='"+zc+"',nl='"+nl+"',zy='"+zy+"',dw='"+dw+"'  where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/js/index.jsp").forward(request, response); 
			}
			else if(flag == Constant.NAME_ERROR){ 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/js/index.jsp").forward(request, response); 
			}
		}
		else if(method.equals("delJs")){  //del teacher
			String id = request.getParameter("id");
			int flag = cBean.comUp("delete from teacher where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/js/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/js/index.jsp").forward(request, response); 
			}
		}
		else if(method.equals("ifJs")){ 
			String id = request.getParameter("id"); 
			 String ifuse = cBean.getString("select ifuse from teacher where id='"+id+"'"); 
			 String sql="update teacher set ifuse='在用' where id='"+id+"'";
			 if(ifuse.equals("在用"))sql="update teacher set ifuse='停用' where id='"+id+"'";
			int flag = cBean.comUp(sql);
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/js/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/js/index.jsp").forward(request, response); 
			}
		}
		else if(method.equals("upMM")){ //update password
			String username=(String)session.getAttribute("user");
			String password = request.getParameter("oldpwd"); 
			String newpwd = request.getParameter("newpwd"); 
			 String sql="select * from teacher where username='"+username+"'";
			 
			 List mlist=cBean.get1Com(sql, 6);System.out.println(mlist.get(2).toString());
			 if(mlist.get(2).toString().equals(password)){
				 int flag = cBean.comUp("update teacher set password='"+newpwd+"' where  username='"+username+"'");
				 if(flag == Constant.SUCCESS){ 
						request.setAttribute("message", "操作成功！");
						request.getRequestDispatcher("admin/js/editpwd.jsp").forward(request, response); 
					}
					else { 
						request.setAttribute("message", "操作失败！");
						request.getRequestDispatcher("admin/js/editpwd.jsp").forward(request, response); 
					}
			 }
			 else{
				 request.setAttribute("message", "原始密码错误！");
					request.getRequestDispatcher("admin/js/editpwd.jsp").forward(request, response); 
			 }	
		}
		else if(method.equals("jsUp")){ ///update teacher
			String id = request.getParameter("id");
			 String username = request.getParameter("username");
			 String password = request.getParameter("password");
			 String realname = request.getParameter("realname");
			 String email = request.getParameter("email");
			 String zc = request.getParameter("zc");
			 String nl = request.getParameter("nl");
			 String zy = request.getParameter("zy");
			 String dw = request.getParameter("dw");
			 String sql="update teacher set username='"+username+"', password='"+password+"', realname='"+realname+"',	email='"+email+"'," +
				"zc='"+zc+"',nl='"+nl+"',zy='"+zy+"',dw='"+dw+"'  where id='"+id+"'";
			  
			int flag = cBean.comUp(sql);
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/js/gr.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/js/gr.jsp").forward(request, response); 
			}
		}
		
		
		
		
		
		
		else if(method.equals("addStu")){  //add addStu
			 String xm = request.getParameter("xm");
			 String mm = request.getParameter("mm");
			 String xb = request.getParameter("xb");
			 String email = request.getParameter("email");
			 String dh = request.getParameter("dh");
			 String nl = request.getParameter("nl");
			 String zy = request.getParameter("zy");//
			 String bj = request.getParameter("bj"); 
			 String zdjs = request.getParameter("zdjs"); 
			 // rws,ifrws,ktbg,ifktbg,lw,iflw,db
				 int flag = cBean.comUp("insert into stu(xm ,mm,xb,email,dh,nl,zy,bj,zdjs ) " +
							"values('"+xm+"', '"+mm+"', '"+xb+"',	'"+email+"','"+dh+"','"+nl+"','"+zy+"','"+bj+"','"+zdjs+"')");
					if(flag == Constant.SUCCESS){ 
						request.setAttribute("message", "操作成功！");
						request.getRequestDispatcher("admin/stu/index.jsp").forward(request, response); 
					}
					else { 
						request.setAttribute("message", "操作失败！");
						request.getRequestDispatcher("admin/stu/index.jsp").forward(request, response); 
					}
			 
		}
		else if(method.equals("upStu")){ ///update teacher
			String id = request.getParameter("id");
			String xm = request.getParameter("xm");
			 String mm = request.getParameter("mm");
			 String xb = request.getParameter("xb");
			 String email = request.getParameter("email");
			 String dh = request.getParameter("dh");
			 String nl = request.getParameter("nl");
			 String zy = request.getParameter("zy");
			 String bj = request.getParameter("bj");  
			 String zdjs=request.getParameter("zdjs");
			int flag = cBean.comUp("update stu set xm='"+xm+"', mm='"+mm+"', xb='"+xb+"',	email='"+email+"'," +
					"dh='"+dh+"',nl='"+nl+"',zy='"+zy+"',bj='"+bj+"',zdjs='"+zdjs+"' where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/stu/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/stu/index.jsp").forward(request, response); 
			}
		}
		else if(method.equals("delStu")){  //del teacher
			String id = request.getParameter("id");
			int flag = cBean.comUp("delete from stu where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/stu/index.jsp").forward(request, response); 
			}
			else  { 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/stu/index.jsp").forward(request, response); 
			}
		}
		
		
		
		
		else if(method.equals("stuLogin")){  //del teacher
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			List slist=cBean.get1Com("select * from stu where id='"+username+"' and mm='"+password+"'", 3);
			if(!slist.isEmpty()){ 
				session.setAttribute("id", username);
				request.getRequestDispatcher("stu.jsp").forward(request, response); 
			}
			else{ 
				request.setAttribute("message", "登录信息错误！");
				request.getRequestDispatcher("index.jsp").forward(request, response); 
			}
		}
		else if(method.equals("stuExit")){  //del teacher
			 
				 session.removeAttribute("id");
				request.getRequestDispatcher("index.jsp").forward(request, response); 
			 
		}
		else if(method.equals("stuUp")){ ///update teacher
			String id = request.getParameter("id");
			String xm = request.getParameter("xm");
			 String mm = request.getParameter("mm");
			 String xb = request.getParameter("xb");
			 String email = request.getParameter("email");
			 String dh = request.getParameter("dh");
			 String nl = request.getParameter("nl");
			 String zy = request.getParameter("zy");
			 String bj = request.getParameter("bj"); 
			int flag = cBean.comUp("update stu set xm='"+xm+"', mm='"+mm+"', xb='"+xb+"',	email='"+email+"'," +
					"dh='"+dh+"',nl='"+nl+"',zy='"+zy+"',bj='"+bj+"'  where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("stu.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("stu.jsp").forward(request, response); 
			}
		}
		
		
		
		else if(method.equals("addGg")){   
			String content = request.getParameter("content");
			int flag = cBean.comUp("insert into gg(content,sj) values('"+content+"','"+date2+"')");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/gg/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/gg/index.jsp").forward(request, response); 
			}
		}
		else if(method.equals("delGg")){   
			String id = request.getParameter("id");
			int flag = cBean.comUp("delete from gg where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/gg/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/gg/index.jsp").forward(request, response); 
			}
		}
		
		
		
		
		
		else if(method.equals("addKc")){  //add teacher
			 String kcm = request.getParameter("kcm");
			 String zy = request.getParameter("zy");
			 String xs = request.getParameter("xs");
			 String xz = request.getParameter("xz");
			 String dd = request.getParameter("dd");
			 String sj = request.getParameter("sj");
			 String js = request.getParameter("js"); 
			 // rws,ifrws,ktbg,ifktbg,lw,iflw,db
				 int flag = cBean.comUp("insert into course(kcm,zy, xs, xz, dd, sj, js) " +
							"values('"+kcm+"', '"+zy+"', '"+xs+"',	'"+xz+"','"+dd+"','"+sj+"','"+js+"' )");
					if(flag == Constant.SUCCESS){ 
						request.setAttribute("message", "操作成功！");
						request.getRequestDispatcher("admin/kc/index.jsp").forward(request, response); 
					}
					else { 
						request.setAttribute("message", "操作失败！");
						request.getRequestDispatcher("admin/kc/index.jsp").forward(request, response); 
					}
			 
		}
		else if(method.equals("upKc")){ ///update teacher
			String id = request.getParameter("id");
			String kcm = request.getParameter("kcm");
			 String zy = request.getParameter("zy");
			 String xs = request.getParameter("xs");
			 String xz = request.getParameter("xz");
			 String dd = request.getParameter("dd");
			 String sj = request.getParameter("sj");
			 String js = request.getParameter("js");  
			int flag = cBean.comUp("update course set kcm='"+kcm+"', zy='"+zy+"', xs='"+xs+"',	xz='"+xz+"'," +
					"dd='"+dd+"',sj='"+sj+"',js='"+js+"' where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/kc/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/kc/index.jsp").forward(request, response); 
			}
		}
		else if(method.equals("delKc")){  //del teacher
			String id = request.getParameter("id");
			int flag = cBean.comUp("delete from course where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/kc/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/kc/index.jsp").forward(request, response); 
			}
		}
		else if(method.equals("jsDelFile")){  //del teacher
			String id = request.getParameter("id");
			int flag = cBean.comUp("delete from files where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/js/sc.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/js/sc.jsp").forward(request, response); 
			}
		}
		else if(method.equals("stuDelFile")){  //del teacher
			String id = request.getParameter("id");
			int flag = cBean.comUp("delete from store where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("cc.jsp").forward(request, response); 
			}
			else{ 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("cc.jsp").forward(request, response); 
			}
		}
		
		
		else if(method.equals("stuXk")){
			String check[] = request.getParameterValues("checkit");
			String stu=(String)session.getAttribute("id");
			if(check == null){
				request.setAttribute("message", "请选择课程！");
				request.getRequestDispatcher("kc.jsp").forward(request, response);
			}
			else{
				String str="";
				int id[]= new int[check.length];
				for(int i = 0;i<check.length;i++){
					String ss=check[i];
					int flag = cBean.comUp("insert into xk(cid,stu) values('"+ss+"','"+stu+"')");
				}
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("kc.jsp").forward(request, response); 
			}
		}
		else if(method.equals("stuTxk")){  //del teacher
			String id = request.getParameter("id");
			int flag = cBean.comUp("delete from xk where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("xk.jsp").forward(request, response); 
			}
			else{ 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("xk.jsp").forward(request, response); 
			}
		}
		else if(method.equals("tdelXk")){  //del teacher
//			String cid = request.getParameter("cid");
//			String stu = request.getParameter("stu");
//			int flag = cBean.comUp("delete from xk where cid='"+cid+"' and stu='"+stu+"'");
			String id=request.getParameter("id");
			int flag = cBean.comUp("delete from xk where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/xk/index.jsp").forward(request, response); 
			}
			else{ 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/xk/index.jsp").forward(request, response); 
			}
		}
		else if(method.equals("lrCj")){  //del teacher
			String sid = request.getParameter("sid");
			String kc = request.getParameter("kc");
			String xq = request.getParameter("xq");
			String cj = request.getParameter("cj");
			String js = (String)session.getAttribute("user");
			String str=cBean.getString("select cj from cj where stu='"+sid+"' and cid='"+kc+"' ");
			if(str==null){
				int flag = cBean.comUp("insert into cj(cid,stu,cj,js,xq) values('"+kc+"','"+sid+"','"+cj+"','"+js+"','"+xq+"')");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/s/lr.jsp").forward(request, response); 
				}
				else{ 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/s/lr.jsp").forward(request, response); 
				}
			}
			else{ 
				request.setAttribute("message", "该学生已经录入该课程成绩！");
				request.getRequestDispatcher("admin/s/lr.jsp").forward(request, response); 
			}
		}
		else if(method.equals("upCj")){  //del teacher
			String id = request.getParameter("id");
			String sid = request.getParameter("sid");
			String kc = request.getParameter("kc");
			String xq = request.getParameter("xq");
			String cj = request.getParameter("cj");
			String js = (String)session.getAttribute("user");
			String str=cBean.getString("select cj from cj where stu='"+sid+"' and cid='"+kc+"'  and id!='"+id+"'");
			if(str==null){ 
			 
				int flag = cBean.comUp("update cj set cid='"+kc+"',stu='"+sid+"',cj='"+cj+"',js='"+js+"',xq='"+xq+"'  where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/s/ck.jsp").forward(request, response); 
				}
				else{ 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/s/ck.jsp").forward(request, response); 
				}
			}
				else{ 
					request.setAttribute("message", "该学生已经录入该课程成绩！");
					request.getRequestDispatcher("admin/s/lr.jsp").forward(request, response); 
				}
		}
		else if(method.equals("delCj")){   
			String id=request.getParameter("id");
			int flag = cBean.comUp("delete from cj where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/s/ck.jsp").forward(request, response); 
			}
			else{ 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/s/ck.jsp").forward(request, response); 
			}
		}
		else if(method.equals("AdmindelCj")){   
			String id=request.getParameter("id");
			int flag = cBean.comUp("delete from cj where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/gg/index.jsp").forward(request, response); 
			}
			else{ 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/gg/index.jsp").forward(request, response); 
			}
		}
		
		else if(method.equals("eK")){   
			String id=request.getParameter("id");
			int flag = cBean.comUp("update  cj set rk='是' where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/tj/bk.jsp").forward(request, response); 
			}
			else{ 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/tj/bk.jsp").forward(request, response); 
			}
		}
		else if(method.equals("qX")){   
			String id=request.getParameter("id");
			int flag = cBean.comUp("update  cj set rk='否' where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/tj/ek.jsp").forward(request, response); 
			}
			else{ 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/tj/ek.jsp").forward(request, response); 
			}
		}
		
		else if(method.equals("jJ")){   
			String id=request.getParameter("id");
			String sql="update  stu set jj='是' where id='"+id+"'";
			String str=cBean.getString("select jj from stu where id='"+id+"'");
			if(str.equals("是"))sql="update  stu set jj='否' where id='"+id+"'";
			int flag = cBean.comUp(sql);
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/tj/index.jsp").forward(request, response); 
			}
			else{ 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/tj/index.jsp").forward(request, response); 
			}
		}
		
		
		else if(method.equals("addXb")){   
			String xb=request.getParameter("xb");
			int flag = cBean.comUp("insert into xb(xb) values('"+xb+"')");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/xbbj/xb.jsp").forward(request, response); 
			}
			else{ 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/xbbj/xb.jsp").forward(request, response); 
			}
		}
		else if(method.equals("delXb")){   
			String id=request.getParameter("id");
			int flag = cBean.comUp("delete from xb where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/xbbj/xb.jsp").forward(request, response); 
			}
			else{ 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/xbbj/xb.jsp").forward(request, response); 
			}
		}
		else if(method.equals("addBj")){   
			String bj=request.getParameter("bj");
			int flag = cBean.comUp("insert into bj(bj) values('"+bj+"')");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/xbbj/bj.jsp").forward(request, response); 
			}
			else{ 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/xbbj/bj.jsp").forward(request, response); 
			}
		}
		else if(method.equals("delBj")){   
			String id=request.getParameter("id");
			int flag = cBean.comUp("delete from bj where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/xbbj/bj.jsp").forward(request, response); 
			}
			else{ 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/xbbj/bj.jsp").forward(request, response); 
			}
		}
		
		
		
		
		/////////////================================================================================================
		else if(method.equals("addXx")){  //添加课题
			 String kcm = request.getParameter("kcm");
			 String zy = request.getParameter("zy");
			 String xs = request.getParameter("xs");
			 String xz = request.getParameter("xz");
			 String dd = request.getParameter("dd");
			 String sj = request.getParameter("sj");
			 String js = request.getParameter("js"); 
			 String xkks = request.getParameter("xkks"); 
			 String xkjs = request.getParameter("xkjs"); 
			 // rws,ifrws,ktbg,ifktbg,lw,iflw,db
				 int flag = cBean.comUp("insert into xxk(kcm,zy, xs, xz, dd, sj, js,xkks,xkjs,zt) " +
							"values('"+kcm+"', '"+zy+"', '"+xs+"',	'"+xz+"','"+dd+"','"+sj+"','"+js+"','"+xkks+"','"+xkjs+"','未审核' )");
					if(flag == Constant.SUCCESS){ 
						request.setAttribute("message", "操作成功！");
						request.getRequestDispatcher("admin/xx/index.jsp").forward(request, response); 
					}
					else { 
						request.setAttribute("message", "操作失败！");
						request.getRequestDispatcher("admin/xx/index.jsp").forward(request, response); 
					}
			 
		}
		else if(method.equals("upXx")){ ///update teacher
			String id = request.getParameter("id");
			String kcm = request.getParameter("kcm");
			 String zy = request.getParameter("zy");
			 String xs = request.getParameter("xs");
			 String xz = request.getParameter("xz");
			 String dd = request.getParameter("dd");
			 String sj = request.getParameter("sj");
			 String js = request.getParameter("js");  
			 String xkks = request.getParameter("xkks"); 
			 String xkjs = request.getParameter("xkjs"); 
			int flag = cBean.comUp("update xxk set kcm='"+kcm+"', zy='"+zy+"', xs='"+xs+"',	xz='"+xz+"'," +
					"dd='"+dd+"',sj='"+sj+"',js='"+js+"',xkks='"+xkks+"',xkjs='"+xkjs+"' where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/xx/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/xx/index.jsp").forward(request, response); 
			}
		}
		else if(method.equals("delXx")){  //del teacher
			String id = request.getParameter("id");
			int flag = cBean.comUp("delete from xxk where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/xx/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/xx/index.jsp").forward(request, response); 
			}
		}
		else if(method.equals("shlXx")){  //审核课题
			String id = request.getParameter("id");
			int flag = cBean.comUp("update xxk set zt='已审核' where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/xx/sh.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/xx/sh.jsp").forward(request, response); 
			}
		}
		else if(method.equals("wyXk")){  //del teacher
			String xxid = request.getParameter("xxid");
			String stu=(String)session.getAttribute("id");
//			date2=date2+" "+"00:00:00";
//			String d3=date2+" "+"23:59:59";
			String str=cBean.getString("select id from xxk where xkks<='"+date2+"' and xkjs>='"+date2+"' order by id desc");
			if(str==null){
				request.setAttribute("message", "已经超过选课时间！");
				request.getRequestDispatcher("xxk.jsp").forward(request, response); 
			}
			else{
				String ss=cBean.getString("select id from xk where xxid='"+xxid+"' and stu='"+stu+"'");
				if(ss==null){
					int flag = cBean.comUp("insert into xk(xxid,stu,xf,cj) values('"+xxid+"','"+stu+"','0','0')");
					if(flag == Constant.SUCCESS){ 
						request.setAttribute("message", "操作成功！");
						request.getRequestDispatcher("xxk.jsp").forward(request, response); 
					}
					else { 
						request.setAttribute("message", "操作失败！");
						request.getRequestDispatcher("xxk.jsp").forward(request, response); 
					}
				}
				else { 
					request.setAttribute("message", "您已选择此课，请不要重复提交！");
					request.getRequestDispatcher("xxk.jsp").forward(request, response); 
				}
			}
		}
		else if(method.equals("wyTk")){  //del teacher
			String id = request.getParameter("id");
			int flag = cBean.comUp("delete from xk where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("xxy.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("xxy.jsp").forward(request, response); 
			}
		}
		
		
		else if(method.equals("lrXXCJ")){  //del teacher
			String id = request.getParameter("id");
			String xf = request.getParameter("xf");
			String cj = request.getParameter("cj");
			int flag = cBean.comUp("update xk set xf='"+xf+"',cj='"+cj+"' where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/xx/xsxk.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/xx/xsxk.jsp").forward(request, response); 
			}
		}
		else if(method.equals("scXk")){  //del teacher
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from xk where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/xx/xsxk.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/xx/xsxk.jsp").forward(request, response); 
			}
		}
		else if(method.equals("scXk2")){  //del teacher
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from xk where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/xx/xf.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/xx/xf.jsp").forward(request, response); 
			}
		}
		
		else if(method.equals("addAff")){  //del teacher
			String title = request.getParameter("title"); 
			String content = request.getParameter("content"); 
			String username=(String)session.getAttribute("user");
			int flag = cBean.comUp("insert into aff(title,content,addtime,adder) values('"+title+"','"+content+"','"+date2+"','"+username+"')");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/aff/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/aff/index.jsp").forward(request, response); 
			}
		}
		else if(method.equals("upAff")){  //del teacher
			String id = request.getParameter("id"); 
			String title = request.getParameter("title"); 
			String content = request.getParameter("content"); 
			String username=(String)session.getAttribute("user");
			int flag = cBean.comUp("update aff set title='"+title+"',content='"+content+"' where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/aff/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/aff/index.jsp").forward(request, response); 
			}
		}
		else if(method.equals("delAff")){  //del teacher
			String id = request.getParameter("id");  
			int flag = cBean.comUp("delete from  aff where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/aff/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/aff/index.jsp").forward(request, response); 
			}
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
