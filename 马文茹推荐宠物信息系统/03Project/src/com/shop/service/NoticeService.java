package com.shop.service;

import com.shop.po.Notice;

public interface NoticeService {
	public void insertNotice(Notice messages) throws Exception;
	
	public String GetNotice(int messageid) throws Exception;
	 
}
