<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%>
<%@ page import="com.bean.*" %>
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
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
	
	String id=request.getParameter("id"); 
%>
<BODY >
<table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
     <tr class="head"> 
      <td width="5%" align="center">ID</td>
      <td  align="center">�ļ�����</td> 
      <td  align="center">�ϴ�ʱ��</td>
      <td  align="center">���ز鿴</td> 
      <td  align="center">ɾ��</td> 
    </tr>
    <%
			List pagelist3=cb.getCom("select * from files where teacher='"+username+"' order by id desc",5);	
				if(!pagelist3.isEmpty()){
				for(int i=0;i<pagelist3.size();i++){
					List pagelist2 =(ArrayList)pagelist3.get(i); 
			%> 
	<tr  class="trA" onMouseOver="this.className='trB'" onMouseOut="this.className='trA'"> 
      <td width='5%' align="center" style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(0).toString()  %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(1).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(4).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><a href="<%=basePath %>down.jsp?url=<%=pagelist2.get(2).toString()%>">���ز鿴</a></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><a href="<%=basePath %>ComServlet?method=jsDelFile&id=<%=pagelist2.get(0).toString()%>">ɾ��</a></td>
     </tr>
	
<%
	}}
%>  
</TABLE> 
<form action="<%=basePath %>UploadServlet" name="form1" method=post  enctype="multipart/form-data">	  
	<TABLE width="100%" border=0 align="center" cellPadding=3 cellSpacing=1 class=tablewidth>
		  <TBODY>
		 <tr bgcolor='#FFFFFF'> <input type=hidden name=method value=scFile> 
    	<td width='30%'><div align="right">�ļ����ƣ�</div></td>
    	<td align=left><input name="mc" type="text" size="40" maxlength="150" > </td>
  		</tr>
		 <tr bgcolor='#FFFFFF'>  
    	<td width='30%'><div align="right">�ϴ��ļ���</div></td>
    	<td align=left><input name="pic" type="file" contentEditable=false  size="40" maxlength="150" > </td>
  		</tr>
  		 
  		<tr bgcolor='#FFFFFF'> 
      <td colspan="2" align="center"> 
        <input class=mmcinb type='button' name='button' value='�ύ����' onclick='subb()'>
      </td>
    </tr>
		 </TBODY>
	   </TABLE> 
	   </form> 
	   <script type="text/javascript">
	   function subb()
	   {
	   	 if(document.form1.mc.value=="")
	   	{
	   		alert("����д�ļ����ƣ�");
	   		document.form1.mc.focus();
	   		return false;
	   	}
	   	if(document.form1.pic.value=="")
	   	{
	   		alert("���ϴ��ļ���");
	   		document.form1.pic.focus();
	   		return false;
	   	}
	   	 
	   	 
	   	form1.submit();
	   }
	   </script>
</BODY>
<%} %>

</HTML>
