<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>�μ���Ϣ</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>

<!--hxsglxiangdxongjxs-->
  <body >
  <p>���пμ���Ϣ�б�</p>
  <form name="form1" id="form1" method="post" action="">
   ����:  �μ���ţ�<input name="kejianbianhao" type="text" id="kejianbianhao" style='border:solid 1px #000000; color:#666666' size="12" />  �μ����ƣ�<input name="kejianmingcheng" type="text" id="kejianmingcheng" style='border:solid 1px #000000; color:#666666' size="12" /> ���ͣ�<select name='leixing' id='leixing' style='border:solid 1px #000000; color:#666666;'><option value="">����</option><option value="��Ƶ">��Ƶ</option><option value="�μ�">�μ�</option><option value="�ο�����">�ο�����</option></select>  �ϴ��ˣ�<input name="shangchuanren" type="text" id="shangchuanren" style='border:solid 1px #000000; color:#666666' size="12" />
   <input type="submit" name="Submit" value="����" style='border:solid 1px #000000; color:#666666' /> 
<!--    <input type="button" name="Submit2" value="����EXCEL" style='border:solid 1px #000000; color:#666666' onClick="javascript:location.href='kejianxinxi_listxls.jsp';" /> -->
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">���</td>
    <td bgcolor='#CCFFFF'>�μ����</td>    <td bgcolor='#CCFFFF'>�μ�����</td>    <td bgcolor='#CCFFFF'>����</td>    <td bgcolor='#CCFFFF'>����</td>        <td bgcolor='#CCFFFF'>�ϴ���</td>    <td bgcolor='#CCFFFF'>����</td>    <td bgcolor='#CCFFFF' width='80' align='center'>�Ƿ����</td>
	<!--dpinglun1-->
    <td width="138" align="center" bgcolor="CCFFFF">���ʱ��</td>
    
    <td width="60" align="center" bgcolor="CCFFFF">����</td>
  </tr>
  <% 
  	//difengysfiqfgieuheze
//youzuiping1
//txixixngdy
  	 new CommDAO().delete(request,"kejianxinxi"); 
    String url = "kejianxinxi_list.jsp?1=1"; 
    String sql =  "select * from kejianxinxi where 1=1";
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
    <td><%=map.get("kejianbianhao") %></td>    <td><%=map.get("kejianmingcheng") %></td>    <td><%=map.get("leixing") %></td>    <td><a href='<%=map.get("neirong") %>' target='_blank'>����</a></td>        <td><%=map.get("shangchuanren") %></td>    <td><%=map.get("xingming") %></td>    <td width='80' align='center'><a href="sh.jsp?id=<%=map.get("id")%>&yuan=<%=map.get("issh")%>&tablename=kejianxinxi" onclick="return confirm('��ȷ��Ҫִ�д˲�����')"><%=map.get("issh")%></a></td>
	<!--dpinglun2-->
    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="60" align="center"><a href="kejianxinxi_updt.jsp?id=<%=map.get("id")%>">�޸�</a>  <a href="kejianxinxi_list.jsp?scid=<%=map.get("id") %>" onclick="return confirm('���Ҫɾ����')">ɾ��</a> <a href="kejianxinxidetail.jsp?id=<%=map.get("id")%>" target="_blank">��ϸ</a> </td>
  </tr>
  	<%
  }
   %>
</table>
<br>
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

