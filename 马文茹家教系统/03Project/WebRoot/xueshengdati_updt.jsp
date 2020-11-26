<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>学生答题</title>
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
  修改学生答题:
  <br><br>
 
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
     
     <tr><td>作业编号：</td><td><input name='zuoyebianhao' type='text' id='zuoyebianhao' value='<%= mmm.get("zuoyebianhao")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>标题：</td><td><input name='biaoti' type='text' id='biaoti' value='<%= mmm.get("biaoti")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>作业要求：</td><td><input name='zuoyeyaoqiu' type='text' id='zuoyeyaoqiu' value='<%= mmm.get("zuoyeyaoqiu")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr style="display:none"><td>提交期限：</td><td><input name='tijiaoqixian' type='text' id='tijiaoqixian' value='<%= mmm.get("tijiaoqixian")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>发布人：</td><td><input name='faburen' type='text' id='faburen' value='<%= mmm.get("faburen")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>答题日期：</td><td><input name='datiriqi' type='text' id='datiriqi' value='<%= mmm.get("datiriqi")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>学生作业：</td><td><input name='xueshengzuoye' type='text' id='xueshengzuoye' size='50' value='<%= mmm.get("xueshengzuoye")%>' style='border:solid 1px #000000; color:#666666' />&nbsp;<input type='button' value='上传' onClick="up('xueshengzuoye')" style='border:solid 1px #000000; color:#666666'/></td></tr>
     <tr><td>学生：</td><td><input name='xuesheng' type='text' id='xuesheng' value='<%= mmm.get("xuesheng")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>姓名：</td><td><input name='xingming' type='text' id='xingming' value='<%= mmm.get("xingming")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr style='display:none'><td>作业批改：</td><td><select name='zuoyepigai' id='zuoyepigai'><option value="无">无</option><option value="优秀">优秀</option><option value="良好">良好</option><option value="中等">中等</option><option value="及格">及格</option><option value="不及格">不及格</option></select></td></tr><script language="javascript">document.form1.zuoyepigai.value='<%=mmm.get("zuoyepigai")%>';</script>
     <tr style='display:none'><td>作业点评：</td><td><textarea name='zuoyedianping' cols='50' rows='5' id='zuoyedianping' style='border:solid 1px #000000; color:#666666'><%=mmm.get("zuoyedianping")%></textarea></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交" onClick="return check();" />
      <input type="reset" name="Submit2" value="重置" /></td>
    </tr>
  </table>
</form>

  </body>
</html>


