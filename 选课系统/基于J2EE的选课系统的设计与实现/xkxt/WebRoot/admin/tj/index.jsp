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
	form1.submit();
}
function sub22()
{
	form122.submit();
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
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align="left" vAlign=top ><form name="form1" action="<%=basePath %>admin/tj/hz.jsp?method=xqkc" method="post"  >
<table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
 <tr bgcolor='#FFFFFF'> 
    <td width='45%'><div align="right">课程名称：</div></td>
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
        <input class=mmcinb type='button' name='button' value='汇总排名' onclick='sub()'>
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
