<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%>
<jsp:directive.page import="com.util.Common"/>
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
<BODY oncontextmenu="return false;" onselectstart="return false;" leftMargin=0 
background=<%=basePath %><%=dir %>/images/MainBg.gif topMargin=0 scroll=no 
marginheight="0" marginwidth="0">
<TABLE  cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align="left" vAlign=top ><form action="<%=basePath %>Affiche.shtml?method=delaffiche" method="post" name="pageform">
<table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
     <tr class="head"> 
      <td width="5%" align="center">ID </td>
      <td  align="center">学号</td>
      <td  align="center">姓名</td>
      <td  align="center">课程名</td> 
      <td  align="center">成绩</td> 
    </tr>
    <%String kc=request.getParameter("kc");float f=0;
    	kc=Common.toChineseAndTrim(kc);
    	String cj1=request.getParameter("cj1");
    	String cj2=request.getParameter("cj2");
			List pagelist3=cb.getCom("select * from cj where js='"+username+"' and cj>'"+cj1+"' and cj<'"+cj2+"' and cid='"+kc+"' order by id desc",5);	
				if(!pagelist3.isEmpty()){
				for(int i=0;i<pagelist3.size();i++){
					List pagelist2 =(ArrayList)pagelist3.get(i);  
			%> 
	<tr  class="trA" onMouseOver="this.className='trB'" onMouseOut="this.className='trA'"> 
      <td width='5%' align="center" style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(0).toString()  %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(2).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=cb.getString("select xm from stu where id='"+pagelist2.get(2).toString()+"'") %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(1).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(3).toString() %></td>
    </tr>
	
<%
	}}
%>  <tr  class="trA" onMouseOver="this.className='trB'" onMouseOut="this.className='trA'"> 
      <td colspan=5 align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;">该分数段共有：<%=pagelist3.size() %> 人</td>
    </tr>
 
	
	 
	 </TABLE></form>
	</td>
	</tr>
 
  </TBODY>
</TABLE>
</BODY>
<%} %>
</HTML>
