<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
<head>
<title>�μ���Ϣ</title>
<!--bixanjxiqxi-->
<LINK href="qtimages/style.css" type=text/css rel=stylesheet>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
<!--hxsglxiangdxongjxs-->
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="1000" height="1160" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
	<tr>
		<td><%@ include file="qttop.jsp"%></td>
	</tr>
	<tr>
		<td><table id="__01" width="1000" height="804" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="top"><%@ include file="qtleft.jsp"%></td>
            <td valign="top"><table id="__01" width="770" height="804" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td valign="top"><table id="__01" width="770" height="276" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="770" height="36" background="qtimages/1_02_02_01_01.gif"><table width="98%" height="22" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="17%" align="center"><strong>�μ���Ϣ</strong></td>
                        <td width="83%">&nbsp;</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><table id="__01" width="770" height="231" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="11" background="qtimages/1_02_02_01_02_01.gif">&nbsp;</td>
                        <td height="759" valign="top">
						
						  <form name="form1" id="form1" method="post" action="">
   ����:  �μ���ţ�<input name="kejianbianhao" type="text" id="kejianbianhao" style='border:solid 1px #000000; color:#666666' size="12" />  �μ����ƣ�<input name="kejianmingcheng" type="text" id="kejianmingcheng" style='border:solid 1px #000000; color:#666666' size="12" /> ���ͣ�<select name='leixing' id='leixing' style='border:solid 1px #000000; color:#666666;'><option value="">����</option><option value="��Ƶ">��Ƶ</option><option value="�μ�">�μ�</option><option value="�ο�����">�ο�����</option></select>  �ϴ��ˣ�<input name="shangchuanren" type="text" id="shangchuanren" style='border:solid 1px #000000; color:#666666' size="12" />
   <input type="submit" name="Submit" value="����" style='border:solid 1px #000000; color:#666666' />
						  </form>
						  
						  <%
						 if(request.getSession().getAttribute("username")==null){
						    	
						    	out.println("<lable style='color:red;font-size: x-large'>�Բ��𣬿μ�ֻ��ע��ѧԱ���ţ�����ע�Ტ����ҽ̡�</lable>");
						    }else{
						    	out.println("<lable style='color:red;'>��������ʾ����ѧ��ֻ���Ի�ȡ��Ӧ�ҽ���ʦ�Ŀμ���Դ��</lable>");
						    	
						    }
						%>
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse" class="newsline">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">���</td>
    <td bgcolor='#CCFFFF'>�μ����</td>
    <td bgcolor='#CCFFFF'>�μ�����</td>
    <td bgcolor='#CCFFFF'>����</td>
    <td bgcolor='#CCFFFF'>����</td>
    
    <td bgcolor='#CCFFFF'>�ϴ���</td>
    <td bgcolor='#CCFFFF'>����</td>
    
    
    <td width="30" align="center" bgcolor="CCFFFF">��ϸ</td>
  </tr>
  <% 
  	//difengysfiqfgieuheze
//youzuiping1
//txixixngdy
  	 new CommDAO().delete(request,"kejianxinxi"); 
    String url = "kejianxinxilist.jsp?issh='��'"; 
    if(request.getSession().getAttribute("username")==null){
    	
    	return;
    }
    String sql =  "select kejianxinxi.* from kejianxinxi inner JOIN jiaoshizhuce on kejianxinxi.shangchuanren=jiaoshizhuce.gonghao inner join duizhao on duizhao.teaid=jiaoshizhuce.gonghao where duizhao.stuid='"+request.getSession().getAttribute("username")+"' ";
	
if(request.getParameter("kejianbianhao")=="" ||request.getParameter("kejianbianhao")==null ){}else{sql=sql+" and kejianbianhao like '%"+request.getParameter("kejianbianhao")+"%'";}
if(request.getParameter("kejianmingcheng")=="" ||request.getParameter("kejianmingcheng")==null ){}else{sql=sql+" and kejianmingcheng like '%"+request.getParameter("kejianmingcheng")+"%'";}
if(request.getParameter("leixing")=="" ||request.getParameter("leixing")==null ){}else{sql=sql+" and leixing like '%"+request.getParameter("leixing")+"%'";}
if(request.getParameter("shangchuanren")=="" ||request.getParameter("shangchuanren")==null ){}else{sql=sql+" and shangchuanren like '%"+request.getParameter("shangchuanren")+"%'";}
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
    <td><%=map.get("kejianbianhao") %></td><td><%=map.get("kejianmingcheng") %></td><td><%=map.get("leixing") %></td><td><a href='<%=map.get("neirong") %>' target='_blank'>����</a></td><td><%=map.get("shangchuanren") %></td><td><%=map.get("xingming") %></td>
    
    <td width="30" align="center"> <a href="kejianxinxidetail.jsp?id=<%=map.get("id")%>" >��ϸ</a></td>
  </tr>
  	<%
  }
   %>
</table><br>

<!--yoxugonxgzitoxnxgjxi--> <!--youzuiping3--> 
${page.info }						
						 
						 </td>
                        <td width="10" background="qtimages/1_02_02_01_02_04.gif">&nbsp;</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><img src="qtimages/1_02_02_01_03.gif" width="770" height="9" alt=""></td>
                  </tr>
                </table></td>
              </tr>
              
            </table></td>
          </tr>
        </table></td>
	</tr>
	<tr>
		<td><%@ include file="qtdown.jsp"%></td>
	</tr>
</table>
<!-- dfexnxxiaxng -->
</body>
</html>
<!--suxilxatxihuxan-->
