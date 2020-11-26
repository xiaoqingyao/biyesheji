package com.shop.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.shop.po.Memoinfo;;

public interface MemoInfoMapper {
   

    List<Memoinfo> selectAll();

    void  deletebykey(Integer id );
}