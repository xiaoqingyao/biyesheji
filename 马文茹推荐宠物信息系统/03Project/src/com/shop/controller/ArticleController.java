package com.shop.controller;

import java.io.File;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.shop.Utils.PageBean;
import com.shop.Utils.UUIDUtiils;
import com.shop.po.Article;
import com.shop.po.Message;
import com.shop.po.User;
import com.shop.service.ArticleService;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class ArticleController {
	@Autowired
	private ArticleService articleService;

	
		// 显示留言板全部留言
		@RequestMapping("/articleList")
		public String articleList(@RequestParam int page, Model model,
				HttpServletRequest request) throws Exception {
			PageBean<Article> pageBean = articleService.findAll();
			model.addAttribute("pageBean", pageBean);
			return "articleList";
		} 
		//文章详情
		@RequestMapping("/articleDetail")
		public String articleDetail(@RequestParam int page, Model model,
				HttpServletRequest request) throws Exception {
			Article article=articleService.find(page);
			model.addAttribute("article", article);
			return "articleDetail";			
		}
		//点赞
		@RequestMapping("/like")
		public String like(@RequestParam int page, Model model,
				HttpServletRequest request) throws Exception {
			 articleService.AddLike(page);
			return "redirect:/articleList.action?page=1";
		}
		//文章详情
		@RequestMapping("/articleAdd")
		public String articleAdd(HttpServletRequest request) throws Exception {
			 
			return "articleAdd";			
		}
		@RequestMapping("/saveArticle")
		public String saveArticle(@RequestParam MultipartFile fujian,@RequestParam String content,@RequestParam String title,@RequestParam String nickname,HttpServletRequest request,Model model) throws Exception {
			Article article = new Article();
			 
			User loginUser = (User) request.getSession().getAttribute("loginUser");
			if(loginUser==null){
				model.addAttribute("message", "对不起您还没有登录");
				return "msg";
			}
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			
			
			article.setUid(loginUser.getUid());
			article.setNickname(nickname);
			article.setTitle(title);
			article.setContent(content);
			article.setPubdate(sdf.format(new Date()));
			article.setLikecount(1);
			
//			上传图片
			if (fujian != null) {
				String path = request.getServletContext().getRealPath(
						"/products");
				
				String uploadFileName = fujian.getOriginalFilename();
				String fileName = UUIDUtiils.getUUID()+uploadFileName;
				File diskFile = new File(path + "//" + fileName);
				
				fujian.transferTo(diskFile);
				article.setFujian("products/" + fileName);
	 
			}
			
			
			
			
			articleService.insertArticle(article);
			
			return "redirect:/articleList.action?page=1";
		}
		
}
