<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=zuoyexinxi.xls");
%>
<html>
  <head>
    <title>��ҵ��Ϣ</title>
  </head>

  <body >
  <p>������ҵ��Ϣ�б�</p>
  

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">���</td>
    <td bgcolor='#CCFFFF'>��ҵ���</td>    <td bgcolor='#CCFFFF'>����</td>    <td bgcolor='#CCFFFF'>��ҵҪ��</td>    <td bgcolor='#CCFFFF'>��ҵ</td>    <td bgcolor='#CCFFFF'>�γ��½�</td>    <td bgcolor='#CCFFFF'>�½�����</td>    <td bgcolor='#CCFFFF'>�ύ����</td>    <td bgcolor='#CCFFFF'>������</td>    <td bgcolor='#CCFFFF'>����</td>        <td bgcolor='#CCFFFF' width='80' align='center'>�Ƿ����</td>
    <td width="138" align="center" bgcolor="CCFFFF">���ʱ��</td>
    

  </tr>
  <% 
  	//difengysfiqfgieuheze
//youzuiping1
//txixixngdy
    String url = "zuoyexinxi_list.jsp?1=1"; 
    String sql =  "select * from zuoyexinxi where 1=1";
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	//wxflzhistri
	//zoxngxetxoxngjxvi
//txixgihxngjs
//youzuiping2
     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("zuoyebianhao") %></td>    <td><%=map.get("biaoti") %></td>    <td><%=map.get("zuoyeyaoqiu") %></td>    <td><a href='<%=map.get("zuoye") %>' target='_blank'>����</a></td>    <td><%=map.get("kechengzhangjie") %></td>    <td><%=map.get("zhangjiemingcheng") %></td>    <td><%=map.get("tijiaoqixian") %></td>    <td><%=map.get("faburen") %></td>    <td><%=map.get("xingming") %></td>        <td width='80' align='center'><a href="sh.jsp?id=<%=map.get("id")%>&yuan=<%=map.get("issh")%>&tablename=zuoyexinxi" onclick="return confirm('��ȷ��Ҫִ�д˲�����')"><%=map.get("issh")%></a></td>
    <td width="138" align="center"><%=map.get("addtime") %></td>
  </tr>
  	<%
  }
   %>
</table>

<br>
�������ݹ�<%=i %>��
  </body>
</html>

