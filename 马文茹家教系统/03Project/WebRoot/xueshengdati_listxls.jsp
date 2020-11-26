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
    <title>学生答题</title>
  </head>

  <body >
  <p>已有学生答题列表：</p>
  

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
    <td bgcolor='#CCFFFF'>作业编号</td>
    <td bgcolor='#CCFFFF'>标题</td>
    <td bgcolor='#CCFFFF'>作业要求</td>
    <td  style="display:none"bgcolor='#CCFFFF'>提交期限</td>
    <td bgcolor='#CCFFFF'>发布人</td>
    <td bgcolor='#CCFFFF'>答题日期</td>
    <td bgcolor='#CCFFFF'>学生作业</td>
    <td bgcolor='#CCFFFF'>学生</td>
    <td bgcolor='#CCFFFF'>姓名</td>
    <td bgcolor='#CCFFFF'>作业批改</td>
    
    <td bgcolor='#CCFFFF' width='80' align='center'>是否审核</td>
    <td width="138" align="center" bgcolor="CCFFFF">添加时间</td>
    

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
    <td><a href='<%=map.get("xueshengzuoye") %>' target='_blank'>下载</a></td>
    <td><%=map.get("xuesheng") %></td>
    <td><%=map.get("xingming") %></td>
    <td><%=map.get("zuoyepigai") %></td>
    
    <td width='80' align='center'><a href="sh.jsp?id=<%=map.get("id")%>&yuan=<%=map.get("issh")%>&tablename=xueshengdati" onClick="return confirm('您确定要执行此操作？')"><%=map.get("issh")%></a></td>
    <td width="138" align="center"><%=map.get("addtime") %></td>
  </tr>
  	<%
  }
   %>
</table>

<br>
以上数据共<%=i %>条
  </body>
</html>

