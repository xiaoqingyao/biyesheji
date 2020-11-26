package com.shop.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.shop.po.User;

public interface UserMapper {
   

    List<User> selectByExample(User example);

   
}