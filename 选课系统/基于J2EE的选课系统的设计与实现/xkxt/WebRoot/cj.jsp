<%@ page language="java" import="java.util.*,com.util.*"  contentType="text/html;charset=gb2312"%>
 
<%@ include file="iframe/head.jsp" %>

<script type="text/javascript">
<!--
function sub()
{
	form1.submit();
}
//-->
</script>
<%
String message = (String)request.getAttribute("message");
	if(message == null){
		message = "";
	}
	if (!message.trim().equals("")){
		out.println("<script language='javascript'>");
		out.println("alert('"+message+"');");
		out.println("</script>");
	}
	request.removeAttribute("message");
%>
<%
	String username2=(String)session.getAttribute("id");
	if(username2==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{
		String sql=""; 
			sql="select * from cj where  stu='"+username2+"'  order by cj desc";
			int c=cb.getCount("select count(*) from cj where stu='"+username2+"' ");
			float ff=0;
%>
<BODY>
<TABLE  cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align="left" vAlign=top > 
<table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
     <tr class="head"> 
      <td width="5%" align="center">ID </td>
      <td  align="center">ѧ��</td>
      <td  align="center">�γ���</td> 
      <td  align="center">ѧ��</td> 
      <td  align="center">�ɼ�</td>
      <td  align="center">¼���ʦ</td>
    </tr>
    <%
			List pagelist3=cb.getCom(sql,6);	
				if(!pagelist3.isEmpty()){
				for(int i=0;i<pagelist3.size();i++){
					List pagelist2 =(ArrayList)pagelist3.get(i); 
					ff+=Float.parseFloat(pagelist2.get(3).toString());
			%> 
	<tr  class="trA" onMouseOver="this.className='trB'" onMouseOut="this.className='trA'"> 
      <td width='5%' align="center" style="border-bottom:1px dotted #ccc;"><%=i+1  %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(2).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(1).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(5).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(3).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(4).toString() %></td>
    </tr>
	
<%
	}}
%>  
 
	
	 <tr  class="trA" onMouseOver="this.className='trB'" onMouseOut="this.className='trA'"> 
      <td colspan=6 align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;">�ܷ�����<%=ff %> �� ƽ���֣�<%=ff/c %> ��</td>
    </tr>
	 </TABLE> 
	</td>
	</tr>
 
  </TBODY>
</TABLE>
<style media=print> 
.Noprint{display:none;}<!--�ñ���ʽ�ڴ�ӡʱ���طǴ�ӡ��Ŀ--> 
.PageNext{page-break-after: always;}<!--���Ʒ�ҳ--> 
</style> 
<object id="WebBrowser" width=0 height=0 classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"> 
</object> 

<center class="Noprint" > 
<input type=button value=��ӡ onclick=document.all.WebBrowser.ExecWB(6,1)> 
<input type=button value=ֱ�Ӵ�ӡ onclick=document.all.WebBrowser.ExecWB(6,6)> 
<input type=button value=ҳ������ onclick=document.all.WebBrowser.ExecWB(8,1)> 
<input type=button value=��ӡԤ�� onclick=document.all.WebBrowser.ExecWB(7,1)> 
</center>  
</BODY>
<%} %>
<%@ include file="iframe/foot.jsp"%>
