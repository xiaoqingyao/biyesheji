<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>课件信息</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>

<!--hxsglxiangdxongjxs-->
  <body >
  <p>已有课件信息列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:  课件编号：<input name="kejianbianhao" type="text" id="kejianbianhao" style='border:solid 1px #000000; color:#666666' size="12" />  课件名称：<input name="kejianmingcheng" type="text" id="kejianmingcheng" style='border:solid 1px #000000; color:#666666' size="12" /> 类型：<select name='leixing' id='leixing' style='border:solid 1px #000000; color:#666666;'><option value="">所有</option><option value="视频">视频</option><option value="课件">课件</option><option value="参考资料">参考资料</option></select>  上传人：<input name="shangchuanren" type="text" id="shangchuanren" style='border:solid 1px #000000; color:#666666' size="12" />
     <input type="submit" name="Submit" value="查找" style='border:solid 1px #000000; color:#666666' />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
    <td bgcolor='#CCFFFF'>课件编号</td>    <td bgcolor='#CCFFFF'>课件名称</td>    <td bgcolor='#CCFFFF'>类型</td>    <td bgcolor='#CCFFFF'>内容</td>    <td bgcolor='#CCFFFF'>上传人</td>    <td bgcolor='#CCFFFF'>姓名</td>    <td bgcolor='#CCFFFF' width='80' align='center'>是否审核</td>
    <td width="138" align="center" bgcolor="CCFFFF">添加时间</td>
    <td width="60" align="center" bgcolor="CCFFFF">操作</td>
  </tr>
 <% 
  	//difengysfiqfgieuheze
//youzuiping1
//txixixngdy
  	 new CommDAO().delete(request,"kejianxinxi"); 
    String url = "kejianxinxi_list2.jsp?1=1"; 
    String sql =  "select * from kejianxinxi where shangchuanren='"+request.getSession().getAttribute("username")+"' ";
	if(request.getParameter("kejianbianhao")=="" ||request.getParameter("kejianbianhao")==null ){}else{sql=sql+" and kejianbianhao like '%"+request.getParameter("kejianbianhao")+"%'";}if(request.getParameter("kejianmingcheng")=="" ||request.getParameter("kejianmingcheng")==null ){}else{sql=sql+" and kejianmingcheng like '%"+request.getParameter("kejianmingcheng")+"%'";}if(request.getParameter("leixing")=="" ||request.getParameter("leixing")==null ){}else{sql=sql+" and leixing like '%"+request.getParameter("leixing")+"%'";}if(request.getParameter("shangchuanren")=="" ||request.getParameter("shangchuanren")==null ){}else{sql=sql+" and shangchuanren like '%"+request.getParameter("shangchuanren")+"%'";}
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
    <td><%=map.get("kejianbianhao") %></td> <td><%=map.get("kejianmingcheng") %></td> <td><%=map.get("leixing") %></td> <td><a href='<%=map.get("neirong") %>' target='_blank'>下载</a></td>  <td><%=map.get("shangchuanren") %></td> <td><%=map.get("xingming") %></td> <td width='80' align='center'><%=map.get("issh")%></td>
    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="60" align="center"><a href="kejianxinxi_updt.jsp?id=<%=map.get("id")%>">修改</a>  <a href="kejianxinxi_list2.jsp?scid=<%=map.get("id") %>" onclick="return confirm('真的要删除？')">删除</a> <a href="kejianxinxidetail.jsp?id=<%=map.get("id")%>" target="_blank">详细</a> </td>
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

