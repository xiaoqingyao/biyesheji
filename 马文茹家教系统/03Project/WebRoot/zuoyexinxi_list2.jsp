<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>��ҵ��Ϣ</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>

<!--hxsglxiangdxongjxs-->
  <body >
  <p>������ҵ��Ϣ�б�</p>
  <form name="form1" id="form1" method="post" action="">
   ����:  ��ҵ��ţ�<input name="zuoyebianhao" type="text" id="zuoyebianhao" style='border:solid 1px #000000; color:#666666' size="12" />  ���⣺<input name="biaoti" type="text" id="biaoti" style='border:solid 1px #000000; color:#666666' size="12" />  �ύ���ޣ�<input name="tijiaoqixian1" type="text" id="tijiaoqixian1"  value='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:80px; height:20px; border:solid 1px #000000; color:#666666' />-<input name="tijiaoqixian2" type="text" id="tijiaoqixian2"  value='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:80px; height:20px; border:solid 1px #000000; color:#666666' />  �����ˣ�<input name="faburen" type="text" id="faburen" style='border:solid 1px #000000; color:#666666' size="12" />
     <input type="submit" name="Submit" value="����" style='border:solid 1px #000000; color:#666666' />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">���</td>
    <td bgcolor='#CCFFFF'>��ҵ���</td>    <td bgcolor='#CCFFFF'>����</td>    <td bgcolor='#CCFFFF'>��ҵҪ��</td>    <td bgcolor='#CCFFFF'>��ҵ</td>    <td bgcolor='#CCFFFF'>�γ��½�</td>    <td bgcolor='#CCFFFF'>�½�����</td>    <td bgcolor='#CCFFFF'>�ύ����</td>    <td bgcolor='#CCFFFF'>������</td>    <td bgcolor='#CCFFFF'>����</td>    <td bgcolor='#CCFFFF' width='80' align='center'>�Ƿ����</td>
    <td width="138" align="center" bgcolor="CCFFFF">���ʱ��</td>
    <td width="60" align="center" bgcolor="CCFFFF">����</td>
  </tr>
 <% 
  	//difengysfiqfgieuheze
//youzuiping1
//txixixngdy
  	 new CommDAO().delete(request,"zuoyexinxi"); 
    String url = "zuoyexinxi_list2.jsp?1=1"; 
    String sql =  "select * from zuoyexinxi where faburen='"+request.getSession().getAttribute("username")+"' ";
	if(request.getParameter("zuoyebianhao")=="" ||request.getParameter("zuoyebianhao")==null ){}else{sql=sql+" and zuoyebianhao like '%"+request.getParameter("zuoyebianhao")+"%'";}if(request.getParameter("biaoti")=="" ||request.getParameter("biaoti")==null ){}else{sql=sql+" and biaoti like '%"+request.getParameter("biaoti")+"%'";}if (request.getParameter("tijiaoqixian1")==""  ||request.getParameter("tijiaoqixian1")==null ) {}else{sql=sql+" and tijiaoqixian >= '"+request.getParameter("tijiaoqixian1")+"'";}if (request.getParameter("tijiaoqixian2")==""  ||request.getParameter("tijiaoqixian2")==null ) {}else {sql=sql+" and tijiaoqixian <= '"+request.getParameter("tijiaoqixian2")+"'";}if(request.getParameter("faburen")=="" ||request.getParameter("faburen")==null ){}else{sql=sql+" and faburen like '%"+request.getParameter("faburen")+"%'";}
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
    <td><%=map.get("zuoyebianhao") %></td> <td><%=map.get("biaoti") %></td> <td><%=map.get("zuoyeyaoqiu") %></td> <td><a href='<%=map.get("zuoye") %>' target='_blank'>����</a></td> <td><%=map.get("kechengzhangjie") %></td> <td><%=map.get("zhangjiemingcheng") %></td> <td><%=map.get("tijiaoqixian") %></td> <td><%=map.get("faburen") %></td> <td><%=map.get("xingming") %></td>  <td width='80' align='center'><%=map.get("issh")%></td>
    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="60" align="center"><a href="zuoyexinxi_updt.jsp?id=<%=map.get("id")%>">�޸�</a>  <a href="zuoyexinxi_list2.jsp?scid=<%=map.get("id") %>" onclick="return confirm('���Ҫɾ����')">ɾ��</a> </td>
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

