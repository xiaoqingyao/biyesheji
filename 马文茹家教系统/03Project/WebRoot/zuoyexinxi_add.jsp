<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    
    <title>��ҵ��Ϣ</title>
	<!--bixanjxiqxi-->
	<LINK href="css.css" type=text/css rel=stylesheet>
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	   
  </head>
<%
//xuxyaxodenxglxu
  String id="";
 //islbd1q id=request.getParameter("id");
 //islbd1q HashMap mlbdq = new CommDAO().getmap(id,"melieibaoduqubiaoiguo");
 //islbd2q HashMap mlbdq = new CommDAO().getmaps("hsgzhujian",(String)request.getSession().getAttribute("username"),"melieibaoduqubiaoiguo");
 //islbdq gogogogogo
 //islbdq lelelelelele

   %>
<script language="javascript">

function gow()
{
	document.location.href="zuoyexinxi_add.jsp?id=<%=id%>";
}
</script>
<!--hxsglxiangdxongjxs-->
 <% 
HashMap ext = new HashMap(); 
if(request.getParameter("f")!=null){
//wxfladd
//qiuji
ext.put("issh","��");
//youzhifu
//jitihuan

}
new CommDAO().insert(request,response,"zuoyexinxi",ext,true,false,""); 
%>

  <body >
 <form  action="zuoyexinxi_add.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
  �����ҵ��Ϣ:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
		<tr><td  width="200">��ҵ��ţ�</td><td><input name='zuoyebianhao' type='text' id='zuoyebianhao' value='<%=Info.getID()%>' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>
		<tr><td  width="200">���⣺</td><td><input name='biaoti' type='text' id='biaoti' value='' onblur='checkform()' size='50' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelbiaoti' /></td></tr>
		<tr><td  width="200">��ҵҪ��</td><td><input name='zuoyeyaoqiu' type='text' id='zuoyeyaoqiu' value='' onblur='' size='50' style='border:solid 1px #000000; color:#666666' /></td></tr>
		<tr><td  width="200">��ҵ��</td><td><input name='zuoye' type='text' id='zuoye' size='50' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;<input type='button' value='�ϴ�' onClick="up('zuoye')" style='border:solid 1px #000000; color:#666666'/>&nbsp;*<label id='clabelzuoye' /></td></tr>
		<tr><td  width="200">�γ��½ڣ�</td><td><input name='kechengzhangjie' type='text' id='kechengzhangjie' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelkechengzhangjie' /></td></tr>
		<tr><td  width="200">�½����ƣ�</td><td><input name='zhangjiemingcheng' type='text' id='zhangjiemingcheng' value='' onblur='checkform()' size='50' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelzhangjiemingcheng' /></td></tr>
		<tr><td  width="200">�ύ���ޣ�</td><td><input name='tijiaoqixian' type='text' id='tijiaoqixian' value='' onblur='' readonly='readonly' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd HH:mm:ss'})" style='width:120px; height:16px; border:solid 1px #000000; color:#666666'/></td></tr>
		<tr><td  width="200">�����ˣ�</td><td><input name='faburen' type='text' id='faburen' onblur='checkform()' style='border:solid 1px #000000; color:#666666' value='<%=request.getSession().getAttribute("username")%>' readonly="readonly" />&nbsp;*<label id='clabelfaburen' /></td></tr>
		<tr><td  width="200">������</td><td><input name='xingming' type='text' id='xingming' value='<%=request.getSession().getAttribute("xmm")%>' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>
		<tr><td  width="200">��ע��</td><td><textarea name='beizhu' cols='50' rows='5' id='beizhu' onblur='' style='border:solid 1px #000000; color:#666666' ></textarea></td></tr>
		
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="�ύ"  style='border:solid 1px #000000; color:#666666' />
      <input type="reset" name="Submit2" value="����" style='border:solid 1px #000000; color:#666666' /></td>
    </tr>
  </table>
</form>

  </body>
</html>

<!--suxilxatxihuxan-->


<script language=javascript src='js/My97DatePicker/WdatePicker.js'></script>
<script language=javascript src='js/ajax.js'></script>

<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 

<script language=javascript >  
 
 function checkform(){  
 
	var biaotiobj = document.getElementById("biaoti"); if(biaotiobj.value==""){document.getElementById("clabelbiaoti").innerHTML="&nbsp;&nbsp;<font color=red>���������</font>";return false;}else{document.getElementById("clabelbiaoti").innerHTML="  "; } 
	var zuoyeobj = document.getElementById("zuoye"); if(zuoyeobj.value==""){document.getElementById("clabelzuoye").innerHTML="&nbsp;&nbsp;<font color=red>��������ҵ</font>";return false;}else{document.getElementById("clabelzuoye").innerHTML="  "; } 
	var kechengzhangjieobj = document.getElementById("kechengzhangjie"); if(kechengzhangjieobj.value==""){document.getElementById("clabelkechengzhangjie").innerHTML="&nbsp;&nbsp;<font color=red>������γ��½�</font>";return false;}else{document.getElementById("clabelkechengzhangjie").innerHTML="  "; } 
	var zhangjiemingchengobj = document.getElementById("zhangjiemingcheng"); if(zhangjiemingchengobj.value==""){document.getElementById("clabelzhangjiemingcheng").innerHTML="&nbsp;&nbsp;<font color=red>�������½�����</font>";return false;}else{document.getElementById("clabelzhangjiemingcheng").innerHTML="  "; } 
	var faburenobj = document.getElementById("faburen"); if(faburenobj.value==""){document.getElementById("clabelfaburen").innerHTML="&nbsp;&nbsp;<font color=red>�����뷢����</font>";return false;}else{document.getElementById("clabelfaburen").innerHTML="  "; } 
	


return true;   
}   
popheight=450;
</script>  


