<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>��ʦע��</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>

<!--hxsglxiangdxongjxs-->
  <body >
  <p>���н�ʦע���б�</p>
  <form name="form1" id="form1" method="post" action="">
   ����:  ���ţ�<input name="gonghao" type="text" id="gonghao" style='border:solid 1px #000000; color:#666666' size="12" />  ������<input name="xingming" type="text" id="xingming" style='border:solid 1px #000000; color:#666666' size="12" />  �������£�<input name="chushengnianyue1" type="text" id="chushengnianyue1"  value='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:80px; height:20px; border:solid 1px #000000; color:#666666' />-<input name="chushengnianyue2" type="text" id="chushengnianyue2"  value='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:80px; height:20px; border:solid 1px #000000; color:#666666' /> ְ����<select name='zhiji' id='zhiji' style='border:solid 1px #000000; color:#666666;'><option value="">����</option><option value="�߼�">�߼�</option><option value="�м�">�м�</option><option value="����">����</option></select>
   <input type="submit" name="Submit" value="����" style='border:solid 1px #000000; color:#666666' />
<!--     <input type="button" name="Submit2" value="����EXCEL" style='border:solid 1px #000000; color:#666666' onClick="javascript:location.href='jiaoshizhuce_listxls.jsp';" /> -->
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">���</td>
    <td bgcolor='#CCFFFF'>����</td>    <td bgcolor='#CCFFFF'>����</td>    <td bgcolor='#CCFFFF'>����</td>    <td bgcolor='#CCFFFF' width='40' align='center'>�Ա�</td>    <td bgcolor='#CCFFFF' width='65' align='center'>��������</td>    <td bgcolor='#CCFFFF'>����</td>    <td bgcolor='#CCFFFF'>ְ��</td>    <td bgcolor='#CCFFFF'>�ֻ�</td>    <td bgcolor='#CCFFFF'>����</td>    <td bgcolor='#CCFFFF'>��ַ</td>    <td bgcolor='#CCFFFF' width='90' align='center'>ͷ��</td>        
	<!--dpinglun1-->
    <td width="138" align="center" bgcolor="CCFFFF">���ʱ��</td>
    
    <td width="60" align="center" bgcolor="CCFFFF">����</td>
  </tr>
  <% 
  	//difengysfiqfgieuheze
//youzuiping1
//txixixngdy
  	 new CommDAO().delete(request,"jiaoshizhuce"); 
    String url = "jiaoshizhuce_list.jsp?1=1"; 
    String sql =  "select * from jiaoshizhuce where 1=1";
	if(request.getParameter("gonghao")=="" ||request.getParameter("gonghao")==null ){}else{sql=sql+" and gonghao like '%"+request.getParameter("gonghao")+"%'";}if(request.getParameter("xingming")=="" ||request.getParameter("xingming")==null ){}else{sql=sql+" and xingming like '%"+request.getParameter("xingming")+"%'";}if (request.getParameter("chushengnianyue1")==""  ||request.getParameter("chushengnianyue1")==null ) {}else{sql=sql+" and chushengnianyue >= '"+request.getParameter("chushengnianyue1")+"'";}if (request.getParameter("chushengnianyue2")==""  ||request.getParameter("chushengnianyue2")==null ) {}else {sql=sql+" and chushengnianyue <= '"+request.getParameter("chushengnianyue2")+"'";}if(request.getParameter("zhiji")=="" ||request.getParameter("zhiji")==null ){}else{sql=sql+" and zhiji like '%"+request.getParameter("zhiji")+"%'";}
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
    <td><%=map.get("gonghao") %></td>    <td><%=map.get("mima") %></td>    <td><%=map.get("xingming") %></td>    <td align='center'><%=map.get("xingbie") %></td>    <td><%=map.get("chushengnianyue") %></td>    <td><%=map.get("gongling") %></td>    <td><%=map.get("zhiji") %></td>    <td><%=map.get("shouji") %></td>    <td><%=map.get("youxiang") %></td>    <td><%=map.get("dizhi") %></td>    <td width='90'><a href='<%=map.get("touxiang") %>' target='_blank'><img src='<%=map.get("touxiang") %>' width=88 height=99 border=0 /></a></td>        
	<!--dpinglun2-->
    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="60" align="center"><a href="jiaoshizhuce_updt.jsp?id=<%=map.get("id")%>">�޸�</a>  <a href="jiaoshizhuce_list.jsp?scid=<%=map.get("id") %>" onclick="return confirm('���Ҫɾ����')">ɾ��</a> <a href="jiaoshizhucedetail.jsp?id=<%=map.get("id")%>" target="_blank">��ϸ</a> </td>
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

