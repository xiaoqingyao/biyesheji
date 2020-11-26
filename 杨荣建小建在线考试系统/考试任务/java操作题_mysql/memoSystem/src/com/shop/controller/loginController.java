package com.shop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.exception.zdyException;
import com.shop.po.User;
import com.shop.service.UserService;

@Controller
public class loginController {

	@Autowired
	private UserService userService;

	@RequestMapping("login")
	public String login() {
		return "login";
	}

	// 用户登录
	@RequestMapping("/userLogin")
	public String userLogin(HttpServletRequest request,			 User user, Model model)
			throws zdyException, Exception {
		User loginUser = userService.loginFindByUnameAndPwd(user.getUsername(),
				user.getUserPwd());
		if (loginUser == null) {
			 request.getSession().setAttribute("message", "密码输入错误请重新登录");
			 return "redirect:login.action";
		}
		request.getSession().setAttribute("loginUser", loginUser);
		request.getSession().removeAttribute("message");
		return "redirect:memoinfo.action";
	}

	 
	
}
