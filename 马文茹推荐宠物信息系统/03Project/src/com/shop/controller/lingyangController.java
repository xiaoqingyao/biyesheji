package com.shop.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.Utils.PageBean;
import com.shop.po.Adopt;
import com.shop.po.Message;
import com.shop.po.User;
import com.shop.service.AdoptService;


@Controller
public class lingyangController {
	@Autowired
	private AdoptService adoptService;

	 

	 
	// 显示留言板全部留言
	@RequestMapping("/lingyang")
	public String messageList(@RequestParam int page,@RequestParam int fromuid, Model model,
			HttpServletRequest request) throws Exception {
		model.addAttribute("id", page);
		model.addAttribute("fromuid", fromuid);
		return "Adopt";
	} 
	
	@RequestMapping("/saveAdopt")
	public String saveAdopt(@RequestParam int fromuid,@RequestParam int msgid,@RequestParam String messageinfo,@RequestParam String nickname,@RequestParam String address,@RequestParam String qq,@RequestParam String phone,HttpServletRequest request,Model model) throws Exception {
		Adopt adopt = new Adopt();
		 
		User loginUser = (User) request.getSession().getAttribute("loginUser");
		if(loginUser==null){
			model.addAttribute("message", "对不起您还没有登录");
			return "msg";
		}
 
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		//System.out.println("第二次"+model.qq.toString());
		
		adopt.setMid(msgid);
		adopt.setAddress(address);
		adopt.setPhone(phone);
		adopt.setQq(qq);
		adopt.setNickname(nickname);
		adopt.setMessage(messageinfo);
		adopt.setUid(loginUser.getUid());
		adopt.setMessagedate(sdf.format(new Date()));
		adopt.setFromuid(fromuid);
		 
		adoptService.insertAdopt(adopt);
		 
		//request.getSession().setAttribute("Message", Message);
		return "redirect:/messageList.action?page=1";
	}
	
	@RequestMapping("/lingyangqingqiu")
	public String lingyangqingqiu(Model model,
			HttpServletRequest request) throws Exception {
		User loginUser = (User) request.getSession().getAttribute("loginUser");
		if(loginUser==null){
			model.addAttribute("message", "对不起您还没有登录");
			return "msg";
		}
		int uid = loginUser.getUid();
		PageBean<Adopt> pageBean = adoptService.findAll(uid);
		model.addAttribute("pageBean", pageBean);
		return "lingyangqingqiu";
	} 
}
