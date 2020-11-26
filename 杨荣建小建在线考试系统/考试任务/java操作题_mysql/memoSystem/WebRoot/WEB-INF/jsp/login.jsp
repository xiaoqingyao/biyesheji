<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>登录</title>

</head>
<body>

<form id="loginForm" method="post" 
					action="${pageContext.request.contextPath}/userLogin.action" novalidate="novalidate">
<div style="margin:0 auto; width: 400px;    height: 100px;      margin-top:400px;  ">
            <table >
                <tr>
                    <td>用户姓名：</td>
                    <td>

                       <input type="text" id="username" name="username"  maxlength="20"  >
                    </td>
                </tr>
                <tr>
                    <td>用户密码：</td>
                    <td>
	<input type="password" id="userPwd" name="userPwd"  maxlength="20"  >
					</td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:center">
                        <input type="submit" class="submit" value="登 录">
                       
                        <input type="reset" value="重置" /> ${message}
                    </td>
                </tr>
            </table>
        </div>
        
        
					</form>
					
</body>
</html>