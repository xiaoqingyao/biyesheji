<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ck" uri="http://ckeditor.com"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
		<table>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1" 
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr
								style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #FFE4C4">

								<td align="center" height=30>序号</td>
								<td align="center" width=100>请求人称呼</td>
								<td align="center" width=80>手机</td>
								<td align="center" width=60>qq</td>
								<td align="center" width=150>地址</td>
								<td align="center" width=400>请求说明</td>
								<td align="center">发布日期</td>
					  
							</tr>
							<c:forEach items="${pageBean.list}" var="message"> 
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										 >${message.id}</td>

									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										 >${message.nickname}
									</td>	
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										 >${message.phone}
									</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										 >${message.qq}
									</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										 >${message.address}
									</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										 >${message.message}
									</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
									 >${message.messagedate}
									 </td>
									 
								</tr>
							</c:forEach>
						</table></td>
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