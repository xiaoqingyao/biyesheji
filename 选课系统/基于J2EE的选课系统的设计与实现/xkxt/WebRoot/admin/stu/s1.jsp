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
		
%>
<BODY >
<form action="<%=basePath %>Affiche.shtml?method=delaffiche" method="post" name="pageform">
<table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
     <tr class="head"> 
      <td width="5%" align="center">ѧ��</td>
      <td  align="center">ѧ����</td>
      <td  align="center">�Ա�</td>
      <td  align="center">email</td>
      <td  align="center">�绰</td>
      <td  align="center">����</td>
      <td  align="center">רҵ����</td>
      <td  align="center">�༶</td>
      <td  align="center">������</td> 
      <td  align="center">���ⱨ��</td> 
      <td  align="center">ͨ��</td> 
      <td  align="center">����</td> 
      <td  align="center">ͨ��</td> 
      <td  align="center">���</td>   
    </tr>
    <%
			String type=request.getParameter("type");
			String sql="";
			if(Integer.parseInt(type)==1){
				sql="select * from stu where iflw='��ͨ��' and db='δ׼��' order by id desc";
			}
			else if(Integer.parseInt(type)==2){
				sql="select * from stu where iflw='δͨ��' order by id desc";
			}else if(Integer.parseInt(type)==3){
				sql="select * from stu where db='��׼��' order by id desc";
			}
			else{
				sql="select * from stu where db='δ׼��' order by id desc";
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
      <%if(!pagelist2.get(10).toString().equals("δ�·�")){out.println("���·�");}else{out.println("δ�·�");} %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;">
      <%if(!pagelist2.get(11).toString().equals("δ�Ͻ�")){%>���Ͻ�<%}else{out.println("δ�Ͻ�");} %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;">
      <%if(!pagelist2.get(11).toString().equals("δ�Ͻ�")){%><%=pagelist2.get(12).toString() %>
      <%}else{out.println("δͨ��");} %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%if(!pagelist2.get(13).toString().equals("δ�Ͻ�")){%>
      ���Ͻ�<%}else{out.println("δ�Ͻ�");} %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;">
	<%if(!pagelist2.get(13).toString().equals("δ�Ͻ�")){%><%=pagelist2.get(14).toString() %>
      <%}else{out.println("δͨ��");} %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;">
	  <%if(!pagelist2.get(14).toString().equals("δͨ��")){%><%=pagelist2.get(15).toString() %>
      <%}else{out.println("δ׼��");} %></td>
       
     </tr>
	
<%
	}}
%>  
 
	
	 
	 </TABLE></form>
</BODY>
<%} %>
</HTML>
