<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
<head>
<title>��ʦע��</title>
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
	var gonghaoobj = document.getElementById("gonghao"); if(gonghaoobj.value==""){document.getElementById("clabelgonghao").innerHTML="&nbsp;&nbsp;<font color=red>�����빤��</font>";return false;}else{document.getElementById("clabelgonghao").innerHTML="  "; } 
	var gonghaoobj = document.getElementById("gonghao");  
if(gonghaoobj.value!=""){  
var ajax = new AJAX();
ajax.post("factory/checkno.jsp?table=jiaoshizhuce&col=gonghao&value="+gonghaoobj.value+"&checktype=insert&ttime=<%=Info.getDateStr()%>") 
var msg = ajax.getValue();
if(msg.indexOf('Y')>-1){
document.getElementById("clabelgonghao").innerHTML="&nbsp;&nbsp;<font color=red>�����Ѵ���</font>";  
return false;
}else{document.getElementById("clabelgonghao").innerHTML="  ";  
}  
} 
	var mimaobj = document.getElementById("mima"); if(mimaobj.value==""){document.getElementById("clabelmima").innerHTML="&nbsp;&nbsp;<font color=red>����������</font>";return false;}else{document.getElementById("clabelmima").innerHTML="  "; } 
	var xingmingobj = document.getElementById("xingming"); if(xingmingobj.value==""){document.getElementById("clabelxingming").innerHTML="&nbsp;&nbsp;<font color=red>����������</font>";return false;}else{document.getElementById("clabelxingming").innerHTML="  "; } 
	var xingbieobj = document.getElementById("xingbie"); if(xingbieobj.value==""){document.getElementById("clabelxingbie").innerHTML="&nbsp;&nbsp;<font color=red>�������Ա�</font>";return false;}else{document.getElementById("clabelxingbie").innerHTML="  "; } 
	var chushengnianyueobj = document.getElementById("chushengnianyue"); if(chushengnianyueobj.value==""){document.getElementById("clabelchushengnianyue").innerHTML="&nbsp;&nbsp;<font color=red>�������������</font>";return false;}else{document.getElementById("clabelchushengnianyue").innerHTML="  "; } 
	var gonglingobj = document.getElementById("gongling"); if(gonglingobj.value==""){document.getElementById("clabelgongling").innerHTML="&nbsp;&nbsp;<font color=red>�����빤��</font>";return false;}else{document.getElementById("clabelgongling").innerHTML="  "; } 
	var zhijiobj = document.getElementById("zhiji"); if(zhijiobj.value==""){document.getElementById("clabelzhiji").innerHTML="&nbsp;&nbsp;<font color=red>������ְ��</font>";return false;}else{document.getElementById("clabelzhiji").innerHTML="  "; } 
	var shoujiobj = document.getElementById("shouji"); if(shoujiobj.value==""){document.getElementById("clabelshouji").innerHTML="&nbsp;&nbsp;<font color=red>�������ֻ�</font>";return false;}else{document.getElementById("clabelshouji").innerHTML="  "; } 
	var shoujiobj = document.getElementById("shouji"); if(shoujiobj.value!=""){ if(/^1[3|4|5|8][0-9]\d{4,8}$/.test(shoujiobj.value)){document.getElementById("clabelshouji").innerHTML=""; }else{document.getElementById("clabelshouji").innerHTML="&nbsp;&nbsp;<font color=red>�����ֻ���ʽ</font>"; return false;}}  
    var youxiangobj = document.getElementById("youxiang"); if(youxiangobj.value==""){document.getElementById("clabelyouxiang").innerHTML="&nbsp;&nbsp;<font color=red>����������</font>";return false;}else{document.getElementById("clabelyouxiang").innerHTML="  "; } 
	var youxiangobj = document.getElementById("youxiang"); if(youxiangobj.value!=""){ if(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/.test(youxiangobj.value)){document.getElementById("clabelyouxiang").innerHTML=""; }else{document.getElementById("clabelyouxiang").innerHTML="&nbsp;&nbsp;<font color=red>���������ʽ</font>"; return false;}}  
    
}
function gow()
{
	document.location.href="jiaoshizhuceadd.jsp?id=<%=id%>";
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
                        <td width="17%" align="center"><strong>��ʦע��</strong></td>
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
//youshenhe
//youzhifu
//jitihuan
 }
new CommDAO().insert(request,response,"jiaoshizhuce",ext,true,false,""); 
%>
   <form  action="jiaoshizhuceadd.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
    <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse"  class="newsline">  
       <tr><td  width="200">���ţ�</td><td><input name='gonghao' type='text' id='gonghao' onblur='checkform()' style='border:solid 1px #000000; color:#666666' value=''  />&nbsp;*<label id='clabelgonghao' /></td></tr>
		<tr><td  width="200">���룺</td><td><input name='mima' type='text' id='mima' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelmima' /></td></tr>
		<tr><td  width="200">������</td><td><input name='xingming' type='text' id='xingming' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelxingming' /></td></tr>
		<tr><td>�Ա�</td><td><select name='xingbie' id='xingbie'><option value="��">��</option><option value="Ů">Ů</option></select>&nbsp;*<label id='clabelxingbie' /></td></tr>
		<tr><td width="200">�������£�</td><td><input name='chushengnianyue' type='text' id='chushengnianyue' value='' onblur='checkform()' readonly='readonly' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:100px; height:16px; border:solid 1px #000000; color:#666666'/>&nbsp;*<label id='clabelchushengnianyue' /></td></tr>
		<tr><td  width="200">���䣺</td><td><input name='gongling' type='text' id='gongling' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelgongling' /></td></tr>
		<tr><td>ְ����</td><td><select name='zhiji' id='zhiji'><option value="�߼�">�߼�</option><option value="�м�">�м�</option><option value="����">����</option></select>&nbsp;*<label id='clabelzhiji' /></td></tr>
		<tr><td  width="200">�ֻ���</td><td><input name='shouji' type='text' id='shouji' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelshouji' /></td></tr>
		<tr><td  width="200">���䣺</td><td><input name='youxiang' type='text' id='youxiang' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelyouxiang' /></td></tr>
		<tr><td  width="200">��ַ��</td><td><input name='dizhi' type='text' id='dizhi' value='' onblur='' size='50' style='border:solid 1px #000000; color:#666666' /></td></tr>
		<tr><td  width="200">ͷ��</td><td><input name='touxiang' type='text' id='touxiang' size='50' value='' onblur='' style='border:solid 1px #000000; color:#666666' />&nbsp;<input type='button' value='�ϴ�' onClick="up('touxiang')" style='border:solid 1px #000000; color:#666666'/></td></tr>
		<tr><td  width="200">��ע��</td><td><textarea name='beizhu' cols='50' rows='5' id='beizhu' onblur='' style='border:solid 1px #000000; color:#666666' ></textarea></td></tr>
		
   
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="�ύ" onClick="return check();" style='border:solid 1px #000000; color:#666666' />
      <input type="reset" name="Submit2" value="����" style='border:solid 1px #000000; color:#666666' /></td>
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
