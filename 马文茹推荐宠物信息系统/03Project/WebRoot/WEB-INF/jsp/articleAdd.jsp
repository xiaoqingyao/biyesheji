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
	
		<form action="${ pageContext.request.contextPath }/saveArticle.action" method="post" enctype="multipart/form-data">
						<table style="border-spacing: 10px;border-collapse: separate;border: 1px solid;width:100%">
						<tr>
						<td colspan=2>
							<strong>养宠趣谈-文章发布</strong>
						</td></tr>				
								
						<tr><td width=80>文章标题：</td><td align=left><input type="text" name="title" style="width:500px"></input></td></tr>
						<tr><td>用户昵称：</td><td align=left><input type="text" name="nickname"></input></td></tr>
						
						<tr><td>照片：</td><td align=left><input type="file" name="fujian"></input></td></tr>
						<tr><td>分享内容：</td><td>
						<textarea rows="10" cols="10" id="content" name="content"></textarea>
						<ck:replace replace="content" basePath="ckeditor"></ck:replace>    
						</td></tr>
						
						<tr>
						<td colspan=2>
						<input type="submit" value="提交"></input>
						</td>
						</tr>
						
						</table>
				    	
				    	
				    	
				    </form>
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