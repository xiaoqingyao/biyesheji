<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>学生答题</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>

<!--hxsglxiangdxongjxs-->
  <body >
  <p>已有学生答题列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:  作业编号：<input name="zuoyebianhao" type="text" id="zuoyebianhao" style='border:solid 1px #000000; color:#666666' size="12" />  标题：<input name="biaoti" type="text" id="biaoti" style='border:solid 1px #000000; color:#666666' size="12" />  学生：<input name="xuesheng" type="text" id="xuesheng" style='border:solid 1px #000000; color:#666666' size="12" />
     <input type="submit" name="Submit" value="查找" style='border:solid 1px #000000; color:#666666' />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
    <td bgcolor='#CCFFFF'>作业编号</td>
    <td bgcolor='#CCFFFF'>标题</td>
    <td bgcolor='#CCFFFF'>作业要求</td>
    <td style="display:none" bgcolor='#CCFFFF'>提交期限</td>
    <td bgcolor='#CCFFFF'>发布人</td>
    <td bgcolor='#CCFFFF'>答题日期</td>
    <td bgcolor='#CCFFFF'>学生作业</td>
    <td bgcolor='#CCFFFF'>学生</td>
    <td bgcolor='#CCFFFF'>姓名</td>
    <td bgcolor='#CCFFFF'>作业批改</td>
    <td  style="display:none"bgcolor='#CCFFFF' width='80' align='center'>是否审核</td>
    
    <td width="60" align="center" bgcolor="CCFFFF">操作</td>
  </tr>
 <% 
  	//difengysfiqfgieuheze
//youzuiping1
//txixixngdy
  	 new CommDAO().delete(request,"xueshengdati"); 
    String url = "xueshengdati_list1.jsp?1=1"; 
    String sql =  "select * from xueshengdati where faburen='"+request.getSession().getAttribute("username")+"' ";
	
if(request.getParameter("zuoyebianhao")=="" ||request.getParameter("zuoyebianhao")==null ){}else{sql=sql+" and zuoyebianhao like '%"+request.getParameter("zuoyebianhao")+"%'";}
if(request.getParameter("biaoti")=="" ||request.getParameter("biaoti")==null ){}else{sql=sql+" and biaoti like '%"+request.getParameter("biaoti")+"%'";}
if(request.getParameter("xuesheng")=="" ||request.getParameter("xuesheng")==null ){}else{sql=sql+" and xuesheng like '%"+request.getParameter("xuesheng")+"%'";}
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
 
 <td style="display:none" width='80' align='center'><%=map.get("issh")%></td>
   
    <td width="60" align="center">
	<a href="xueshengdati_updt.jsp?id=<%=map.get("id")%>">修改</a> 
	 <a href="xueshengdati_list2.jsp?scid=<%=map.get("id") %>" onClick="return confirm('真的要删除？')">删除</a> 
	 <a href="xueshengdati_detail.jsp?id=<%=map.get("id")%>">详细</a> </td>
  </tr>
  	<%
  }
   %>
</table><br>
<!--yoxugonxgzitoxnxgjxi--> <!--youzuiping3--> 
${page.info }

  <%
//yoxutixinxg if(kucddduntx>0)
//yoxutixinxg{
//yoxutixinxg tsgehxdhdm
//yoxutixinxg}
%>
  </body>
</html>

