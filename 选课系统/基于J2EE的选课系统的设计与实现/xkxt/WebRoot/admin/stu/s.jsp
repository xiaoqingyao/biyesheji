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
	if(document.form1.xh.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("所有项目必须填写！");
		//document.form1.title.focus();
		return false;
	}
	 
	form1.submit();
}
function sub22()
{//xm ,	mm,xb,email,dh,nl,zy,bj,
	if(document.formcj.xh.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("所有项目必须填写！");
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
    <td width='45%'><div align="right">学生学号：</div></td>
    <td ><input name="xh" type="text" size="20" maxlength="100" ></td>
  </tr>
  <tr bgcolor='#FFFFFF'> 
      <td colspan="2" align="center"> 
        <input class=mmcinb type='button' name='button' value='提交查询学生信息' onclick='sub()'>
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
    <td width='45%'><div align="right">学生学号：</div></td>
    <td ><input name="xh" type="text" size="20" maxlength="100" ></td>
  </tr>
  <tr bgcolor='#FFFFFF'>  
    <td width='45%'><div align="right">学期：</div></td>
    <td ><select name=xq>
    <option value=初中一年级上学期>初中一年级上学期</option> 
    <option value=初中一年级下学期>初中一年级下学期</option>
    <option value=初中二年级上学期>初中二年级上学期</option>
    <option value=初中二年级下学期>初中二年级下学期</option>
    <option value=初中三年级上学期>初中三年级上学期</option>
    <option value=初中三年级下学期>初中三年级下学期</option>
    <option value=高中一年级上学期>高中一年级上学期</option> 
    <option value=高中一年级下学期>高中一年级下学期</option>
    <option value=高中二年级上学期>高中二年级上学期</option>
    <option value=高中二年级下学期>高中二年级下学期</option>
    <option value=高中三年级上学期>高中三年级上学期</option>
    <option value=高中三年级下学期>高中三年级下学期</option>
    </select></td>
  </tr>
  <tr bgcolor='#FFFFFF'> 
      <td colspan="2" align="center"> 
        <input class=mmcinb type='button' name='button' value='提交查询成绩信息' onclick='sub22()'>
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
