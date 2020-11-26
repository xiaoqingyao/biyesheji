package com.shop.service;

import java.util.List;

import com.shop.po.User;


public interface UserService {
	
	 

	public User loginFindByUnameAndPwd(String username, String password)throws Exception;
	
 
}
