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
	if(document.form1.cj.value.replace(/\s+$|^\s+/g,"").length<=0 )
	{
		alert("�γ̳ɼ�������д��");
		document.form1.cj.focus();
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
		 	String method=request.getParameter("method");
		String id="";String cj = ""; String xq="";
		if(method.equals("upCj")){
			id=request.getParameter("id");
			List listt = cb.get1Com("select * from cj where id='"+id+"'",6);
			cj=listt.get(3).toString();xq=listt.get(5).toString();
		}		
		
%>
<BODY >
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align="left" vAlign=top ><form name="form1" action="<%=basePath %>ComServlet?method=<%=method%>&id=<%=id %>" method="post"  >
<table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
 <tr bgcolor='#FFFFFF'> 
    <td width='45%'><div align="right">�γ����ƣ�</div></td>
    <td ><select name=kc>
    <%List pagelist3=cb.getCom("select * from course order by id desc",8);	
				if(!pagelist3.isEmpty()){
				for(int i=0;i<pagelist3.size();i++){
					List pagelist2 =(ArrayList)pagelist3.get(i); %> 
			<option value=<%=pagelist2.get(1).toString() %>><%=pagelist2.get(1).toString() %></option>
<% }}%>  
    </select></td>
  </tr>
  <tr bgcolor='#FFFFFF'> 
    <td width='45%'><div align="right">ѧ��ѧ�ţ�</div></td>
    <td ><select name=sid>
    <%List pagelist4=cb.getCom("select * from stu  order by id desc",8);	
				if(!pagelist4.isEmpty()){
				for(int i=0;i<pagelist4.size();i++){
					List pagelist2 =(ArrayList)pagelist4.get(i); %> 
			<option value=<%=pagelist2.get(0).toString() %>><%=pagelist2.get(0).toString() %></option>
<% }}%>  
    </select></td> </tr>
	<tr bgcolor='#FFFFFF'> 
    <td width='45%'><div align="right">ѧ�֣�</div></td>
    <td ><input name="xq" type="text" size="20" maxlength="100" value="<%=xq %>" onkeyup="if(!(/^[\d]+\.?\d*$/.test(this.value))){alert('������������');this.value='';this.focus();}"></td>
  </tr>
  <tr bgcolor='#FFFFFF'> 
    <td width='45%'><div align="right">�γ̳ɼ���</div></td>
    <td ><input name="cj" type="text" size="20" maxlength="100" value="<%=cj %>" onkeyup="if(!(/^[\d]+\.?\d*$/.test(this.value))){alert('������������');this.value='';this.focus();}"></td>
  </tr>
   
  <tr bgcolor='#FFFFFF'> 
      <td colspan="2" align="center"> 
        <input class=mmcinb type='button' name='button' value='�ύ����' onclick='sub()'>
      </td>
    </tr>

</table>	</form>
   </TD>
	</TR>
  </TBODY>
</TABLE>
</BODY>
<%} %>
</HTML>
