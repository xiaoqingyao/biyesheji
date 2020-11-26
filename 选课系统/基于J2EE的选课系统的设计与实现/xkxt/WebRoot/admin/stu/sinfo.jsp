<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%>
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String dir=sn.getDir();
%>
<HTML><HEAD><TITLE>后台操作区</TITLE>
<LINK href="<%=basePath %><%=dir %>/images/Admin_Style.css" type=text/css rel=stylesheet>
<LINK href="<%=basePath %><%=dir %>/images/style.css" type=text/css rel=stylesheet>
<STYLE type=text/css>
BODY {
	MARGIN-LEFT: 0px; BACKGROUND-COLOR: #ffffff
}
.STYLE1 {color: #ECE9D8}
</STYLE>
</HEAD>
<script type="text/javascript">
function sub()
{//xm ,	mm,xb,email,dh,nl,zy,bj,
	if(document.form1.xm.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.form1.mm.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.form1.email.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.form1.dh.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.form1.nl.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.form1.zy.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.form1.bj.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("所有项目必须填写！");
		//document.form1.title.focus();
		return false;
	}
	 
	form1.submit();
}
</script>
<%
String message = (String)request.getAttribute("message");
	if(message == null){
		message = "";
	}
	if (!message.trim().equals("")){
		out.println("<script language='javascript'>");
		out.println("alert('"+message+"');");
		out.println("</script>");
	}
	request.removeAttribute("message");
%>
<%
	String username=(String)session.getAttribute("user");
	if(username==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{
		String xh=request.getParameter("xh");
		String id="";
		String xm = "";	
		String mm="";
		String xb="";String email="";String dh="";String nl="";String zy="";String bj="";
		
			List listt = cb.get1Com("select * from stu where id='"+xh+"'",9);
			xm=listt.get(1).toString();
			mm=listt.get(2).toString();
			xb=listt.get(3).toString();email=listt.get(4).toString();
			dh=listt.get(5).toString();
			nl=listt.get(6).toString();
			zy=listt.get(7).toString();
			bj=listt.get(8).toString();
	 
		
%>
<BODY >
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align="left" vAlign=top > 
<table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
 
	 <tr bgcolor='#FFFFFF'> 
    <td width='45%'><div align="right">学生学号：</div></td>
    <td ><%=xh %></td>
  </tr>
  <tr bgcolor='#FFFFFF'> 
    <td width='45%'><div align="right">学生姓名：</div></td>
    <td ><%=xm %></td>
  </tr>
  <tr bgcolor='#FFFFFF'>  
    <td width='45%'><div align="right">登录密码：</div></td>
    <td ><%=mm %></td>
  </tr>
  <tr bgcolor='#FFFFFF'>  
    <td width='45%'><div align="right">性别：</div></td>
    <td ><%=xb %></td>
  </tr>
  <tr bgcolor='#FFFFFF'>  
    <td width='45%'><div align="right">email：</div></td>
    <td ><%=email %></td>
  </tr>
  <tr bgcolor='#FFFFFF'>  
    <td width='45%'><div align="right">移动电话：</div></td>
    <td ><%=dh %></td>
  </tr>
  <tr bgcolor='#FFFFFF'>  
    <td width='45%'><div align="right">身份证号：</div></td>
    <td><%=nl %></td>
  </tr>
  <tr bgcolor='#FFFFFF'>  
    <td width='30%'><div align="right">班级：</div></td>
    <td><%=zy %></td>
  </tr>
  <tr bgcolor='#FFFFFF'>  
    <td width='45%'><div align="right">通信地址：</div></td>
    <td><%=bj %></td>
  </tr>
</table>
   </TD>
	</TR>
  </TBODY>
</TABLE>

</BODY>
<%} %>
</HTML>
