package com.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.po.Memoinfo;
import com.shop.po.User;
import com.shop.service.MemoInfoService;

@Controller
public class MemoInfoController {

	@Autowired
	private MemoInfoService service;

	@RequestMapping("memoinfo")
	public String login(Model model) {
		List<Memoinfo> infos = null;
		try {
			infos = service.SelectAll();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("infos", infos);
		return "memoManage";
	}
	 
	@RequestMapping("/del")
	public void Del(HttpServletRequest request,
			HttpServletResponse response, @RequestParam Integer id) {
		response.setContentType("text/html;charset=UTF-8");
		try {
			service.deletebykey(id);
			response.getWriter().write("1");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
 
	
}
