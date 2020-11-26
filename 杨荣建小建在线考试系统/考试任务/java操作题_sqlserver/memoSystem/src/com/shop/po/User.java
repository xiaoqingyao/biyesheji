package com.shop.po;

import java.util.List;

import javax.validation.constraints.Size;

public class User {
    private Integer userId;
    
    public Integer getUserid() {
        return userId;
    }

    public void setUserid(Integer uid) {
        this.userId = uid;
    }
    
    private String userName;
    
    public String getUsername() {
        return userName;
    }

    public void setUsername(String username) {
        this.userName = username;
    }
    
private Integer userSex;
    
    public Integer getUserSex() {
        return userSex;
    }

    public void setUserSex(Integer userSex) {
        this.userSex = userSex;
    }
    
private String userPwd;
    
    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }
    
private String userPhone;
    
    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }
    
private String mail;
    
    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

}