<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%>
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String dir=sn.getDir();
%>
<HTML><HEAD><TITLE>后台操作区</TITLE>
<LINK href="<%=basePath %><%=dir %>/images/Admin_Style.css" type=text/css rel=stylesheet>
<LINK href="<%=basePath %><%=dir %>/images/style.css" type=text/css rel=stylesheet>
<SCRIPT language=JavaScript src="<%=basePath %>images/calendar.js"></SCRIPT>
<STYLE type=text/css>
BODY {
	MARGIN-LEFT: 0px; BACKGROUND-COLOR: #ffffff
}
.STYLE1 {color: #ECE9D8}
</STYLE>
</HEAD>
<script type="text/javascript">
function sub()
{// kcm,zy, xs, xz, dd, sj, js,
	if(document.form1.kcm.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.form1.zy.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.form1.xs.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.form1.dd.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.form1.sj.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.form1.xkks.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.form1.xkjs.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("所有项目必须填写！");
		//document.form1.title.focus();
		return false;
	}
	 
	form1.submit();
}
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
	String username=(String)session.getAttribute("user");
	if(username==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{
		String method=request.getParameter("method");
		String id="";String kcm = "";	String zy="";String xs="";String xz="";String dd="";String sj="";String js="";
		String xkks="";String xkjs="";
		if(method.equals("upXx")){
			id=request.getParameter("id");
			List listt = cb.get1Com("select * from xxk where id='"+id+"'",10);
			kcm=listt.get(1).toString();
			zy=listt.get(2).toString();
			xs=listt.get(3).toString();
			xz=listt.get(4).toString();
			dd=listt.get(5).toString();
			sj=listt.get(6).toString();
			js=listt.get(7).toString(); 
			xkks=listt.get(8).toString().substring(0,10); 
			xkjs=listt.get(9).toString().substring(0,10); 
		}		
		
%>
<BODY >
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align="left" vAlign=top ><form name="form1" action="<%=basePath %>ComServlet" method="post"  >
<table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
 
	
  <tr bgcolor='#FFFFFF'> <input type="hidden" name="method" value="<%=method %>"> <input type="hidden" name="id" value="<%=id %>">
    <td width='45%'><div align="right">课题名称：</div></td>
    <td ><input name="kcm" type="text" size="20" maxlength="100" value="<%=kcm %>"></td>
  </tr>
  <tr bgcolor='#FFFFFF'>  
    <td width='45%'><div align="right">课题要求：</div></td>
    <td >
    <input name="zy" type="text" size="20" maxlength="100" value="<%=zy %>">
    </td>
  </tr>
  <tr bgcolor='#FFFFFF'>  
    <td width='45%'><div align="right">总分：</div></td>
    <td ><input name="xs" type="text" size="20" maxlength="100" value="<%=xs %>"></td>
  </tr>
  <tr bgcolor='#FFFFFF'>  
    <td width='45%'><div align="right">课题简要说明：</div></td>
    <td ><input name="xz" type="text" size="30" maxlength="100" value="<%=xz %>"></td>
  </tr>
  <tr bgcolor='#FFFFFF'>  
    <td width='45%'><div align="right">答辩地点：</div></td>
    <td ><input name="dd" type="text" size="20" maxlength="100" value="<%=dd %>"></td>
  </tr>
  <tr bgcolor='#FFFFFF'>  
    <td width='45%'><div align="right">答辩时间：</div></td>
    <td ><input name="sj" type="text" size="20" maxlength="100" value="<%=sj %>"></td>
  </tr>
  <tr bgcolor='#FFFFFF'>  
    <td width='45%'><div align="right">指导教师：</div></td>
    <td ><select name=js>
    <%
    	List jslist=cb.getCom("select * from teacher order by id desc",5);
    	if(!jslist.isEmpty()){
    		for(int i=0;i<jslist.size();i++){
    			List list2=(List)jslist.get(i);%>
    			<option value=<%=list2.get(1).toString() %>><%=list2.get(3).toString() %></option>
    <%}} %>
    </select></td>
  </tr>
  <tr bgcolor='#FFFFFF'>  
    <td width='45%'><div align="right">课题选择时间：</div></td>
    <td ><input name="xkks" type="text" size="20" maxlength="100" value="<%=xkks %>"  readonly onclick="SelectDate(this,'yyyy-MM-dd')"  this.Txt_Date.Attributes["onclick"] = "SelectDate(this,'yyyy-MM-dd')";> - 
    <input name="xkjs" type="text" size="20" maxlength="100" value="<%=xkjs %>"  readonly onclick="SelectDate(this,'yyyy-MM-dd')"  this.Txt_Date.Attributes["onclick"] = "SelectDate(this,'yyyy-MM-dd')";>
    </td>
  </tr>
   <tr bgcolor='#FFFFFF'> 
      <td colspan="2" align="center"> 
        <input class=mmcinb type='button' name='button' value='提交数据' onclick='sub()'>
      </td>
    </tr>

</table>	</form>
   </TD>
	</TR>
  </TBODY>
</TABLE>
</BODY>
<%} %>
</HTML>
