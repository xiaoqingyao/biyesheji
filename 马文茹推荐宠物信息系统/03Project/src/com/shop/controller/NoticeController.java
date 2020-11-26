package com.shop.controller;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.po.Notice;
import com.shop.po.User;
import com.shop.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("/saveNotice")
	public String saveMessage(@RequestParam String content,HttpServletRequest request,Model model) throws Exception {
		User loginUser = (User) request.getSession().getAttribute("loginUser");
		if(loginUser==null){
			model.addAttribute("message", "对不起您还没有登录");
			return "msg";
		}
		Notice notice=new Notice();
		notice.content=content;
		noticeService.insertNotice(notice);
		
		return "redirect:/messageList.action?page=1";
	}
	
	// 显示留言板全部留言
	@RequestMapping("/noticeshow")
	public String messageList(@RequestParam int id, Model model,
			HttpServletRequest request) throws Exception {
	 String contents=	noticeService.GetNotice(1);
	 model.addAttribute("Content", contents);
	 return "NoticeShow";
	} 

}
