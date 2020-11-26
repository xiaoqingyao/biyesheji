package com.shop.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.Utils.PageBean;
import com.shop.po.Message;
import com.shop.po.User;
import com.shop.service.ReproductionService;


@Controller
public class ReproductionController {
	
	@Autowired
	private ReproductionService reproductionService;

	@RequestMapping("/saveReproduction")
	public String saveMessage(@RequestParam String messageinfo,@RequestParam String nickname,@RequestParam String address,@RequestParam String qq,@RequestParam String phone,HttpServletRequest request,Model model) throws Exception {
		Message Message = new Message();
		 
		User loginUser = (User) request.getSession().getAttribute("loginUser");
		if(loginUser==null){
			model.addAttribute("message", "对不起您还没有登录");
			return "msg";
		}
 
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		//System.out.println("第二次"+model.qq.toString());
		
		Message.setAddress(address);
		Message.setPhone(phone);
		Message.setQq(qq);
		Message.setNickname(nickname);
		Message.setMessage(messageinfo);
		Message.setUid(loginUser.getUid());
		Message.setLeibie("单身配对");
		Message.setMessagedate(sdf.format(new Date()));
		

		reproductionService.insertMessage(Message);
		 
		request.getSession().setAttribute("Message", Message);
		return "redirect:/reproductionlist.action?page=1";
	}

	 
	// 显示留言板全部留言
	@RequestMapping("/reproductionlist")
	public String messageList(@RequestParam int page, Model model,
			HttpServletRequest request) throws Exception {
		PageBean<Message> pageBean = reproductionService.findAllMessageByPage(page,"单身配对");
		model.addAttribute("pageBean", pageBean);
		return "ReproductionList";
	} 
}
