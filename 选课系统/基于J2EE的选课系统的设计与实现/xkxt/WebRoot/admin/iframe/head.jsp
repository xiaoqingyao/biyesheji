<%@ page language="java" import="java.util.*,com.util.*"  contentType="text/html;charset=gb2312"%>
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String dir=sn.getDir();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<STYLE type=text/css>BODY {
	SCROLLBAR-FACE-COLOR: #73a2d6; SCROLLBAR-HIGHLIGHT-COLOR: #73a2d6; SCROLLBAR-SHADOW-COLOR: #73a2d6; SCROLLBAR-3DLIGHT-COLOR: #73a2d6; SCROLLBAR-ARROW-COLOR: #ffffff; SCROLLBAR-TRACK-COLOR: #aabfec; SCROLLBAR-DARKSHADOW-COLOR: #73a2d6
}
.logo {
	FONT-WEIGHT: bold; FONT-SIZE: 36px; COLOR: #73a2d6; FONT-FAMILY: Georgia, "Times New Roman", Times, serif
}
.font_text {
	FONT-SIZE: 12px; COLOR: #ffffff; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
.font_nav_active {
	FONT-WEIGHT: bold; FONT-SIZE: 14px; BACKGROUND-IMAGE: url(images/topnav_active.jpg); COLOR: #ffffff; LINE-HEIGHT: 20px; HEIGHT: 31px; TEXT-DECORATION: none
}
.font_nav_unactive {
	BORDER-RIGHT: 0px solid; BORDER-TOP: #adbbc7 1px solid; FONT-WEIGHT: bold; FONT-SIZE: 14px; BORDER-LEFT: 0px solid; CURSOR: hand; COLOR: #436e9d; LINE-HEIGHT: 20px; BORDER-BOTTOM: #5085c5 1px solid; HEIGHT: 27px; BACKGROUND-COLOR: #f6f8f9; TEXT-DECORATION: none
}
.br_nav {
	BORDER-RIGHT: 0px solid; BORDER-TOP: #adbbc7 1px solid; FONT-SIZE: 14px; BORDER-LEFT: 0px solid; CURSOR: hand; COLOR: #436e9d; LINE-HEIGHT: 20px; BORDER-BOTTOM: #5085c5 1px solid; HEIGHT: 27px; BACKGROUND-COLOR: #f6f8f9; TEXT-DECORATION: none
}
A.white:link {
	FONT-WEIGHT: bold; FONT-SIZE: 13px; COLOR: #ffffff; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A.white:active {
	FONT-WEIGHT: bold; FONT-SIZE: 13px; COLOR: #ffffff; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A.white:visited {
	FONT-WEIGHT: bold; FONT-SIZE: 13px; COLOR: #ffffff; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A.white:hover {
	FONT-WEIGHT: bold; FONT-SIZE: 13px; COLOR: #ffffff; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
.button {
	BORDER-RIGHT: #436e9d 1px double; BORDER-TOP: #436e9d 1px double; FONT-SIZE: 12px; BACKGROUND-IMAGE: url(images/bg.gif); BORDER-LEFT: #436e9d 1px double; CURSOR: hand; COLOR: #333333; LINE-HEIGHT: 16px; BORDER-BOTTOM: #436e9d 1px double; TEXT-DECORATION: none
}
A:link {
	FONT-SIZE: 12px; COLOR: #666666; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A:active {
	FONT-SIZE: 12px; COLOR: #666666; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A:visited {
	FONT-SIZE: 12px; COLOR: #666666; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A:hover {
	FONT-SIZE: 12px; COLOR: #f29422; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A.blue:link {
	FONT-SIZE: 12px; COLOR: #ffffff; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A.blue:active {
	FONT-SIZE: 12px; COLOR: #73a2d6; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A.blue:visited {
	FONT-SIZE: 12px; COLOR: #ffffff; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A.blue:hover {
	FONT-SIZE: 12px; COLOR: #73a2d6; LINE-HEIGHT: 20px; TEXT-DECORATION: underline
}
</STYLE>
<SCRIPT language=javascript>		
function out(src){
	if(confirm("确定要退出吗？"))	{
		return true;	
	}
	return false;
}
</SCRIPT>
<SCRIPT language=JavaScript src="<%=basePath %><%=dir %>/Common.js"></SCRIPT>
<SCRIPT language=JavaScript src="<%=basePath %><%=dir %>/images/SetFocus.js"></SCRIPT>
<META content="MSHTML 6.00.2900.3243" name=GENERATOR>
</HEAD>
<%
	String username=(String)session.getAttribute("user");
	if(username==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{
	    List list = sn.getSiteInfo();
	    String str = list.get(0).toString();
%>
 
<BODY bgcolor=#FFFFDF leftMargin=0 topMargin=0 scroll=no marginheight="0" marginwidth="0">
  
            <TABLE width="100%" border=0>
              <TBODY>
              <TR>
                <TD align=center class=font_text width="100%"><strong><font color=black>毕业设计选题系统</font></strong></TD>
              </TR>
              <TR>
                <TD align=center class=font_text width="100%">
                   
                  <%if(username.equals("admin")){ %> 
               [<a   href="<%=basePath %><%=dir %>/stu/index.jsp" target="MainFrame">学生管理</a>]
               [<a   href="<%=basePath %><%=dir %>/stu/add.jsp?method=addStu" target="MainFrame">增加学生</a>]
               [<a   href="<%=basePath %><%=dir %>/js/index.jsp" target="MainFrame">教师管理</a>]
               [<a   href="<%=basePath %><%=dir %>/js/add.jsp?method=addJs" target="MainFrame">增加教师</a>]
               
               [<a   href="<%=basePath %><%=dir %>/xx/sh.jsp" target="MainFrame">课题管理<a>] 
               [<a   href="<%=basePath %><%=dir %>/xx/add.jsp?method=addXx" target="MainFrame">发布课题<a>] 
               [<a   href="<%=basePath %><%=dir %>/xx/xsxk.jsp" target="MainFrame">学生选课信息<a>] 
               
               [<a   href="<%=basePath %><%=dir %>/aff/index.jsp" target="MainFrame">公告管理<a>] 
               [<a   href="<%=basePath %><%=dir %>/aff/add.jsp?method=addAff" target="MainFrame">发布公告<a>] 
               [<a   href="<%=basePath %><%=dir %>/xbbj/xb.jsp" target="MainFrame">系部管理<a>] 
               [<a   href="<%=basePath %><%=dir %>/xbbj/bj.jsp" target="MainFrame">班级管理<a>] 
               [<a   href="<%=basePath %><%=dir %>/system/user.jsp" target="MainFrame">教务员管理<a>]
                  [<A  href="<%=path%>/<%=dir %>/system/editpwd.jsp" target="MainFrame">修改密码</A>] 
                  <%}else{ %>
                  [<a   href="<%=basePath %><%=dir %>/js/gr.jsp" target="MainFrame">个人信息</a>] 
                   [<a   href="<%=basePath %><%=dir %>/xx/index.jsp" target="MainFrame">课题管理<a>] 
               [<a   href="<%=basePath %><%=dir %>/xx/add.jsp?method=addXx" target="MainFrame">发布课题<a>] 
                  [<A  href="<%=path%>/<%=dir %>/js/editpwd.jsp" target="MainFrame">修改密码</A>] 
                  [<a   href="<%=basePath %><%=dir %>/xx/xsxk.jsp" target="MainFrame">学生选课信息<a>] 
                  
                  <%} %>
                  [<A  onclick="return out(this)" href="<%=path%>/Admin.shtml?method=exit" target=_top>安全退出</A>] 
                  
    </TD></TR></TBODY></TABLE> 

</BODY>
<%		
	}
%>    
</HTML>
