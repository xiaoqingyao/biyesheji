<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>ѧ������</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>

<!--hxsglxiangdxongjxs-->
  <body >
  <p>����ѧ�������б�</p>
  <form name="form1" id="form1" method="post" action="">
   ����:  ��ҵ��ţ�<input name="zuoyebianhao" type="text" id="zuoyebianhao" style='border:solid 1px #000000; color:#666666' size="12" />  ���⣺<input name="biaoti" type="text" id="biaoti" style='border:solid 1px #000000; color:#666666' size="12" />  ѧ����<input name="xuesheng" type="text" id="xuesheng" style='border:solid 1px #000000; color:#666666' size="12" />
     <input type="submit" name="Submit" value="����" style='border:solid 1px #000000; color:#666666' />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">���</td>
    <td bgcolor='#CCFFFF'>��ҵ���</td>
    <td bgcolor='#CCFFFF'>����</td>
    <td bgcolor='#CCFFFF'>��ҵҪ��</td>
    <td style="display:none" bgcolor='#CCFFFF'>�ύ����</td>
    <td bgcolor='#CCFFFF'>������</td>
    <td bgcolor='#CCFFFF'>��������</td>
    <td bgcolor='#CCFFFF'>ѧ����ҵ</td>
    <td bgcolor='#CCFFFF'>ѧ��</td>
    <td bgcolor='#CCFFFF'>����</td>
    <td bgcolor='#CCFFFF'>��ҵ����</td>
    <td  style="display:none"bgcolor='#CCFFFF' width='80' align='center'>�Ƿ����</td>
    
    <td width="60" align="center" bgcolor="CCFFFF">����</td>
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
 <td><a href='<%=map.get("xueshengzuoye") %>' target='_blank'>����</a></td>
 <td><%=map.get("xuesheng") %></td>
 <td><%=map.get("xingming") %></td>
 <td><%=map.get("zuoyepigai") %></td>
 
 <td style="display:none" width='80' align='center'><%=map.get("issh")%></td>
   
    <td width="60" align="center">
	<a href="xueshengdati_updt.jsp?id=<%=map.get("id")%>">�޸�</a> 
	 <a href="xueshengdati_list2.jsp?scid=<%=map.get("id") %>" onClick="return confirm('���Ҫɾ����')">ɾ��</a> 
	 <a href="xueshengdati_detail.jsp?id=<%=map.get("id")%>">��ϸ</a> </td>
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

