<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<table border=1 style="width:100%">
			<tr>
			<td>
			<div style="font-size: 30px;text-align:center">${article.title}</div>
			</td>
			<tr>
			<td height=10></td>
			</tr>
			<tr>
			<td>
			<div style="font-size: 12px;text-align:center">	发布人：${article.nickname} &nbsp; &nbsp; &nbsp; &nbsp; 发布时间：${article.pubdate}</div>
		
			</td>
			</tr>
			<tr>
			<td height=10></td>
			</tr>
			<tr>
			<td style="font-size: 20px;text-indent: 40px;line-height: 45px;">
			<img src="${pageContext.request.contextPath}/${article.fujian}" style="max-height:400px;max-width:400px;">
			
			</td>
			</tr>
			<tr>
			<td height=10></td>
			</tr>
			<tr>
			<td style="font-size: 20px;text-indent: 40px;line-height: 45px;">
			${article.content}
			</td>
			</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe" style="font-size: 20px;text-indent: 40px;line-height: 45px;">

						</td>
				</tr>
		</table>
	</div>

	<div class="container footer">
		<div class="span24">
			<div class="footerAd">
				<img src="${pageContext.request.contextPath}/image/footer.jpg"
					width="950" height="52" alt="我们的优势" title="我们的优势">
			</div>
		</div>
		<div class="span24">
			<ul class="bottomNav">
				<li><hr></hr></li>
			</ul>
		</div>
		<div class="span24">
			<div class="copyright">Copyright ©乐乐爱宠之家 版权所有</div>
		</div>
	</div>
</body>
</html>