package com.shop.po;

import java.util.Date;
import java.util.List;

import javax.validation.constraints.Size;

public class Memoinfo {
    private Integer memoId;
    
    public Integer getMemoId() {
        return memoId;
    }

    public void setUserid(Integer memoId) {
        this.memoId = memoId;
    }
    
    private String memoTitle;
    
    public String getMemoTitle() {
        return memoTitle;
    }

    public void setMemoTitle(String memoTitle) {
        this.memoTitle = memoTitle;
    }
    
private String memoContent;
    
    public String getMemoContent() {
        return memoContent;
    }

    public void setMemoContent(String memoContent) {
        this.memoContent = memoContent;
    }
    
    
    
private Date beginTime;
    
    public Date getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(Date beginTime) {
        this.beginTime = beginTime;
    }
    
private Date endTime;
    
    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }
    
private Integer userUserId;
    
    public Integer getUserId() {
        return userUserId;
    }

    public void setUserId(Integer userUserId) {
        this.userUserId = userUserId;
    }
}