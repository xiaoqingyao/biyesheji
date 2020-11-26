package com.shop.mapper;

import java.util.List;

import com.shop.po.Adopt;

public interface AdoptMapper {
   
	
	void insert(Adopt adpot);
	
	List<Adopt> findAllByUid(int msgid);
	
  

}