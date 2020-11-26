<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312" %>
<%@ include file="iframe/head.jsp" %>
<jsp:useBean id="code" scope="page" class="com.util.CheckCode" />
<SCRIPT language=javascript>
//检验表单的合法性
function checklogin() {
	if (document.form1.username.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\请输入您的用户名！");
		document.form1.username.focus();
	}
	else if (document.form1.password.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\请输入您的密码！");
		document.form1.password.focus();
	}
	 
	else{
	     form1.submit();
	}
}
</SCRIPT>
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
	String yzm=code.getCheckCode();
%>
<FORM id=form1 name=form1 action=<%=basePath %>ComServlet?method=stuLogin method=post >
                                                                          <TABLE align=center id=Table7 width=400 border=0>
                                                                            <TBODY>
                                                                              <TR height=40>
                                                                                <TD vAlign=center align=middle colSpan=3>
								<FONT face=宋体></FONT><BR><STRONG>欢迎登录毕业设计选题系统</STRONG> 
									</TD></TR>
                                                                           
                                                                              <TR height=60>
                                                                                <TD align=right width=84 height=110>
								 
									</TD>
                                  <TD noWrap align=middle width=171>
                                    <TABLE width="100%" border=0>
                                      <TBODY>
                                    <TR>
                                  <TD width="35%" height=24>学　号：</TD>
                                  <TD>
								  <INPUT class=input_new id=username style="WIDTH: 110px" size=15 maxLength=10 name=username onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" 
                              onkeyup="value=value.replace(/[\W]/g,'')"  value=<%=request.getAttribute("reg_user")==null?"":request.getAttribute("reg_user") %>>
								  </TD>
								  </TR>
                                  <TR>
                                  <TD height=25>密　码：</TD>
                                  <TD height=25>
								  <INPUT class=input_new id=password style="WIDTH: 110px" type=password size=15  maxLength=16 name=password onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" 
                              onkeyup="value=value.replace(/[\W]/g,'')">
								  </TD>
								  </TR>
								  <TR>
                                  <TD height=25></TD>
                                  <TD height=25><input type=button value="登录" onClick="checklogin()"> </TD>
								  </TR>
                                   
								  </TBODY>
								  </TABLE>
								  </TD>
                                  <TD width=81>
								  <LABEL>
								  
								  </LABEL>
								  </TD>
								  </TR>
								   
							   
								</TBODY>
								</TABLE>
								</FORM>
<%@ include file="iframe/foot.jsp"%>
