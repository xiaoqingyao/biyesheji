<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    
    <title>学生答题</title>
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
ext.put("issh","否");
//youzhifu
//jitihuan

}
new CommDAO().insert(request,response,"xueshengdati",ext,true,false,""); 
%>

  <body >
 <form  action="xueshengdati_add.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
  添加学生答题:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
		<tr><td  width="200">作业编号：</td><td><input name='zuoyebianhao' type='text' id='zuoyebianhao' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666'  readonly='readonly' />&nbsp;*<label id='clabelzuoyebianhao' /></td></tr><script language="javascript">document.form1.zuoyebianhao.value='<%=zuoyebianhao%>';</script>
		<tr><td  width="200">标题：</td><td><input name='biaoti' type='text' id='biaoti' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666'  readonly='readonly' />&nbsp;*<label id='clabelbiaoti' /></td></tr><script language="javascript">document.form1.biaoti.value='<%=biaoti%>';</script>
		<tr><td  width="200">作业要求：</td><td><input name='zuoyeyaoqiu' type='text' id='zuoyeyaoqiu' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.zuoyeyaoqiu.value='<%=zuoyeyaoqiu%>';</script>
		<tr><td  width="200">提交期限：</td><td><input name='tijiaoqixian' type='text' id='tijiaoqixian' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.tijiaoqixian.value='<%=tijiaoqixian%>';</script>
		<tr><td  width="200">发布人：</td><td><input name='faburen' type='text' id='faburen' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.faburen.value='<%=faburen%>';</script>
		<tr><td  width="200">答题日期：</td><td><input name='datiriqi' type='text' id='datiriqi' value='' onblur='checkform()' readonly='readonly' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd HH:mm:ss'})" style='width:120px; height:16px; border:solid 1px #000000; color:#666666'/>&nbsp;*<label id='clabeldatiriqi' /></td></tr>
		<tr><td  width="200">学生作业：</td><td><input name='xueshengzuoye' type='text' id='xueshengzuoye' size='50' value='' onblur='' style='border:solid 1px #000000; color:#666666' />&nbsp;<input type='button' value='上传' onClick="up('xueshengzuoye')" style='border:solid 1px #000000; color:#666666'/></td></tr>
		<tr><td  width="200">学生：</td><td><input name='xuesheng' type='text' id='xuesheng' onblur='checkform()' style='border:solid 1px #000000; color:#666666' value='<%=request.getSession().getAttribute("username")%>' readonly="readonly" />&nbsp;*<label id='clabelxuesheng' /></td></tr>
		<tr><td  width="200">姓名：</td><td><input name='xingming' type='text' id='xingming' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>
		<tr style="display:none"><td>作业批改：</td><td><select name='zuoyepigai' id='zuoyepigai'><option value="无">无</option><option value="优秀">优秀</option><option value="良好">良好</option><option value="中等">中等</option><option value="及格">及格</option><option value="不及格">不及格</option></select></td></tr>
		<tr style='display:none'><td  width="200">作业点评：</td><td><textarea name='zuoyedianping' cols='50' rows='5' id='zuoyedianping' onblur='' style='border:solid 1px #000000; color:#666666' ></textarea></td></tr>
		
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
 
	var zuoyebianhaoobj = document.getElementById("zuoyebianhao"); if(zuoyebianhaoobj.value==""){document.getElementById("clabelzuoyebianhao").innerHTML="&nbsp;&nbsp;<font color=red>请输入作业编号</font>";return false;}else{document.getElementById("clabelzuoyebianhao").innerHTML="  "; } 
	var biaotiobj = document.getElementById("biaoti"); if(biaotiobj.value==""){document.getElementById("clabelbiaoti").innerHTML="&nbsp;&nbsp;<font color=red>请输入标题</font>";return false;}else{document.getElementById("clabelbiaoti").innerHTML="  "; } 
	var datiriqiobj = document.getElementById("datiriqi"); if(datiriqiobj.value==""){document.getElementById("clabeldatiriqi").innerHTML="&nbsp;&nbsp;<font color=red>请输入答题日期</font>";return false;}else{document.getElementById("clabeldatiriqi").innerHTML="  "; } 
	var xueshengobj = document.getElementById("xuesheng"); if(xueshengobj.value==""){document.getElementById("clabelxuesheng").innerHTML="&nbsp;&nbsp;<font color=red>请输入学生</font>";return false;}else{document.getElementById("clabelxuesheng").innerHTML="  "; } 
	if(parseInt(document.form1.tijiaoqixian.value)<parseInt(document.form1.datiriqi.value)){alert("对不起，提交期限必需大于答题日期");return false;}
	


return true;   
}   
popheight=450;
</script>  


