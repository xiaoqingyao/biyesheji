<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>ѧ��������ϸ</title>
    <LINK href="css.css" type=text/css rel=stylesheet>

  </head>

  <body >
  <%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"xueshengdati");
     %>
  ѧ��������ϸ:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
   <tr>
     <td width='11%'>��ҵ��ţ�</td><td width='39%'><%=m.get("zuoyebianhao")%></td><td width='11%'>���⣺</td><td width='39%'><%=m.get("biaoti")%></td></tr><tr><td width='11%'>��ҵҪ��</td><td width='39%'><%=m.get("zuoyeyaoqiu")%></td><td width='11%'>�ύ���ޣ�</td><td width='39%'><%=m.get("tijiaoqixian")%></td></tr><tr><td width='11%'>�����ˣ�</td><td width='39%'><%=m.get("faburen")%></td><td width='11%'>�������ڣ�</td><td width='39%'><%=m.get("datiriqi")%></td></tr><tr><td width='11%'>ѧ����ҵ��</td><td width='39%'><a href="<%=m.get("xueshengzuoye")%>">�������</a></td><td width='11%'>ѧ����</td><td width='39%'><%=m.get("xuesheng")%></td></tr><tr><td width='11%'>������</td><td width='39%'><%=m.get("xingming")%></td><td width='11%'>��ҵ���ģ�</td><td width='39%'><%=m.get("zuoyepigai")%></td></tr><tr><td width='11%'>��ҵ������</td><td width='39%'><%=m.get("zuoyedianping")%></td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td colspan=4 align=center><input type=button name=Submit5 value=���� onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=��ӡ onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>


