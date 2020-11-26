package com.shop.service;

import com.shop.Utils.PageBean;
import com.shop.po.Adopt;
import com.shop.po.Article;

public interface ArticleService {
	public void insertArticle(Article messages) throws Exception;
	 
	public  PageBean<Article> findAll() throws Exception;
	
	public Article find (int id) throws Exception;
	
	public void AddLike(int id) throws Exception;
}
