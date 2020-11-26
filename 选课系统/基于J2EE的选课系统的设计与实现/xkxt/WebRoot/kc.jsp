<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%>
<%@ include file="iframe/head.jsp" %>

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
	String username2=(String)session.getAttribute("id");
	if(username2==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{
		
%>
<BODY >
<form action="<%=basePath %>ComServlet?method=stuXk" name="form1" method=post >
<table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
     <tr class="head"> 
      <td width="5%" align="center">ID </td>
      <td  align="center">课程名</td> 
      <td  align="center">班级</td>
      <td  align="center">学时</td>
      <td  align="center">课程简介</td>
      <td  align="center">上课地点</td>
      <td  align="center">上课时间</td>
      <td  align="center">上课教师</td> 
    </tr>
    <%	String bj=cb.getString("select zy from stu where id='"+username2+"'");
			List pagelist3=cb.getCom("select * from course where zy='"+bj+"' order by id desc",8);	
				if(!pagelist3.isEmpty()){
				for(int i=0;i<pagelist3.size();i++){
					List pagelist2 =(ArrayList)pagelist3.get(i); 
			%> 
	<tr  class="trA" onMouseOver="this.className='trB'" onMouseOut="this.className='trA'"> 
      <td width='5%' align="center" style="border-bottom:1px dotted #ccc;"><%=i+1 %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(1).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(2).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(3).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(4).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(5).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(6).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=cb.getString("select realname from teacher where username='"+pagelist2.get(7).toString()+"'") %></td>
      
    </tr>
	
<%
	}}
%>  
 
</TABLE>
</form>
<%} %>
<%@ include file="iframe/foot.jsp"%>