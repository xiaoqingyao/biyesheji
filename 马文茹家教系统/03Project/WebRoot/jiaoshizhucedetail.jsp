<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
<head>
<title>��ʦע��</title>
<!--bixanjxiqxi-->
<LINK href="qtimages/style.css" type=text/css rel=stylesheet>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<script language=javascript src='js/popup.js'></script>
<script language=javascript> 
function hsgpinglun(nbiao,nid){ 
popheight=450;
pop('hsgpinglun.jsp?biao='+nbiao+'&id='+nid,'��������',550,250) ;
}
</script> 
<%
	String id=request.getParameter("id");
	HashMap mqt = new CommDAO().getmap(id,"jiaoshizhuce");
	//ldlbfz
     %>

 <% 
HashMap ext = new HashMap(); 
if(request.getParameter("gh")!=null){
//wxfladd
//qiuji
ext.put("issh","��");
//youzhifu
//jitihuan

}
if(request.getParameter("gh")!=null){
	ArrayList<String> aList=new ArrayList<String>();
    String gh =	request.getParameter("gh");
    if(request.getSession().getAttribute("username")==null){
    	response.sendRedirect("/zxjjw/");
    }
    String yhm = request.getSession().getAttribute("username").toString();
    aList.add("delete from duizhao where teaid = '"+gh+"' and stuid = '"+yhm+"'");
	aList.add("insert into duizhao(teaid,stuid,issh) values('"+gh+"','"+yhm+"','��')");
	new CommDAO().commOperSqls(aList);
	out.println("<script>alert('����ɹ�����ʦͨ������Կ�����ʦ��������ҵ');</script>");
}
%>

     
	
	
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
                        <td width="17%" align="center"><strong>��ʦע��</strong></td>
                        <td width="83%">&nbsp;</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><table id="__01" width="770" height="231" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="11" background="qtimages/1_02_02_01_02_01.gif">&nbsp;</td>
                        <td height="759" valign="top">
						
						 
   <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse"  class="newsline">  
      <tr>
		 <td width='11%' height=44>���ţ�</td><td width='39%'><%=mqt.get("gonghao")%></td><td  rowspan=10 align=center><a href=<%=mqt.get("touxiang")%> target=_blank><img src=<%=mqt.get("touxiang")%> width=228 height=215 border=0></a></td></tr><tr><!--          <td width='11%' height=44>���룺</td><td width='39%'>******</td></tr><tr> -->         <td width='11%' height=44>������</td><td width='39%'><%=mqt.get("xingming")%></td></tr><tr>         <td width='11%' height=44>�Ա�</td><td width='39%'><%=mqt.get("xingbie")%></td></tr><tr>         <td width='11%' height=44>�������£�</td><td width='39%'><%=mqt.get("chushengnianyue")%></td></tr><tr>         <td width='11%' height=44>���䣺</td><td width='39%'><%=mqt.get("gongling")%></td></tr><tr>         <td width='11%' height=44>ְ����</td><td width='39%'><%=mqt.get("zhiji")%></td></tr><tr>         <td width='11%' height=44>�ֻ���</td><td width='39%'><%=mqt.get("shouji")%></td></tr><tr>         <td width='11%' height=44>���䣺</td><td width='39%'><%=mqt.get("youxiang")%></td></tr><tr>         <td width='11%' height=44>��ַ��</td><td width='39%'><%=mqt.get("dizhi")%></td></tr><tr>                           <td width='11%' height=100  >��ע��</td><td width='39%' colspan=2 height=100 ><%=mqt.get("beizhu")%></td></tr><tr><td colspan=3 align=center><input type=button name=Submit5 value=���� onClick="javascript:history.back()" /><input type=button name=Submit52 value=��ӡ onClick="javascript:window.print()" />

<form action="jiaoshizhucedetail.jsp?gh=<%=mqt.get("gonghao")%>&id=<%=id %>" method="post" name="f11" id="f11" style="display: inline">

<%
if (request.getSession().getAttribute("username")!=null)
{
	out.println("<input type=submit name=Submit52 value=����ҽ� />");
}
%>



</form>
</td></tr>
    
  </table>
						 
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
