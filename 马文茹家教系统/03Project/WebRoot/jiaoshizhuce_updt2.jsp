<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    
    <title>��ʦע��</title>
	<!--bixanjxiqxi-->
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
    <LINK href="css.css" type=text/css rel=stylesheet>

  </head>

<!--hxsglxiangdxongjxs-->
  <body >
<% 

String id = request.getParameter("id"); 
HashMap ext = new HashMap(); 
new CommDAO().update(request,response,"jiaoshizhuce",ext,true,false,""); 
HashMap mmm = new CommDAO().getmaps("gonghao",(String)request.getSession().getAttribute("username"),"jiaoshizhuce"); 
%>
  <form  action="jiaoshizhuce_updt2.jsp?f=f&id=<%=mmm.get("id")%>"  method="post" name="f1"  onsubmit="return checkform();">
  �޸Ľ�ʦע��:
  <br><br>
  <%
  //lixanxdoxngcxhaxifxen
   %>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
          <tr><td>���ţ�</td><td><input name='gonghao' type='text' id='gonghao' value='<%= mmm.get("gonghao")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>     <tr><td>���룺</td><td><input name='mima' type='text' id='mima' value='<%= mmm.get("mima")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>     <tr><td>������</td><td><input name='xingming' type='text' id='xingming' value='<%= mmm.get("xingming")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>     <tr><td>�Ա�</td><td><select name='xingbie' id='xingbie'><option value="��">��</option><option value="Ů">Ů</option></select></td></tr><script language="javascript">document.form1.xingbie.value='<%=mmm.get("xingbie")%>';</script>     <tr><td>�������£�</td><td><input name='chushengnianyue' type='text' id='chushengnianyue' value='<%= mmm.get("chushengnianyue")%>' onclick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" readonly='readonly'  /></td></tr>     <tr><td>���䣺</td><td><input name='gongling' type='text' id='gongling' value='<%= mmm.get("gongling")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>     <tr><td>ְ����</td><td><select name='zhiji' id='zhiji'><option value="�߼�">�߼�</option><option value="�м�">�м�</option><option value="����">����</option></select></td></tr><script language="javascript">document.form1.zhiji.value='<%=mmm.get("zhiji")%>';</script>     <tr><td>�ֻ���</td><td><input name='shouji' type='text' id='shouji' value='<%= mmm.get("shouji")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>     <tr><td>���䣺</td><td><input name='youxiang' type='text' id='youxiang' value='<%= mmm.get("youxiang")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>     <tr><td>��ַ��</td><td><input name='dizhi' type='text' id='dizhi' size='50' value='<%=mmm.get("dizhi")%>' style='border:solid 1px #000000; color:#666666'/></td></tr>     <tr><td>ͷ��</td><td><input name='touxiang' type='text' id='touxiang' size='50' value='<%= mmm.get("touxiang")%>' style='border:solid 1px #000000; color:#666666' />&nbsp;<input type='button' value='�ϴ�' onClick="up('touxiang')" style='border:solid 1px #000000; color:#666666'/></td></tr>     <tr><td>��ע��</td><td><textarea name='beizhu' cols='50' rows='5' id='beizhu' style='border:solid 1px #000000; color:#666666'><%=mmm.get("beizhu")%></textarea></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="�ύ" onclick="return check();" />
      <input type="reset" name="Submit2" value="����" /></td>
    </tr>
  </table>
</form>

  </body>
</html>


