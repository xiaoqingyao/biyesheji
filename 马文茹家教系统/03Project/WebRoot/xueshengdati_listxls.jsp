<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=xueshengdati.xls");
%>
<html>
  <head>
    <title>ѧ������</title>
  </head>

  <body >
  <p>����ѧ�������б�</p>
  

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">���</td>
    <td bgcolor='#CCFFFF'>��ҵ���</td>
    <td bgcolor='#CCFFFF'>����</td>
    <td bgcolor='#CCFFFF'>��ҵҪ��</td>
    <td  style="display:none"bgcolor='#CCFFFF'>�ύ����</td>
    <td bgcolor='#CCFFFF'>������</td>
    <td bgcolor='#CCFFFF'>��������</td>
    <td bgcolor='#CCFFFF'>ѧ����ҵ</td>
    <td bgcolor='#CCFFFF'>ѧ��</td>
    <td bgcolor='#CCFFFF'>����</td>
    <td bgcolor='#CCFFFF'>��ҵ����</td>
    
    <td bgcolor='#CCFFFF' width='80' align='center'>�Ƿ����</td>
    <td width="138" align="center" bgcolor="CCFFFF">���ʱ��</td>
    

  </tr>
  <% 
  	//difengysfiqfgieuheze
//youzuiping1
//txixixngdy
    String url = "xueshengdati_list.jsp?1=1"; 
    String sql =  "select * from xueshengdati where 1=1";
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
    <td><%=map.get("zuoyebianhao") %></td>
    <td><%=map.get("biaoti") %></td>
    <td><%=map.get("zuoyeyaoqiu") %></td>
    <td style="display:none"><%=map.get("tijiaoqixian") %></td>
    <td><%=map.get("faburen") %></td>
    <td><%=map.get("datiriqi") %></td>
    <td><a href='<%=map.get("xueshengzuoye") %>' target='_blank'>����</a></td>
    <td><%=map.get("xuesheng") %></td>
    <td><%=map.get("xingming") %></td>
    <td><%=map.get("zuoyepigai") %></td>
    
    <td width='80' align='center'><a href="sh.jsp?id=<%=map.get("id")%>&yuan=<%=map.get("issh")%>&tablename=xueshengdati" onClick="return confirm('��ȷ��Ҫִ�д˲�����')"><%=map.get("issh")%></a></td>
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

