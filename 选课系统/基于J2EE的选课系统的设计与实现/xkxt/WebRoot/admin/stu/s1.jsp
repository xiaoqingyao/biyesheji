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
<SCRIPT language=JavaScript src="<%=basePath %><%=dir %>/images/Common.js"></SCRIPT>
<STYLE type=text/css>
BODY {
	MARGIN-LEFT: 0px; BACKGROUND-COLOR: #ffffff
}
.STYLE1 {color: #ECE9D8}
</STYLE>
</HEAD>
<script  language="javascript" >
function del()
{
	pageform.submit();
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
		
%>
<BODY >
<form action="<%=basePath %>Affiche.shtml?method=delaffiche" method="post" name="pageform">
<table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
     <tr class="head"> 
      <td width="5%" align="center">学号</td>
      <td  align="center">学生名</td>
      <td  align="center">性别</td>
      <td  align="center">email</td>
      <td  align="center">电话</td>
      <td  align="center">年龄</td>
      <td  align="center">专业方向</td>
      <td  align="center">班级</td>
      <td  align="center">任务书</td> 
      <td  align="center">开题报告</td> 
      <td  align="center">通过</td> 
      <td  align="center">论文</td> 
      <td  align="center">通过</td> 
      <td  align="center">答辩</td>   
    </tr>
    <%
			String type=request.getParameter("type");
			String sql="";
			if(Integer.parseInt(type)==1){
				sql="select * from stu where iflw='已通过' and db='未准许' order by id desc";
			}
			else if(Integer.parseInt(type)==2){
				sql="select * from stu where iflw='未通过' order by id desc";
			}else if(Integer.parseInt(type)==3){
				sql="select * from stu where db='已准许' order by id desc";
			}
			else{
				sql="select * from stu where db='未准许' order by id desc";
			}
			List pagelist3=cb.getCom(sql,16);	
				if(!pagelist3.isEmpty()){
				for(int i=0;i<pagelist3.size();i++){
					List pagelist2 =(ArrayList)pagelist3.get(i); 
			%> 
	<tr  class="trA" onMouseOver="this.className='trB'" onMouseOut="this.className='trA'"> 
      <td width='5%' align="center" style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(0).toString()  %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(1).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(3).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(4).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(5).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(6).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(7).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(8).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;">
      <%if(!pagelist2.get(10).toString().equals("未下发")){out.println("已下发");}else{out.println("未下发");} %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;">
      <%if(!pagelist2.get(11).toString().equals("未上交")){%>已上交<%}else{out.println("未上交");} %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;">
      <%if(!pagelist2.get(11).toString().equals("未上交")){%><%=pagelist2.get(12).toString() %>
      <%}else{out.println("未通过");} %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%if(!pagelist2.get(13).toString().equals("未上交")){%>
      已上交<%}else{out.println("未上交");} %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;">
	<%if(!pagelist2.get(13).toString().equals("未上交")){%><%=pagelist2.get(14).toString() %>
      <%}else{out.println("未通过");} %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;">
	  <%if(!pagelist2.get(14).toString().equals("未通过")){%><%=pagelist2.get(15).toString() %>
      <%}else{out.println("未准许");} %></td>
       
     </tr>
	
<%
	}}
%>  
 
	
	 
	 </TABLE></form>
</BODY>
<%} %>
</HTML>
