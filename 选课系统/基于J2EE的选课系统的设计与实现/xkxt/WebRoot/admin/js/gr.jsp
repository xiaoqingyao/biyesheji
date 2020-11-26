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
{
	if(document.form1.username.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.form1.password.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.form1.realname.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.form1.email.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.form1.zc.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.form1.nl.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.form1.zy.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.form1.dw.value.replace(/\s+$|^\s+/g,"").length<=0)
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
	String username=(String)session.getAttribute("user");
	if(username==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{
		 
		 String id=cb.getString("select id from teacher where username='"+username+"'");
		String username2 = "";	
		String password="";
		String realname="";String email="";String zc="";String nl="";String zy="";String dw="";
		 
			 
			List listt = cb.get1Com("select * from teacher where username='"+username+"'",10);
			username2=listt.get(1).toString();
			password=listt.get(2).toString();
			realname=listt.get(3).toString();email=listt.get(4).toString();
			zc=listt.get(5).toString();
			nl=listt.get(6).toString();
			zy=listt.get(7).toString();
			dw=listt.get(8).toString();
		 	
		
%>
<BODY oncontextmenu="return false;" onselectstart="return false;" leftMargin=0 
background=<%=basePath %><%=dir %>/images/MainBg.gif topMargin=0 scroll=yes 
marginheight="0" marginwidth="0">
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align="left" vAlign=top ><form name="form1" action="<%=basePath %>ComServlet" method="post"  >
<table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
 
	
  <tr bgcolor='#FFFFFF'> <input type="hidden" name="method" value="jsUp"> <input type="hidden" name="id" value="<%=id %>">
    <td width='45%'><div align="right">登录名：</div></td>
    <td ><input name="username" type="text" id="username" size="20" maxlength="100" value="<%=username2 %>"></td>
  </tr>
  <tr bgcolor='#FFFFFF'>  
    <td width='45%'><div align="right">登录密码：</div></td>
    <td ><input name="password" type="password" id="password" size="20" maxlength="100" value="<%=password %>"></td>
  </tr>
  <tr bgcolor='#FFFFFF'>  
    <td width='45%'><div align="right">教师姓名：</div></td>
    <td ><input name="realname" type="text" id="realname" size="20" maxlength="100" value="<%=realname %>"></td>
  </tr>
  <tr bgcolor='#FFFFFF'>  
    <td width='45%'><div align="right">email：</div></td>
    <td ><input name="email" type="text" id="email" size="20" maxlength="100" value="<%=email %>"></td>
  </tr>
  <tr bgcolor='#FFFFFF'>  
    <td width='45%'><div align="right">职称：</div></td>
    <td ><input name="zc" type="text" id="zc" size="20" maxlength="100" value="<%=zc %>"></td>
  </tr>
  <tr bgcolor='#FFFFFF'>  
    <td width='45%'><div align="right">年龄：</div></td>
    <td ><input name="nl" type="text" id="nl" size="20" maxlength="100" value="<%=nl %>"></td>
  </tr>
  <tr bgcolor='#FFFFFF'>  
    <td width='30%'><div align="right">专业：</div></td>
    <td ><input name="zy" type="text" id="zy" size="20" maxlength="100" value="<%=zy %>"></td>
  </tr>
  <tr bgcolor='#FFFFFF'>  
    <td width='45%'><div align="right">所在系部：</div></td>
    <td ><select name="dw">
    <%List xblist=cb.getCom("select * from xb order by id desc",2);if(!xblist.isEmpty()){for(int i=0;i<xblist.size();i++){List list2=(List)xblist.get(i);%>
    <option value="<%=list2.get(1).toString() %>"><%=list2.get(1).toString() %></option>
    <%}} %>
    </select></td>
  </tr>
  <tr bgcolor='#FFFFFF'> 
      <td colspan="2" align="center"> 
        <input class=mmcinb type='button' name='button' value='提交数据' onclick='sub()'>
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
