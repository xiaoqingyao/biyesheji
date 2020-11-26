<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>课件信息</title>
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
new CommDAO().update(request,response,"kejianxinxi",ext,true,false,""); 
HashMap mmm = new CommDAO().getmap(id,"kejianxinxi"); 
//lixanxdoxngcxhaxifxen
%>
  <form  action="kejianxinxi_updt.jsp?f=f&id=<%=mmm.get("id")%>"  method="post" name="form1"  onsubmit="return checkform();">
  修改课件信息:
  <br><br>
 
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
          <tr><td>课件编号：</td><td><input name='kejianbianhao' type='text' id='kejianbianhao' value='<%= mmm.get("kejianbianhao")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>     <tr><td>课件名称：</td><td><input name='kejianmingcheng' type='text' id='kejianmingcheng' size='50' value='<%=mmm.get("kejianmingcheng")%>' style='border:solid 1px #000000; color:#666666'/></td></tr>     <tr><td>类型：</td><td><select name='leixing' id='leixing'><option value="视频">视频</option><option value="课件">课件</option><option value="参考资料">参考资料</option></select></td></tr><script language="javascript">document.form1.leixing.value='<%=mmm.get("leixing")%>';</script>     <tr><td>内容：</td><td><input name='neirong' type='text' id='neirong' size='50' value='<%= mmm.get("neirong")%>' style='border:solid 1px #000000; color:#666666' />&nbsp;<input type='button' value='上传' onClick="up('neirong')" style='border:solid 1px #000000; color:#666666'/></td></tr>     <tr><td>课件简介：</td><td><textarea name='kejianjianjie' cols='50' rows='5' id='kejianjianjie' style='border:solid 1px #000000; color:#666666'><%=mmm.get("kejianjianjie")%></textarea></td></tr>     <tr><td>上传人：</td><td><input name='shangchuanren' type='text' id='shangchuanren' value='<%= mmm.get("shangchuanren")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>     <tr><td>姓名：</td><td><input name='xingming' type='text' id='xingming' value='<%= mmm.get("xingming")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交" onclick="return check();" />
      <input type="reset" name="Submit2" value="重置" /></td>
    </tr>
  </table>
</form>

  </body>
</html>


