package com.shop.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.shop.mapper.MemoInfoMapper;
import com.shop.po.Memoinfo;

import com.shop.service.MemoInfoService;

//@Service(value="userService")
public class MemoInfoServiceImpl implements MemoInfoService {
	@Autowired
	private MemoInfoMapper memoinfo;
	

	@Override
	public List<Memoinfo> SelectAll(){
		return memoinfo.selectAll();
		
	}
	
	@Override
	public void deletebykey(Integer id) throws Exception {
		 memoinfo.deletebykey(id);
		
	}

}
