package com.shop.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.shop.Utils.PageBean;
import com.shop.mapper.MessageMapper;
import com.shop.mapper.NoticeMapper;
import com.shop.po.Message;
import com.shop.po.Notice;
import com.shop.service.NoticeService;


public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeMapper noticeMapper;
	
	@Override
public void insertNotice(Notice messages) throws Exception{
	noticeMapper.insertNotice(messages);
}
	@Override
	public String GetNotice(int messageid) throws Exception{
		return	noticeMapper.GetNotice(1);//"";//
	}
	
}
