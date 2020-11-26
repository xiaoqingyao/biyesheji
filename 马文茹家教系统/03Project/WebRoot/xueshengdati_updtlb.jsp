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

String tt="update xueshengdati set issh='是' where id='"+id+"' ";

 new CommDAO().commOper(tt);



%>
  <form  action="xueshengdati_updtlb.jsp?f=f&id=<%=mmm.get("id")%>"  method="post" name="form1"  onsubmit="return checkform();">
  设置学生答题:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
     <tr><td>作业批改：</td><td><select name='zuoyepigai' id='zuoyepigai' style='border:solid 1px #000000; color:#666666'>
       <option value="无">无</option>
       <option value="优秀">优秀</option>
       <option value="良好">良好</option>
       <option value="中等">中等</option>
       <option value="及格">及格</option>
       <option value="不及格">不及格</option>
     </select></td></tr><script language="javascript">document.form1.zuoyepigai.value='<%=mmm.get("zuoyepigai")%>';</script>
     <tr><td>作业点评：</td><td><textarea name='zuoyedianping' cols='50' rows='5' id='zuoyedianping' style='border:solid 1px #000000; color:#666666'><%=mmm.get("zuoyedianping")%></textarea></td></tr>
     
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交" onClick="return check();" />
      <input type="reset" name="Submit2" value="重置" /></td>
    </tr>
  </table>
</form>

  </body>
</html>


