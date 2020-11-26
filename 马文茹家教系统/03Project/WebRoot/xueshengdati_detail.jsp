<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>学生答题详细</title>
    <LINK href="css.css" type=text/css rel=stylesheet>

  </head>

  <body >
  <%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"xueshengdati");
     %>
  学生答题详细:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
   <tr>
     <td width='11%'>作业编号：</td><td width='39%'><%=m.get("zuoyebianhao")%></td><td width='11%'>标题：</td><td width='39%'><%=m.get("biaoti")%></td></tr><tr><td width='11%'>作业要求：</td><td width='39%'><%=m.get("zuoyeyaoqiu")%></td><td width='11%'>提交期限：</td><td width='39%'><%=m.get("tijiaoqixian")%></td></tr><tr><td width='11%'>发布人：</td><td width='39%'><%=m.get("faburen")%></td><td width='11%'>答题日期：</td><td width='39%'><%=m.get("datiriqi")%></td></tr><tr><td width='11%'>学生作业：</td><td width='39%'><a href="<%=m.get("xueshengzuoye")%>">点此下载</a></td><td width='11%'>学生：</td><td width='39%'><%=m.get("xuesheng")%></td></tr><tr><td width='11%'>姓名：</td><td width='39%'><%=m.get("xingming")%></td><td width='11%'>作业批改：</td><td width='39%'><%=m.get("zuoyepigai")%></td></tr><tr><td width='11%'>作业点评：</td><td width='39%'><%=m.get("zuoyedianping")%></td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td colspan=4 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=打印 onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>


