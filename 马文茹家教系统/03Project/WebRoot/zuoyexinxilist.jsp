<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
<head>
<title>��ҵ��Ϣ</title>
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
                        <td width="17%" align="center"><strong>��ҵ��Ϣ</strong></td>
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
   ����:  ��ҵ��ţ�<input name="zuoyebianhao" type="text" id="zuoyebianhao" style='border:solid 1px #000000; color:#666666' size="12" />  ���⣺<input name="biaoti" type="text" id="biaoti" style='border:solid 1px #000000; color:#666666' size="12" />  �ύ���ޣ�<input name="tijiaoqixian1" type="text" id="tijiaoqixian1"  value='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:80px; height:20px; border:solid 1px #000000; color:#666666' />-<input name="tijiaoqixian2" type="text" id="tijiaoqixian2"  value='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:80px; height:20px; border:solid 1px #000000; color:#666666' />  �����ˣ�<input name="faburen" type="text" id="faburen" style='border:solid 1px #000000; color:#666666' size="12" />
   <input type="submit" name="Submit" value="����" style='border:solid 1px #000000; color:#666666' />
						  </form>
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse" class="newsline">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">���</td>
    <td bgcolor='#CCFFFF'>��ҵ���</td>
    <td bgcolor='#CCFFFF'>����</td>
    <td bgcolor='#CCFFFF'>��ҵҪ��</td>
    <td bgcolor='#CCFFFF'>��ҵ</td>
    <td bgcolor='#CCFFFF'>�γ��½�</td>
    <td bgcolor='#CCFFFF'>�½�����</td>
    <td bgcolor='#CCFFFF'>�ύ����</td>
    <td bgcolor='#CCFFFF'>������</td>
    <td bgcolor='#CCFFFF'>����</td>
    
    
    
    <td width="30" align="center" bgcolor="CCFFFF">��ϸ</td>
  </tr>
  <% 
  	//difengysfiqfgieuheze
//youzuiping1
//txixixngdy
  	 new CommDAO().delete(request,"zuoyexinxi"); 
    String url = "zuoyexinxilist.jsp?issh='��'"; 
    String sql =  "select * from zuoyexinxi where issh='��'";
	
if(request.getParameter("zuoyebianhao")=="" ||request.getParameter("zuoyebianhao")==null ){}else{sql=sql+" and zuoyebianhao like '%"+request.getParameter("zuoyebianhao")+"%'";}
if(request.getParameter("biaoti")=="" ||request.getParameter("biaoti")==null ){}else{sql=sql+" and biaoti like '%"+request.getParameter("biaoti")+"%'";}
if (request.getParameter("tijiaoqixian1")==""  ||request.getParameter("tijiaoqixian1")==null ) {}else{sql=sql+" and tijiaoqixian >= '"+request.getParameter("tijiaoqixian1")+"'";}
if (request.getParameter("tijiaoqixian2")==""  ||request.getParameter("tijiaoqixian2")==null ) {}else {sql=sql+" and tijiaoqixian <= '"+request.getParameter("tijiaoqixian2")+"'";}
if(request.getParameter("faburen")=="" ||request.getParameter("faburen")==null ){}else{sql=sql+" and faburen like '%"+request.getParameter("faburen")+"%'";}
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
    <td><%=map.get("zuoyebianhao") %></td><td><%=map.get("biaoti") %></td><td><%=map.get("zuoyeyaoqiu") %></td><td><a href='<%=map.get("zuoye") %>' target='_blank'>����</a></td><td><%=map.get("kechengzhangjie") %></td><td><%=map.get("zhangjiemingcheng") %></td><td><%=map.get("tijiaoqixian") %></td><td><%=map.get("faburen") %></td><td><%=map.get("xingming") %></td>
    
    <td width="30" align="center"> <a href="zuoyexinxidetail.jsp?id=<%=map.get("id")%>" >��ϸ</a></td>
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
