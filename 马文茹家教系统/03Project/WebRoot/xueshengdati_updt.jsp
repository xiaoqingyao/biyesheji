<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>ѧ������</title>
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
//wxfladd
new CommDAO().update(request,response,"xueshengdati",ext,true,false,""); 
HashMap mmm = new CommDAO().getmap(id,"xueshengdati"); 
//lixanxdoxngcxhaxifxen
%>
  <form  action="xueshengdati_updt.jsp?f=f&id=<%=mmm.get("id")%>"  method="post" name="form1"  onsubmit="return checkform();">
  �޸�ѧ������:
  <br><br>
 
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
     
     <tr><td>��ҵ��ţ�</td><td><input name='zuoyebianhao' type='text' id='zuoyebianhao' value='<%= mmm.get("zuoyebianhao")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>���⣺</td><td><input name='biaoti' type='text' id='biaoti' value='<%= mmm.get("biaoti")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>��ҵҪ��</td><td><input name='zuoyeyaoqiu' type='text' id='zuoyeyaoqiu' value='<%= mmm.get("zuoyeyaoqiu")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr style="display:none"><td>�ύ���ޣ�</td><td><input name='tijiaoqixian' type='text' id='tijiaoqixian' value='<%= mmm.get("tijiaoqixian")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>�����ˣ�</td><td><input name='faburen' type='text' id='faburen' value='<%= mmm.get("faburen")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>�������ڣ�</td><td><input name='datiriqi' type='text' id='datiriqi' value='<%= mmm.get("datiriqi")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>ѧ����ҵ��</td><td><input name='xueshengzuoye' type='text' id='xueshengzuoye' size='50' value='<%= mmm.get("xueshengzuoye")%>' style='border:solid 1px #000000; color:#666666' />&nbsp;<input type='button' value='�ϴ�' onClick="up('xueshengzuoye')" style='border:solid 1px #000000; color:#666666'/></td></tr>
     <tr><td>ѧ����</td><td><input name='xuesheng' type='text' id='xuesheng' value='<%= mmm.get("xuesheng")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>������</td><td><input name='xingming' type='text' id='xingming' value='<%= mmm.get("xingming")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr style='display:none'><td>��ҵ���ģ�</td><td><select name='zuoyepigai' id='zuoyepigai'><option value="��">��</option><option value="����">����</option><option value="����">����</option><option value="�е�">�е�</option><option value="����">����</option><option value="������">������</option></select></td></tr><script language="javascript">document.form1.zuoyepigai.value='<%=mmm.get("zuoyepigai")%>';</script>
     <tr style='display:none'><td>��ҵ������</td><td><textarea name='zuoyedianping' cols='50' rows='5' id='zuoyedianping' style='border:solid 1px #000000; color:#666666'><%=mmm.get("zuoyedianping")%></textarea></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="�ύ" onClick="return check();" />
      <input type="reset" name="Submit2" value="����" /></td>
    </tr>
  </table>
</form>

  </body>
</html>


