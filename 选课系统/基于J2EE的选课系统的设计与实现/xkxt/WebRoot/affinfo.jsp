<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%>
<%@ include file="iframe/head.jsp" %>
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
 
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
	String username2=(String)session.getAttribute("id");
	if(username2==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{
		 
		 
		String id = request.getParameter("id");	
			 
			List listt = cb.get1Com("select * from aff where id='"+id+"'",5); 
%>
 
 
<table width='100%' cellspacing='0' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
<tr bgcolor='#FFFFFF'>  
    <td width='45%'><div align="right">公告标题：</div></td>
    <td ><%=listt.get(1).toString() %></td>
  </tr>
  <tr bgcolor='#FFFFFF'> 
    <td width='45%'><div align="right">公告内容：</div></td>
    <td ><%=listt.get(2).toString() %></td>
  </tr>
  <tr bgcolor='#FFFFFF'>  
    <td width='45%'><div align="right">发布时间：</div></td>
    <td ><%=listt.get(3).toString() %></td>
  </tr>
  <tr bgcolor='#FFFFFF'>  
    <td width='45%'><div align="right">发布人：</div></td>
    <td ><%=listt.get(4).toString() %></td>
  </tr>
</table>	 
 
 
<%} %>
 
<%@ include file="iframe/foot.jsp"%>