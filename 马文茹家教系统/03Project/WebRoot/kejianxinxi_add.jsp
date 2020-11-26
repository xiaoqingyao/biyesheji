<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    
    <title>课件信息</title>
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
	document.location.href="kejianxinxi_add.jsp?id=<%=id%>";
}
</script>
<!--hxsglxiangdxongjxs-->
 <% 
HashMap ext = new HashMap(); 
if(request.getParameter("f")!=null){
//wxfladd
//qiuji
ext.put("issh","否");
//youzhifu
//jitihuan

}
new CommDAO().insert(request,response,"kejianxinxi",ext,true,false,""); 
%>

  <body >
 <form  action="kejianxinxi_add.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
  添加课件信息:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
		<tr><td  width="200">课件编号：</td><td><input name='kejianbianhao' type='text' id='kejianbianhao' value='<%=Info.getID()%>' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>
		<tr><td  width="200">课件名称：</td><td><input name='kejianmingcheng' type='text' id='kejianmingcheng' value='' onblur='checkform()' size='50' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelkejianmingcheng' /></td></tr>
		<tr><td>类型：</td><td><select name='leixing' id='leixing'><option value="视频">视频</option><option value="课件">课件</option><option value="参考资料">参考资料</option></select>&nbsp;*<label id='clabelleixing' /></td></tr>
		<tr><td  width="200">内容：</td><td><input name='neirong' type='text' id='neirong' size='50' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;<input type='button' value='上传' onClick="up('neirong')" style='border:solid 1px #000000; color:#666666'/>&nbsp;*<label id='clabelneirong' /></td></tr>
		<tr><td  width="200">课件简介：</td><td><textarea name='kejianjianjie' cols='50' rows='5' id='kejianjianjie' onblur='' style='border:solid 1px #000000; color:#666666' ></textarea></td></tr>
		<tr><td  width="200">上传人：</td><td><input name='shangchuanren' type='text' id='shangchuanren' onblur='checkform()' style='border:solid 1px #000000; color:#666666' value='<%=request.getSession().getAttribute("username")%>' readonly="readonly" />&nbsp;*<label id='clabelshangchuanren' /></td></tr>
		<tr><td  width="200">姓名：</td><td><input name='xingming' type='text' id='xingming' value='<%=request.getSession().getAttribute("xmm")%>' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>
		
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交"  style='border:solid 1px #000000; color:#666666' />
      <input type="reset" name="Submit2" value="重置" style='border:solid 1px #000000; color:#666666' /></td>
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
 
	var kejianmingchengobj = document.getElementById("kejianmingcheng"); if(kejianmingchengobj.value==""){document.getElementById("clabelkejianmingcheng").innerHTML="&nbsp;&nbsp;<font color=red>请输入课件名称</font>";return false;}else{document.getElementById("clabelkejianmingcheng").innerHTML="  "; } 
	var leixingobj = document.getElementById("leixing"); if(leixingobj.value==""){document.getElementById("clabelleixing").innerHTML="&nbsp;&nbsp;<font color=red>请输入类型</font>";return false;}else{document.getElementById("clabelleixing").innerHTML="  "; } 
	var neirongobj = document.getElementById("neirong"); if(neirongobj.value==""){document.getElementById("clabelneirong").innerHTML="&nbsp;&nbsp;<font color=red>请输入内容</font>";return false;}else{document.getElementById("clabelneirong").innerHTML="  "; } 
	var shangchuanrenobj = document.getElementById("shangchuanren"); if(shangchuanrenobj.value==""){document.getElementById("clabelshangchuanren").innerHTML="&nbsp;&nbsp;<font color=red>请输入上传人</font>";return false;}else{document.getElementById("clabelshangchuanren").innerHTML="  "; } 
	


return true;   
}   
popheight=450;
</script>  


