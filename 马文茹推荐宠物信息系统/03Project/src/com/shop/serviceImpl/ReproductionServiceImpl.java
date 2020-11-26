package com.shop.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.shop.Utils.PageBean;
import com.shop.mapper.ReproductionMapper;
import com.shop.po.Message;
import com.shop.service.MessageService;
import com.shop.service.ReproductionService;


public class ReproductionServiceImpl implements ReproductionService {
	@Autowired
	private ReproductionMapper messagesMapper;
	
	public void insertMessage(Message messages) throws Exception{
		messagesMapper.insert(messages);
		
	}
	
	public PageBean<Message> findAllMessageByPage(int page,String leibie) throws Exception {
		PageBean<Message> pageBean = new PageBean<>();
//		设置这是第几页
		pageBean.setPage(page);
//		设置10个
		int limitPage =4;
		pageBean.setLimitPage(limitPage);
//		设置一共多少页
		int totlePage = 0;
//		查询一共有多少页
		totlePage = messagesMapper.countAllMessage();
		if(Math.ceil(totlePage % limitPage)==0){
			totlePage=totlePage / limitPage;
		}else{
			totlePage=totlePage / limitPage+1;
		}
		pageBean.setTotlePage(totlePage);
		int beginPage= (page-1)*limitPage;
		//商品集合
		List<Message> list = messagesMapper.findAllMessageByPage(beginPage, limitPage,leibie) ;
		pageBean.setList(list);
		return pageBean;
	}

	
	public void deleteMessage(int messageid) throws Exception {
		messagesMapper.deleteByPrimaryKey(messageid);
	}
}
