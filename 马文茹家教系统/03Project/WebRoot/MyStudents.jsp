<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>作业信息</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>

<!--hxsglxiangdxongjxs-->
  <body >
  <p>已有作业信息列表：</p>


<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
    <td bgcolor='#CCFFFF'>学生编号</td>
    <td bgcolor='#CCFFFF'>姓名</td>
    <td bgcolor='#CCFFFF'>性别</td>
    <td bgcolor='#CCFFFF'>出生年月</td>
    <td bgcolor='#CCFFFF'>QQ</td>
    <td bgcolor='#CCFFFF'>邮箱</td>
    <td bgcolor='#CCFFFF'>电话</td>
    <td bgcolor='#CCFFFF'>地址</td>
    <td bgcolor='#CCFFFF' width='80' align='center'>是否审核</td>
  </tr>
 <% 
  	//difengysfiqfgieuheze
//youzuiping1
//txixixngdy
  	 new CommDAO().delete(request,"zuoyexinxi"); 
    String url = "zuoyexinxi_list2.jsp?1=1"; 
    String sql =  "select   yonghuzhuce.yonghuming,yonghuzhuce.xingming,yonghuzhuce.xingbie,yonghuzhuce.chushengnianyue,yonghuzhuce.QQ,yonghuzhuce.youxiang,yonghuzhuce.dianhua,yonghuzhuce.dizhi,duizhao.issh,duizhao.id from duizhao inner JOIN yonghuzhuce on duizhao.stuid=yonghuzhuce.yonghuming where duizhao.teaid='"+request.getSession().getAttribute("username")+"' ";
	

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
    <td><%=map.get("yonghuming") %></td>
 <td><%=map.get("xingming") %></td>
 <td><%=map.get("xingbie") %></td>
 
 <td><%=map.get("chushengnianyue") %></td>
 <td><%=map.get("QQ") %></td>
 <td><%=map.get("youxiang") %></td>
 <td><%=map.get("dianhua") %></td>
 <td><%=map.get("dizhi") %></td>
  
  <td width='80' align='center'>
  <a href="sh.jsp?id=<%=map.get("id")%>&yuan=<%=map.get("issh")%>&tablename=duizhao" onclick="return confirm('您确定要执行此操作？')"><%=map.get("issh")%>
  </a>
  </td>
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

