<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    
    <title>ѧ������</title>
	<!--bixanjxiqxi-->
	<LINK href="css.css" type=text/css rel=stylesheet>
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	   
  </head>
<%
//xuxyaxodenxglxu
  String id="";
  id=request.getParameter("id");
  HashMap mlbdq = new CommDAO().getmap(id,"zuoyexinxi");
 //islbd2q HashMap mlbdq = new CommDAO().getmaps("xuesheng",(String)request.getSession().getAttribute("username"),"zuoyexinxi");
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
<script language="javascript">

function gow()
{
	document.location.href="xueshengdati_add.jsp?id=<%=id%>";
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
new CommDAO().insert(request,response,"xueshengdati",ext,true,false,""); 
%>

  <body >
 <form  action="xueshengdati_add.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
  ���ѧ������:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
		<tr><td  width="200">��ҵ��ţ�</td><td><input name='zuoyebianhao' type='text' id='zuoyebianhao' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666'  readonly='readonly' />&nbsp;*<label id='clabelzuoyebianhao' /></td></tr><script language="javascript">document.form1.zuoyebianhao.value='<%=zuoyebianhao%>';</script>
		<tr><td  width="200">���⣺</td><td><input name='biaoti' type='text' id='biaoti' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666'  readonly='readonly' />&nbsp;*<label id='clabelbiaoti' /></td></tr><script language="javascript">document.form1.biaoti.value='<%=biaoti%>';</script>
		<tr><td  width="200">��ҵҪ��</td><td><input name='zuoyeyaoqiu' type='text' id='zuoyeyaoqiu' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.zuoyeyaoqiu.value='<%=zuoyeyaoqiu%>';</script>
		<tr><td  width="200">�ύ���ޣ�</td><td><input name='tijiaoqixian' type='text' id='tijiaoqixian' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.tijiaoqixian.value='<%=tijiaoqixian%>';</script>
		<tr><td  width="200">�����ˣ�</td><td><input name='faburen' type='text' id='faburen' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.faburen.value='<%=faburen%>';</script>
		<tr><td  width="200">�������ڣ�</td><td><input name='datiriqi' type='text' id='datiriqi' value='' onblur='checkform()' readonly='readonly' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd HH:mm:ss'})" style='width:120px; height:16px; border:solid 1px #000000; color:#666666'/>&nbsp;*<label id='clabeldatiriqi' /></td></tr>
		<tr><td  width="200">ѧ����ҵ��</td><td><input name='xueshengzuoye' type='text' id='xueshengzuoye' size='50' value='' onblur='' style='border:solid 1px #000000; color:#666666' />&nbsp;<input type='button' value='�ϴ�' onClick="up('xueshengzuoye')" style='border:solid 1px #000000; color:#666666'/></td></tr>
		<tr><td  width="200">ѧ����</td><td><input name='xuesheng' type='text' id='xuesheng' onblur='checkform()' style='border:solid 1px #000000; color:#666666' value='<%=request.getSession().getAttribute("username")%>' readonly="readonly" />&nbsp;*<label id='clabelxuesheng' /></td></tr>
		<tr><td  width="200">������</td><td><input name='xingming' type='text' id='xingming' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>
		<tr style="display:none"><td>��ҵ���ģ�</td><td><select name='zuoyepigai' id='zuoyepigai'><option value="��">��</option><option value="����">����</option><option value="����">����</option><option value="�е�">�е�</option><option value="����">����</option><option value="������">������</option></select></td></tr>
		<tr style='display:none'><td  width="200">��ҵ������</td><td><textarea name='zuoyedianping' cols='50' rows='5' id='zuoyedianping' onblur='' style='border:solid 1px #000000; color:#666666' ></textarea></td></tr>
		
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
 
	var zuoyebianhaoobj = document.getElementById("zuoyebianhao"); if(zuoyebianhaoobj.value==""){document.getElementById("clabelzuoyebianhao").innerHTML="&nbsp;&nbsp;<font color=red>��������ҵ���</font>";return false;}else{document.getElementById("clabelzuoyebianhao").innerHTML="  "; } 
	var biaotiobj = document.getElementById("biaoti"); if(biaotiobj.value==""){document.getElementById("clabelbiaoti").innerHTML="&nbsp;&nbsp;<font color=red>���������</font>";return false;}else{document.getElementById("clabelbiaoti").innerHTML="  "; } 
	var datiriqiobj = document.getElementById("datiriqi"); if(datiriqiobj.value==""){document.getElementById("clabeldatiriqi").innerHTML="&nbsp;&nbsp;<font color=red>�������������</font>";return false;}else{document.getElementById("clabeldatiriqi").innerHTML="  "; } 
	var xueshengobj = document.getElementById("xuesheng"); if(xueshengobj.value==""){document.getElementById("clabelxuesheng").innerHTML="&nbsp;&nbsp;<font color=red>������ѧ��</font>";return false;}else{document.getElementById("clabelxuesheng").innerHTML="  "; } 
	if(parseInt(document.form1.tijiaoqixian.value)<parseInt(document.form1.datiriqi.value)){alert("�Բ����ύ���ޱ�����ڴ�������");return false;}
	


return true;   
}   
popheight=450;
</script>  


