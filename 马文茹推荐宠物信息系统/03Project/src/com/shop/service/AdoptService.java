package com.shop.service;

import com.shop.Utils.PageBean;
import com.shop.po.Adopt;

public interface AdoptService {
	public void insertAdopt(Adopt messages) throws Exception;
	 
	public PageBean<Adopt> findAll(int fromuid) throws Exception;
	 
}
