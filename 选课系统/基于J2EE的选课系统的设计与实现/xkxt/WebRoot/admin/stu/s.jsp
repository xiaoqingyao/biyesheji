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
	if(document.form1.xh.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("������Ŀ������д��");
		//document.form1.title.focus();
		return false;
	}
	 
	form1.submit();
}
function sub22()
{//xm ,	mm,xb,email,dh,nl,zy,bj,
	if(document.formcj.xh.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("������Ŀ������д��");
		//document.form1.title.focus();
		return false;
	}
	 
	formcj.submit();
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
<TABLE  cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align="left" vAlign=top >
<form name="form1" action="<%=basePath %>admin/stu/sinfo.jsp" method="post"  >
<table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
<tr bgcolor='#FFFFFF'>  
    <td width='45%'><div align="right">ѧ��ѧ�ţ�</div></td>
    <td ><input name="xh" type="text" size="20" maxlength="100" ></td>
  </tr>
  <tr bgcolor='#FFFFFF'> 
      <td colspan="2" align="center"> 
        <input class=mmcinb type='button' name='button' value='�ύ��ѯѧ����Ϣ' onclick='sub()'>
      </td>
    </tr>
</table>	
</form>
   </TD>
	</TR>
	<TR>
    <TD align="left" vAlign=top >
<form name="formcj" action="<%=basePath %>admin/stu/scjinfo.jsp" method="post"  >
<table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
<tr bgcolor='#FFFFFF'>  
    <td width='45%'><div align="right">ѧ��ѧ�ţ�</div></td>
    <td ><input name="xh" type="text" size="20" maxlength="100" ></td>
  </tr>
  <tr bgcolor='#FFFFFF'>  
    <td width='45%'><div align="right">ѧ�ڣ�</div></td>
    <td ><select name=xq>
    <option value=����һ�꼶��ѧ��>����һ�꼶��ѧ��</option> 
    <option value=����һ�꼶��ѧ��>����һ�꼶��ѧ��</option>
    <option value=���ж��꼶��ѧ��>���ж��꼶��ѧ��</option>
    <option value=���ж��꼶��ѧ��>���ж��꼶��ѧ��</option>
    <option value=�������꼶��ѧ��>�������꼶��ѧ��</option>
    <option value=�������꼶��ѧ��>�������꼶��ѧ��</option>
    <option value=����һ�꼶��ѧ��>����һ�꼶��ѧ��</option> 
    <option value=����һ�꼶��ѧ��>����һ�꼶��ѧ��</option>
    <option value=���ж��꼶��ѧ��>���ж��꼶��ѧ��</option>
    <option value=���ж��꼶��ѧ��>���ж��꼶��ѧ��</option>
    <option value=�������꼶��ѧ��>�������꼶��ѧ��</option>
    <option value=�������꼶��ѧ��>�������꼶��ѧ��</option>
    </select></td>
  </tr>
  <tr bgcolor='#FFFFFF'> 
      <td colspan="2" align="center"> 
        <input class=mmcinb type='button' name='button' value='�ύ��ѯ�ɼ���Ϣ' onclick='sub22()'>
      </td>
    </tr>
</table>	
</form>
   </TD>
	</TR>
  </TBODY>
</TABLE>
</BODY>
<%} %>
</HTML>
