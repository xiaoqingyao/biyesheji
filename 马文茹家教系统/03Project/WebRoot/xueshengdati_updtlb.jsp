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

String tt="update xueshengdati set issh='��' where id='"+id+"' ";

 new CommDAO().commOper(tt);



%>
  <form  action="xueshengdati_updtlb.jsp?f=f&id=<%=mmm.get("id")%>"  method="post" name="form1"  onsubmit="return checkform();">
  ����ѧ������:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
     <tr><td>��ҵ���ģ�</td><td><select name='zuoyepigai' id='zuoyepigai' style='border:solid 1px #000000; color:#666666'>
       <option value="��">��</option>
       <option value="����">����</option>
       <option value="����">����</option>
       <option value="�е�">�е�</option>
       <option value="����">����</option>
       <option value="������">������</option>
     </select></td></tr><script language="javascript">document.form1.zuoyepigai.value='<%=mmm.get("zuoyepigai")%>';</script>
     <tr><td>��ҵ������</td><td><textarea name='zuoyedianping' cols='50' rows='5' id='zuoyedianping' style='border:solid 1px #000000; color:#666666'><%=mmm.get("zuoyedianping")%></textarea></td></tr>
     
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="�ύ" onClick="return check();" />
      <input type="reset" name="Submit2" value="����" /></td>
    </tr>
  </table>
</form>

  </body>
</html>


