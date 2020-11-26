package com.shop.mapper;


import com.shop.po.Notice;

public interface NoticeMapper {
   
public void insertNotice(Notice messages);
	
	public String GetNotice(int messageid) ;
	

}