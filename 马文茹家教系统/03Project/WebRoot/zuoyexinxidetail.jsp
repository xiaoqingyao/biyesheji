<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
<head>
<%
	String id=request.getParameter("id");
	HashMap mqt = new CommDAO().getmap(id,"zuoyexinxi");
	//ldlbfz
     %>
<title>作业信息</title>
<!--bixanjxiqxi-->
<LINK href="qtimages/style.css" type=text/css rel=stylesheet>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<script language=javascript src='js/popup.js'></script>
<script language=javascript> 
function hsgpinglun(nbiao,nid){ 
popheight=450;
pop('hsgpinglun.jsp?biao='+nbiao+'&id='+nid,'在线评论',550,250) ;
}
function tijiao(){
	location.href='xueshengdatiadd.jsp?id=<%=mqt.get("id")%>';
	
}
</script> 

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
                        <td width="17%" align="center"><strong>作业信息</strong></td>
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
		 <td width='11%'>作业编号：</td><td width='39%'><%=mqt.get("zuoyebianhao")%></td><td width='11%'>标题：</td><td width='39%'><%=mqt.get("biaoti")%></td></tr><tr><td width='11%'>作业要求：</td><td width='39%'><%=mqt.get("zuoyeyaoqiu")%></td><td width='11%'>作业：</td><td width='39%'><a href='<%=mqt.get("zuoye")%>'>点此下载</a></td></tr><tr><td width='11%'>课程章节：</td><td width='39%'><%=mqt.get("kechengzhangjie")%></td><td width='11%'>章节名称：</td><td width='39%'><%=mqt.get("zhangjiemingcheng")%></td></tr><tr><td width='11%'>提交期限：</td><td width='39%'><%=mqt.get("tijiaoqixian")%></td><td width='11%'>发布人：</td><td width='39%'><%=mqt.get("faburen")%></td></tr><tr><td width='11%'>姓名：</td><td width='39%'><%=mqt.get("xingming")%></td><td width='11%'>备注：</td><td width='39%'><%=mqt.get("beizhu")%></td></tr><tr><td colspan=4 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" />
<input type=button name=Submit52 value=打印 onClick="javascript:window.print()"  /> 
<%
if (request.getSession().getAttribute("cx").equals("学生"))
{
	out.println("<input type=button name=Submit53 value=作业提交  onClick='tijiao()' />");
}
%>

</td>
		 </tr>
    
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
