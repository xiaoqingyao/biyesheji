<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%>
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" /> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String dir=sn.getDir();
%>
<HTML><HEAD><TITLE>��̨������</TITLE>
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
		String stu=request.getParameter("id"); 
%>
<BODY oncontextmenu="return false;" onselectstart="return false;" leftMargin=0 
background=<%=basePath %><%=dir %>/images/MainBg.gif topMargin=0 scroll=no 
marginheight="0" marginwidth="0">
<TABLE  cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align="left" vAlign=top > 

    <%
    String sql="select * from xk where stu='"+stu+"' order by cj desc";
    //System.out.println(sql);
			List pagelist3=cb.getCom(sql,4);	
				if(!pagelist3.isEmpty()){
	%>
	<table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
     <tr class="head"> 
      <td width="5%" align="center">ѧ��</td>
      <td  align="center">ѧ����</td>
      <td  align="center">�Ա�</td>
      <td  align="center">email</td>
      <td  align="center">�ƶ��绰</td>
      <td  align="center">���֤��</td>
      <td  align="center">רҵ</td>
      <td  align="center">ͨ�ŵ�ַ</td>
      <td  align="center">�γ�</td>
      <td  align="center">�ɼ�</td> 
      <td  align="center">�ον�ʦ</td>  
      <td  align="center">ѧ������</td>   
    </tr>
	<%
				for(int i=0;i<pagelist3.size();i++){
					List pagelist2 =(ArrayList)pagelist3.get(i); 
			%> 
	<tr  class="trA" onMouseOver="this.className='trB'" onMouseOut="this.className='trA'"> 
      <td width='5%' align="center" style="border-bottom:1px dotted #ccc;"><%=i+1  %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=cb.getString("select xm from stu where id='"+pagelist2.get(2).toString()+"'")%></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=cb.getString("select xb from stu where id='"+pagelist2.get(2).toString()+"'")%></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=cb.getString("select email from stu where id='"+pagelist2.get(2).toString()+"'")%></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=cb.getString("select dh from stu where id='"+pagelist2.get(2).toString()+"'")%></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=cb.getString("select nl from stu where id='"+pagelist2.get(2).toString()+"'")%></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=cb.getString("select zy from stu where id='"+pagelist2.get(2).toString()+"'")%></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=cb.getString("select bj from stu where id='"+pagelist2.get(2).toString()+"'")%></td> 
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=cb.getString("select kcm from course where id='"+pagelist2.get(1).toString()+"'")%></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(3).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=cb.getString("select realname from teacher where username=(select js from course where id='"+pagelist2.get(1).toString()+"')")%></td>
	  <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=cb.getString("select count(*) from xk where cid='"+pagelist2.get(1).toString()+"'")%></td>
    </tr>
	
<%
	}}else{
%>  
<table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
     <tr class="head"> 
      <td width="5%" align="center">ѧ��</td>
      <td  align="center">ѧ����</td>
      <td  align="center">�Ա�</td>
      <td  align="center">email</td>
      <td  align="center">�ƶ��绰</td>
      <td  align="center">���֤��</td>
      <td  align="center">רҵ</td>
      <td  align="center">ͨ�ŵ�ַ</td> 
      <td  align="center">״̬</td>
    </tr>
    <%
			List slist=cb.getCom("select * from stu where id='"+stu+"' order by id desc",9);	
				if(!slist.isEmpty()){
				for(int i=0;i<slist.size();i++){
					List pagelist2 =(ArrayList)slist.get(i); 
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
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;">�޸���ѡ����Ϣ</td>
    </tr>
	
<%
	}}
%>  
 
	
	 
	 </TABLE>
<%} %> 
	 </TABLE> 
	</td>
	</tr>
 
  </TBODY>
</TABLE>
</BODY>
<%} %>
</HTML>
