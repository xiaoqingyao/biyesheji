<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
 <% 
// HashMap ext = new HashMap(); 
// if(request.getParameter("gh")!=null){
// //wxfladd
// //qiuji
// ext.put("issh","·ñ");
// //youzhifu
// //jitihuan

// }
if(request.getParameter("gh")!=null){
	ArrayList<String> aList=new ArrayList<String>();
    String gh =	request.getParameter("gh");
    String yhm = request.getSession().getAttribute("username").toString();
    aList.add("delete from duizhao where teaid = '"+gh+"' and stuid = '"+yhm+"'");
	aList.add("insert into duizhao(teaid,stuid,status) values('"+gh+"','"+yhm+"',0)");
	new CommDAO().commOperSqls(aList);
	
}
%>

<script>
alert("Ìí¼Ó³É¹¦£¡");
</script>
<body>

</body>
</html>