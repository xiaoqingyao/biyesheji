<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
<head>
<title>在线家教网</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-repeat: repeat-x;
	background-color: #3C8395;
}
.STYLE9 {color: #0000CC; font-size:12px}
.STYLE8 {color: #0033CC}
input {border-radius:3px;border:1px solid #000;}
-->
</style>
</head>
<script type="text/javascript">
 <%
String error = (String)request.getAttribute("error"); 
if(error!=null)
{
 %>
 alert("用户名或密码错误");
 <%}%>
 
  <%
String random = (String)request.getAttribute("random"); 
if(random!=null)
{
 %>
 alert("验证码错误");
 <%}%>
 
 popheight = 39;

function check()
{
	if(document.form1.username.value=="" || document.form1.pwd.value=="" || document.form1.pagerandom.value=="")
	{
		alert('请输入完整');
		//不提交到服务器
		return false;
	}
}

           function loadimage(){ 
document.getElementById("randImage").src = "image.jsp?"+Math.random(); 
} 

           
           </script>     
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!-- images/login.jpg -->
<table width="1024" height="728" border="0" align="center" cellpadding="0" cellspacing="0" background="" id="__01">
  <tr>
    <td height="183" colspan="3" ><table width="64%" height="56" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="56"></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td  rowspan="2">&nbsp;</td>
    <td width="100%" height="275" valign="bottom">
    <form action="zxjjw?ac=adminlogin&a=a" method="post" name="form1" style="display: inline">
    <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
    <td colspan=2>
    <div style="text-shadow:#CCCCCC 3px 0 0,#33CC33 0 1px 0,#33CC33 1px 0 0,#33CC33 0 -1px 0; font-size:38px;" align="center">
                    在线家教网后台
    </div>
    </td>
    </tr>
    <tr>
    <td height="70"></td>
    </tr>
      <tr>
        <td width="44" height="30"><span class="STYLE9">用户:</span></td>
        <td height="30" colspan="2"><input name="username" type="text" id="username" style="width:200px; height:16px; border:solid 1px #000000; color:#666666"></td>
      </tr>
      <tr>
        <td height="30"><span class="STYLE9">密码:</span></td>
        <td height="30" colspan="2"><input name="pwd" type="password" id="pwd" style="width:200px; height:16px; border:solid 1px #000000; color:#666666"></td>
      </tr>
      <tr style="display:none">
        <td height="30"><span class="STYLE9">权限:</span></td>
        <td height="30" colspan="2"><select name="cx" id="cx">
            <option value="管理员">管理员</option>
          </select>
        </td>
      </tr>
      <tr>
        <td height="30"><span class="STYLE9">验证码:</span></td>
        <td width="59" height="30"><input name="pagerandom" type="text" id="pagerandom" style=" height:20px; border:solid 1px #000000; color:#666666; width:50px" />
        <a href="javascript:loadimage();"><img alt="看不清请点我！" name="randImage" id="randImage" src="image.jsp" width="60" height="20" border="1" align="absmiddle"> </a>
        </td>
        <td width="102"></td>
      </tr>
      <tr>
      <td>
      </td>
        <td height="30" colspan="2"><input type="submit" name="Submit" value="登录" onClick="return check();" style="background:url(images/the_formbtn.gif) no-repeat;color:#000000;width:80px;height: 24px; border:0px;line-height:24px; font-size:12px;margin-right: 5px; cursor:pointer">
            <input type="reset" name="Submit2" value="重置" style="background:url(images/the_formbtn.gif) no-repeat;color:#000000;width:80px;height: 24px; border:0px;line-height:24px; font-size:12px;margin-right: 5px; cursor:pointer" ></td>
      </tr>
    </table>
	</form>
	</td>
    <td width="336" rowspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
</body>
</html>