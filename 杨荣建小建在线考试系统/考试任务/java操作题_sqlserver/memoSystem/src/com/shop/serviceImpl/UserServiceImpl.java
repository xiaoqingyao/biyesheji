package com.shop.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.shop.mapper.UserMapper;
import com.shop.po.User;
import com.shop.service.UserService;

//@Service(value="userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;
	@Override
	public User loginFindByUnameAndPwd(String username, String password)
			throws Exception {
		User user=new User();
		user.setUsername(username);
		user.setUserPwd(password);
		List<User> list = userMapper.selectByExample(user);
		if(list.size()>0 && list!=null){
			return list.get(0);
		}
		return null;
	}


}
