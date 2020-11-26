package com.shop.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.shop.Utils.PageBean;
import com.shop.mapper.AdoptMapper;
import com.shop.po.Adopt;
import com.shop.service.AdoptService;


public class AdoptServiceImpl implements AdoptService {
	@Autowired
	private AdoptMapper adoptMapper;

	 
	  
	
	@Override
	public void insertAdopt(Adopt messages) throws Exception {
		adoptMapper.insert(messages);
	}

	@Override
	public PageBean<Adopt> findAll(int uid) throws Exception {
PageBean<Adopt> pageBean = new PageBean<Adopt>();
List<Adopt> list = adoptMapper.findAllByUid(uid);
pageBean.setList(list);
return pageBean;
	}
 
}
