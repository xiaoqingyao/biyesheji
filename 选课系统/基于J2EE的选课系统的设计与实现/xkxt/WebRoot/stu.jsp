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
		 
		 
		String xm = "";	
		String mm="";
		String xb="";String email="";String dh="";String nl="";String zy="";String bj="";
		 
			 
			List listt = cb.get1Com("select * from stu where id='"+username2+"'",9);
			xm=listt.get(1).toString();
			mm=listt.get(2).toString();
			xb=listt.get(3).toString();
			email=listt.get(4).toString();
			dh=listt.get(5).toString();
			nl=listt.get(6).toString();
			zy=listt.get(7).toString();
			bj=listt.get(8).toString();
		 	
		
%>
 
<form name="form1" action="<%=basePath %>ComServlet" method="post"  >
<table width='100%' cellspacing='0' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
<tr bgcolor='#FFFFFF'>  
    <td width='45%'><div align="right">学号：</div></td>
    <td ><%=username %></td>
  </tr>
  <tr bgcolor='#FFFFFF'> <input type="hidden" name="method" value="stuUp"> <input type="hidden" name="id" value="<%=username %>">
    <td width='45%'><div align="right">学生姓名：</div></td>
    <td ><input name="xm" type="text" size="20" maxlength="100" value="<%=xm %>"></td>
  </tr>
  <tr bgcolor='#FFFFFF'>  
    <td width='45%'><div align="right">登录密码：</div></td>
    <td ><input name="mm" type="password"   size="20" maxlength="100" value="<%=mm %>"></td>
  </tr>
  <tr bgcolor='#FFFFFF'>  
    <td width='45%'><div align="right">性别：</div></td>
    <td ><input name="xb" type="radio" value="男" checked> 男 <input name="xb" type="radio" value="女"> 女</td>
  </tr>
  <tr bgcolor='#FFFFFF'>  
    <td width='45%'><div align="right">email：</div></td>
    <td ><input name="email" type="text" id="email" size="20" maxlength="100" value="<%=email %>"></td>
  </tr>
  <tr bgcolor='#FFFFFF'>  
    <td width='45%'><div align="right">移动电话：</div></td>
    <td ><input name="dh" type="text" size="20" maxlength="100" value="<%=dh %>"></td>
  </tr>
  <tr bgcolor='#FFFFFF'>  
    <td width='45%'><div align="right">身份证号：</div></td>
    <td ><input name="nl" type="text" id="nl" size="20" maxlength="100" value="<%=nl %>"></td>
  </tr>
  <tr bgcolor='#FFFFFF'>  
    <td width='30%'><div align="right">班级：</div></td>
    <td ><select name="zy">
    <%List xblist=cb.getCom("select * from bj order by id desc",2);if(!xblist.isEmpty()){for(int i=0;i<xblist.size();i++){List list2=(List)xblist.get(i);%>
    <option value="<%=list2.get(1).toString() %>"><%=list2.get(1).toString() %></option>
    <%}} %>
    </select></td>
  </tr>
  <tr bgcolor='#FFFFFF'>  
    <td width='45%'><div align="right">通信地址：</div></td>
    <td ><input name="bj" type="text" id="bj" size="20" maxlength="100" value="<%=bj %>"></td>
  </tr>
 
  <tr bgcolor='#FFFFFF'> 
      <td colspan="2" align="center"> 
        <input class=mmcinb type='button' name='button' value='提交数据' onclick='sub()'>
      </td>
    </tr>

</table>	</form>
 
 
<%} %>
 
<%@ include file="iframe/foot.jsp"%>