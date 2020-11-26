package com.shop.mapper;

import java.util.List;

import com.shop.Utils.PageBean;
import com.shop.po.Article;

public interface ArticleMapper {
   
	
	void insert(Article atirlce);
	
	List<Article> findAll();
	
    void AddLike(int id);
    
    Article find(int id);

}