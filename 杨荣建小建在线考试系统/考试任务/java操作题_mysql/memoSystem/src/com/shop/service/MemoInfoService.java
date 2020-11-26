package com.shop.service;

import java.util.List;

import com.shop.po.Memoinfo;


public interface MemoInfoService {
	
	 

	public List<Memoinfo> SelectAll()throws Exception;
	
	public void deletebykey(Integer id) throws Exception;
}
