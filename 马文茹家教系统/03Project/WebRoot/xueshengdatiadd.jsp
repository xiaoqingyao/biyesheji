<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
<head>
<title>学生答题</title>
<!--bixanjxiqxi-->
<LINK href="qtimages/style.css" type=text/css rel=stylesheet>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")=="")
{
	out.print("<script>alert('对不起,请您先登录!');location.href='index.jsp';</script>");
	return;
}
  String id="";
  id=request.getParameter("id");
  HashMap mlbdq = new CommDAO().getmap(id,"zuoyexinxi");
  String zuoyebianhao="";
  	String biaoti="";
  	String zuoyeyaoqiu="";
  	String tijiaoqixian="";
  	String faburen="";
  	
  zuoyebianhao=(String)mlbdq.get("zuoyebianhao");
  	biaoti=(String)mlbdq.get("biaoti");
  	zuoyeyaoqiu=(String)mlbdq.get("zuoyeyaoqiu");
  	tijiaoqixian=(String)mlbdq.get("tijiaoqixian");
  	faburen=(String)mlbdq.get("faburen");
  	

   %>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	<script language=javascript src='js/ajax.js'></script>
	<script language="javascript">
function checkform()
{
	var zuoyebianhaoobj = document.getElementById("zuoyebianhao"); if(zuoyebianhaoobj.value==""){document.getElementById("clabelzuoyebianhao").innerHTML="&nbsp;&nbsp;<font color=red>请输入作业编号</font>";return false;}else{document.getElementById("clabelzuoyebianhao").innerHTML="  "; } 
	var biaotiobj = document.getElementById("biaoti"); if(biaotiobj.value==""){document.getElementById("clabelbiaoti").innerHTML="&nbsp;&nbsp;<font color=red>请输入标题</font>";return false;}else{document.getElementById("clabelbiaoti").innerHTML="  "; } 
	var datiriqiobj = document.getElementById("datiriqi"); if(datiriqiobj.value==""){document.getElementById("clabeldatiriqi").innerHTML="&nbsp;&nbsp;<font color=red>请输入答题日期</font>";return false;}else{document.getElementById("clabeldatiriqi").innerHTML="  "; } 
	var xueshengobj = document.getElementById("xuesheng"); if(xueshengobj.value==""){document.getElementById("clabelxuesheng").innerHTML="&nbsp;&nbsp;<font color=red>请输入学生</font>";return false;}else{document.getElementById("clabelxuesheng").innerHTML="  "; } 
	<!--if(parseInt(document.form1.tijiaoqixian.value)<parseDatatime(document.form1.datiriqi.value)){alert("对不起，提交期限必需大于答题日期");return false;}-->
	
}
function gow()
{
	document.location.href="xueshengdatiadd.jsp?id=<%=id%>";
}
</script>
<!--hxsglxiangdxongjxs-->

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="1000" height="1160" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
	<tr>
		<td><%@ include file="qttop.jsp"%></td>
	</tr>
	<tr>
		<td><table id="__01" width="1000" height="804" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="top"><%@ include file="qtleft.jsp"%></td>
            <td valign="top"><table id="__01" width="770" height="804" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td valign="top"><table id="__01" width="770" height="276" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="770" height="36" background="qtimages/1_02_02_01_01.gif"><table width="98%" height="22" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="17%" align="center"><strong>学生答题</strong></td>
                        <td width="83%">&nbsp;</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><table id="__01" width="770" height="231" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="11" background="qtimages/1_02_02_01_02_01.gif">&nbsp;</td>
                        <td height="759" valign="top">
						
						 
  <% 
  
HashMap ext = new HashMap(); 
if(request.getParameter("f")!=null){
//qiuji
//wxfladd
ext.put("issh","否");
//youzhifu
//jitihuan
 }
new CommDAO().insert(request,response,"xueshengdati",ext,true,false,""); 
%>
   <form  action="xueshengdatiadd.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
    <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse"  class="newsline">  
       <tr><td  width="200">作业编号：</td><td><input name='zuoyebianhao' type='text' id='zuoyebianhao' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666'  readonly='readonly' />&nbsp;*<label id='clabelzuoyebianhao' /></td></tr><script language="javascript">document.form1.zuoyebianhao.value='<%=zuoyebianhao%>';</script>
		<tr><td  width="200">标题：</td><td><input name='biaoti' type='text' id='biaoti' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666'  readonly='readonly' />&nbsp;*<label id='clabelbiaoti' /></td></tr><script language="javascript">document.form1.biaoti.value='<%=biaoti%>';</script>
		<tr><td  width="200">作业要求：</td><td><input name='zuoyeyaoqiu' type='text' id='zuoyeyaoqiu' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.zuoyeyaoqiu.value='<%=zuoyeyaoqiu%>';</script>
		<tr style="display:none"><td  width="200">提交期限：</td><td><input name='tijiaoqixian' type='text' id='tijiaoqixian' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.tijiaoqixian.value='<%=tijiaoqixian%>';</script>
		<tr><td  width="200">发布人：</td><td><input name='faburen' type='text' id='faburen' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.faburen.value='<%=faburen%>';</script>
		<tr><td  width="200">答题日期：</td><td><input name='datiriqi' type='text' id='datiriqi' value='' onblur='checkform()' readonly='readonly' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd HH:mm:ss'})" style='width:120px; height:16px; border:solid 1px #000000; color:#666666'/>&nbsp;*<label id='clabeldatiriqi' /></td></tr>
		<tr><td  width="200">学生作业：</td><td><input name='xueshengzuoye' type='text' id='xueshengzuoye' size='50' value='' onblur='' style='border:solid 1px #000000; color:#666666' />&nbsp;<input type='button' value='上传' onClick="up('xueshengzuoye')" style='border:solid 1px #000000; color:#666666'/></td></tr>
		<tr><td  width="200">学生：</td><td><input name='xuesheng' type='text' id='xuesheng' onblur='checkform()' style='border:solid 1px #000000; color:#666666' value='<%=request.getSession().getAttribute("username")%>' readonly="readonly" />&nbsp;*<label id='clabelxuesheng' /></td></tr>
		<tr><td  width="200">姓名：</td><td><input name='xingming' type='text' id='xingming' value='<%=request.getSession().getAttribute("xm")%>' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>
		<tr style="display:none"><td>作业批改：</td><td><select name='zuoyepigai' id='zuoyepigai'><option value="无">无</option><option value="优秀">优秀</option><option value="良好">良好</option><option value="中等">中等</option><option value="及格">及格</option><option value="不及格">不及格</option></select></td></tr>
		<tr style='display:none'><td  width="200">作业点评：</td><td><textarea name='zuoyedianping' cols='50' rows='5' id='zuoyedianping' onblur='' style='border:solid 1px #000000; color:#666666' ></textarea></td></tr>
		
   
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交" onClick="return check();" style='border:solid 1px #000000; color:#666666' />
      <input type="reset" name="Submit2" value="重置" style='border:solid 1px #000000; color:#666666' /></td>
    </tr>
	</table>
  </form>
						 
						 </td>
                        <td width="10" background="qtimages/1_02_02_01_02_04.gif">&nbsp;</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><img src="qtimages/1_02_02_01_03.gif" width="770" height="9" alt=""></td>
                  </tr>
                </table></td>
              </tr>
              
            </table></td>
          </tr>
        </table></td>
	</tr>
	<tr>
		<td><%@ include file="qtdown.jsp"%></td>
	</tr>
</table>
<!-- dfexnxxiaxng -->
</body>
</html>
<!--suxilxatxihuxan-->
