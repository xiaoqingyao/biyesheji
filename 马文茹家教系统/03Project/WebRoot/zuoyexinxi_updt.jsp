<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>��ҵ��Ϣ</title>
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
new CommDAO().update(request,response,"zuoyexinxi",ext,true,false,""); 
HashMap mmm = new CommDAO().getmap(id,"zuoyexinxi"); 
//lixanxdoxngcxhaxifxen
%>
  <form  action="zuoyexinxi_updt.jsp?f=f&id=<%=mmm.get("id")%>"  method="post" name="form1"  onsubmit="return checkform();">
  �޸���ҵ��Ϣ:
  <br><br>
 
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
          <tr><td>��ҵ��ţ�</td><td><input name='zuoyebianhao' type='text' id='zuoyebianhao' value='<%= mmm.get("zuoyebianhao")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>     <tr><td>���⣺</td><td><input name='biaoti' type='text' id='biaoti' size='50' value='<%=mmm.get("biaoti")%>' style='border:solid 1px #000000; color:#666666'/></td></tr>     <tr><td>��ҵҪ��</td><td><input name='zuoyeyaoqiu' type='text' id='zuoyeyaoqiu' size='50' value='<%=mmm.get("zuoyeyaoqiu")%>' style='border:solid 1px #000000; color:#666666'/></td></tr>     <tr><td>��ҵ��</td><td><input name='zuoye' type='text' id='zuoye' size='50' value='<%= mmm.get("zuoye")%>' style='border:solid 1px #000000; color:#666666' />&nbsp;<input type='button' value='�ϴ�' onClick="up('zuoye')" style='border:solid 1px #000000; color:#666666'/></td></tr>     <tr><td>�γ��½ڣ�</td><td><input name='kechengzhangjie' type='text' id='kechengzhangjie' value='<%= mmm.get("kechengzhangjie")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>     <tr><td>�½����ƣ�</td><td><input name='zhangjiemingcheng' type='text' id='zhangjiemingcheng' size='50' value='<%=mmm.get("zhangjiemingcheng")%>' style='border:solid 1px #000000; color:#666666'/></td></tr>     <tr><td>�ύ���ޣ�</td><td><input name='tijiaoqixian' type='text' id='tijiaoqixian' value='<%= mmm.get("tijiaoqixian")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>     <tr><td>�����ˣ�</td><td><input name='faburen' type='text' id='faburen' value='<%= mmm.get("faburen")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>     <tr><td>������</td><td><input name='xingming' type='text' id='xingming' value='<%= mmm.get("xingming")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>     <tr><td>��ע��</td><td><textarea name='beizhu' cols='50' rows='5' id='beizhu' style='border:solid 1px #000000; color:#666666'><%=mmm.get("beizhu")%></textarea></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="�ύ" onclick="return check();" />
      <input type="reset" name="Submit2" value="����" /></td>
    </tr>
  </table>
</form>

  </body>
</html>


