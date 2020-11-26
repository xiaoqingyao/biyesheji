<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="ck" uri="http://ckeditor.com"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>宠物领养</title>
<link href="${pageContext.request.contextPath}/css/slider.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/common.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/index.css"
	rel="stylesheet" type="text/css" />

</head>
<body>
<div class="container header">
		<div class="span5">
			<div class="logo">
				<a href="${pageContext.request.contextPath}/index.action"> <img
					src="${pageContext.request.contextPath}/image/r___________renleipic_01/logo.gif"
					alt="乐乐爱宠之家" />
				</a>
			</div>
		</div>
		<div class="span9">
			<div class="headerAd">
				<img src="${pageContext.request.contextPath}/image/header.jpg"
					width="320" height="50" alt="正品保障" title="正品保障" />
			</div>
		</div>
		<%@ include file="menu.jsp"%>
	</div>
	<div class="container cart">
	<form action="${ pageContext.request.contextPath }/saveAdopt.action" method="post">
						<table style="border-spacing: 10px;border-collapse: separate;border: 1px solid;">
						<tr>
						<td colspan=4>
							<strong>发起领养申请</strong>
						</td></tr>
						<tr><td width=80>称呼：</td><td align=left><input type="text" name="nickname"></input></td>
						<td>电话：</td><td align=left><input type="text" name="phone"></input>
						
						<input type="hidden" name="msgid"  value="${id}"/>
						<input type="hidden" name="fromuid"  value="${fromuid}"/>
						</td>
						
						</tr>						 
						<tr><td>qq：</td><td align=left><input type="text" name="qq"></input></td>
						<td>地址：</td><td align=left><input type="text" name="address"></input></td></tr>
						<tr><td>申请说明：</td><td colspan=3>
						<textarea rows="10" cols="10" id="messageinfo" name="messageinfo"></textarea>
						<ck:replace replace="messageinfo" basePath="ckeditor"></ck:replace>    
						</td></tr>
						
						<tr>
						<td colspan=4>
						<input type="submit" value="提交"></input>
						</td>
						</tr>
						
						</table>
				    	
				    	
				    	
				    </form>
	</div>
</body>
</html>