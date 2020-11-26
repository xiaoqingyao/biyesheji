<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
<head>
<title>作业信息</title>
<!--bixanjxiqxi-->
<LINK href="qtimages/style.css" type=text/css rel=stylesheet>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
//xuxyaxodenxglxu
  String id="";
 //islbdq id=request.getParameter("id");
 //islbdq HashMap mlbdq = new CommDAO().getmap(id,"melieibaoduqubiaoiguo");
 //islbdq gogogogogo
 //islbdq lelelelelele

   %>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	<script language=javascript src='js/ajax.js'></script>
	<script language="javascript">
function checkform()
{
	var biaotiobj = document.getElementById("biaoti"); if(biaotiobj.value==""){document.getElementById("clabelbiaoti").innerHTML="&nbsp;&nbsp;<font color=red>请输入标题</font>";return false;}else{document.getElementById("clabelbiaoti").innerHTML="  "; } 	var zuoyeobj = document.getElementById("zuoye"); if(zuoyeobj.value==""){document.getElementById("clabelzuoye").innerHTML="&nbsp;&nbsp;<font color=red>请输入作业</font>";return false;}else{document.getElementById("clabelzuoye").innerHTML="  "; } 	var kechengzhangjieobj = document.getElementById("kechengzhangjie"); if(kechengzhangjieobj.value==""){document.getElementById("clabelkechengzhangjie").innerHTML="&nbsp;&nbsp;<font color=red>请输入课程章节</font>";return false;}else{document.getElementById("clabelkechengzhangjie").innerHTML="  "; } 	var zhangjiemingchengobj = document.getElementById("zhangjiemingcheng"); if(zhangjiemingchengobj.value==""){document.getElementById("clabelzhangjiemingcheng").innerHTML="&nbsp;&nbsp;<font color=red>请输入章节名称</font>";return false;}else{document.getElementById("clabelzhangjiemingcheng").innerHTML="  "; } 	var faburenobj = document.getElementById("faburen"); if(faburenobj.value==""){document.getElementById("clabelfaburen").innerHTML="&nbsp;&nbsp;<font color=red>请输入发布人</font>";return false;}else{document.getElementById("clabelfaburen").innerHTML="  "; } 	
}
function gow()
{
	document.location.href="zuoyexinxiadd.jsp?id=<%=id%>";
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
                        <td width="17%" align="center"><strong>作业信息</strong></td>
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
new CommDAO().insert(request,response,"zuoyexinxi",ext,true,false,""); 
%>
   <form  action="zuoyexinxiadd.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
    <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse"  class="newsline">  
       <tr><td  width="200">作业编号：</td><td><input name='zuoyebianhao' type='text' id='zuoyebianhao' value='<%=Info.getID()%>' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>		<tr><td  width="200">标题：</td><td><input name='biaoti' type='text' id='biaoti' value='' onblur='checkform()' size='50' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelbiaoti' /></td></tr>		<tr><td  width="200">作业要求：</td><td><input name='zuoyeyaoqiu' type='text' id='zuoyeyaoqiu' value='' onblur='' size='50' style='border:solid 1px #000000; color:#666666' /></td></tr>		<tr><td  width="200">作业：</td><td><input name='zuoye' type='text' id='zuoye' size='50' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;<input type='button' value='上传' onClick="up('zuoye')" style='border:solid 1px #000000; color:#666666'/>&nbsp;*<label id='clabelzuoye' /></td></tr>		<tr><td  width="200">课程章节：</td><td><input name='kechengzhangjie' type='text' id='kechengzhangjie' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelkechengzhangjie' /></td></tr>		<tr><td  width="200">章节名称：</td><td><input name='zhangjiemingcheng' type='text' id='zhangjiemingcheng' value='' onblur='checkform()' size='50' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelzhangjiemingcheng' /></td></tr>		<tr><td  width="200">提交期限：</td><td><input name='tijiaoqixian' type='text' id='tijiaoqixian' value='' onblur='' readonly='readonly' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd HH:mm:ss'})" style='width:120px; height:16px; border:solid 1px #000000; color:#666666'/></td></tr>		<tr><td  width="200">发布人：</td><td><input name='faburen' type='text' id='faburen' onblur='checkform()' style='border:solid 1px #000000; color:#666666' value='<%=request.getSession().getAttribute("username")%>' readonly="readonly" />&nbsp;*<label id='clabelfaburen' /></td></tr>		<tr><td  width="200">姓名：</td><td><input name='xingming' type='text' id='xingming' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>		<tr><td  width="200">备注：</td><td><textarea name='beizhu' cols='50' rows='5' id='beizhu' onblur='' style='border:solid 1px #000000; color:#666666' ></textarea></td></tr>		
   
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交" onclick="return check();" style='border:solid 1px #000000; color:#666666' />
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
