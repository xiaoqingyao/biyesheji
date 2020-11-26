package com.shop.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.shop.Utils.PageBean;
import com.shop.mapper.ArticleMapper;
import com.shop.po.Adopt;
import com.shop.po.Article;
import com.shop.service.ArticleService;


public class ArticleServiceImpl implements ArticleService {
	@Autowired
	private ArticleMapper articleMapper;

	@Override
	public void insertArticle(Article messages) throws Exception{
		articleMapper.insert(messages);
	}
	@Override
	public PageBean<Article> findAll() throws Exception{
		
		PageBean<Article> pageBean = new PageBean<Article>();
		List<Article> list = articleMapper.findAll();
		pageBean.setList(list);
		return pageBean;
	}
	@Override
	public Article find(int id) throws Exception{
		 return articleMapper.find(id);
	}
	@Override
	public void AddLike(int id) throws Exception{
		articleMapper.AddLike(id);
	}
}
